﻿#pragma once

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
        bool bUseRawMode = false;

        static uint8_t length_table[];

        struct sequencer {
            uint32_t sequence = 0x00000000;
            uint32_t new_sequence = 0x00000000;
            uint16_t timer = 0x0000;
            uint16_t reload = 0x0000;
            uint8_t output = 0x00;

            uint8_t clock (bool bEnable, std::function<void(uint32_t &s)> funcManip) {
                if (bEnable) {
                    timer--;
                    if (timer == 0xFFFF) {
                        timer = reload;
                        funcManip(sequence);
                        output = sequence & 0x00000001;
                    }
                }
                return output;
            }
        };

        struct lengthcounter {
            uint8_t counter = 0x00;
            uint8_t clock (bool bEnable, bool bHalt) {
                if (!bEnable) counter = 0;
                else {
                    if (counter > 0 && !bHalt) counter--;
                }
                return counter;
            }
        };

        struct envelope {
            void clock (bool bLoop) {
                if (!start) {
                    if (divider_count == 0) {
                        divider_count = volume;
                        if (decay_count == 0) {
                            if (bLoop) {
                                decay_count = 15;
                            }
                        }
                        else decay_count--;
                    }
                    else {
                        divider_count--;
                    }
                }
                else {
                    start = false;
                    decay_count = 15;
                    divider_count = volume;
                }

                if (disable) {
                    output = volume;
                }
                else {
                    output = decay_count;
                }
            }

            bool start = false;
            bool disable = false;
            uint16_t divider_count = 0;
            uint16_t volume = 0;
            uint16_t output = 0;
            uint16_t decay_count = 0;
        };

        struct oscpulse {
            double frequency = 0;
            double dutycycle = 0;
            double amplitude = 0;
            double pi = 3.14159;
            double harmonics = 20;

            double sample (double t) {
                double a = 0;
                double b = 0;
                double p = dutycycle * 2.0 * pi;

                auto approxsin = [](double t) {
                    double j = t * 0.15915;
                    j = j - (int)j;
                    return 20.785 * j * (j - 0.5) * (j - 1.0);
                };

                for (double n = 1 ; n < harmonics ; n++) {
                    double c = n * frequency * 2.0 * pi * t;
                    a += -approxsin(c) / n;
                    b += -approxsin(c - p * n) / n;
                }

                return (2.0 * amplitude / pi) * (a - b);
            }
        };

        struct sweeper {
            bool enabled = false;
            bool down = false;
            bool reload = false;
            uint8_t shift = 0x00;
            uint8_t timer = 0x00;
            uint8_t period = 0x00;
            uint16_t change = 0;
            bool mute = false;

            void track (uint16_t &target) {
                if (enabled) {
                    change = target >> shift;
                    mute = (target < 8) || (target > 0x7FF);
                }
            }

            bool clock (uint16_t &target, bool channel) {
                bool changed = false;
                if (timer == 0 && enabled && shift > 0 && !mute) {
                    if (target >= 8 && change < 0x07FF) {
                        if (down) {
                            target -= change - channel;
                        }
                        else {
                            target += change;
                        }
                        changed = true;
                    }
                }

                // if (enabled) 
                {
                    if (timer == 0 || reload) {
                        timer = period;
                        reload = false;
                    }
                    else timer--;
                    mute = (target < 8) || (target > 0x7FF);
                }
                return changed;
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

        bool pulse1_enable = false;
        bool pulse1_halt = false;
        sequencer pulse1_seq;
        oscpulse pulse1_osc;
        double pulse1_sample = 0.0;
        double pulse1_output = 0.0;
        envelope pulse1_env;
        lengthcounter pulse1_lc;
        sweeper pulse1_sweep;

        double dGlobalTime = 0.0;

        // Square Wave Pulse Channel 2
        bool pulse2_enable = false;
        bool pulse2_halt = false;
        double pulse2_sample = 0.0;
        double pulse2_output = 0.0;
        sequencer pulse2_seq;
        oscpulse pulse2_osc;
        envelope pulse2_env;
        lengthcounter pulse2_lc;
        sweeper pulse2_sweep;

        bool noise_enable = false;
        bool noise_halt = false;
        envelope noise_env;
        lengthcounter noise_lc;
        sequencer noise_seq;
        double noise_sample = 0;
        double noise_output = 0;

    public:
        uint16_t pulse1_visual = 0;
        uint16_t pulse2_visual = 0;
        uint16_t noise_visual = 0;
        uint16_t triangle_visual = 0;
};

// The audio system runs in one thread.
// The sound thread runs in real time and this is something we can't change.
// We can emulate the nes quickly, though. So every time the sound thread requests
// a new sample, we'll perform enough nes emulation to cover that time period of the sample.
// This means that the nes emulations needs to be controlled by the sound thread.
// This is called synchronizing to sound.

// nes emulation runs in another thread - real time, much faster than audio