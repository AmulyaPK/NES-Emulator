#pragma once

#include<cstdint>
#include<functional>

class olc2A03 {
    public:
        olc2A03();
        ~olc2A03();
    public:
        void cpuWrite(uint16_t addr, uint8_t data);
        uint8_t cpuRead(uint16_t addr);
        void clock();
        void reset();

        double GetOutputSample(); // since sample mix together

    private:
        uint32_t frame_clock_counter = 0;
        uint32_t clock_counter = 0;

        struct sequencer {
            uint32_t sequence = 0x00000000;
            uint16_t timer = 0x0000;
            uint16_t reload = 0x0000;
            uint8_t output = 0x00;

            uint8_t clock (bool bEnable, std::function<void(uint32_t &s)> funcManip) {
                if (bEnable) {
                    timer--;
                    if (timer == 0xFFFF) {
                        timer = reload + 1;
                        funcManip(sequence);
                        output = sequence & 0x00000001;
                    }
                }

                return output;
            }
        };

        // SEQUENCER:
        // It is counter that counts down only when the sequencer ine anbled and clocked. If the counter becomes 0, 
        // we 'do something' and then reset the counter to some known value. What the sequencer does depends on the channel.
        // We can change the rate and which the sequencer is clocked and that will increases the rate and which the counter 
        // is counting down and hence the rate at which something is done.
        // We can also change the rate at which something is done by changing the reload value. If it is reloaded to a large value
        // it will take a longer time to reach 0.

        // If we have an 8-bit word 00001111. We can consider this to be a 50% duty cycle square wave. We can configure the 'do something'
        // function to rotate the square wave to 00011110 -> 00111100 -> 01111000 -> 11110000
        // If we increase the clock rate or decrease starting point of counter, we're changing the period between the 'do something' functions.
        // i.e. we have changed the frequency of the square wave.

        // The sequencer of the pulse wave channel sets the frequency of output wave form and sets the duty cycle of it.

        sequencer pulse1_seq;
        bool pulse1_enable = false;
        double pulse1_sample = 0.0;

};

// The audio system runs in one thread.
// The sound thread runs in real time and this is something we can't change.
// We can emulate the nes quickly, though. So every time the sound thread requests
// a new sample, we'll perform enough nes emulation to cover that time period of the sample.
// This means that the nes emulations needs to be controlled by the sound thread.
// This is called synchronizing to sound.

// nes emulation runs in another thread - real time, much faster than audio