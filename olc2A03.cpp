#include "olc2A03.h"

uint8_t olc2A03::length_table[] = {10, 254, 20, 2, 40, 4, 80, 6, 160, 8, 60, 10, 14, 12, 26, 14, 12, 16, 24, 18, 48, 20, 96, 22, 192, 24, 72, 26, 16, 28, 32, 30};

olc2A03::olc2A03() {
    noise_seq.sequence = 0xDBDB;
}

olc2A03::~olc2A03() {

}

void olc2A03::cpuWrite(uint16_t addr, uint8_t data) {
    switch (addr) {
        case 0x4000:
            switch ((data & 0xC0) >> 6) {
                case 0x00: pulse1_seq.sequence = 0b00000001; pulse1_osc.dutycycle = 0.125; break;
                case 0x01: pulse1_seq.sequence = 0b00000011; pulse1_osc.dutycycle = 0.250; break;
                case 0x02: pulse1_seq.sequence = 0b00001111; pulse1_osc.dutycycle = 0.500; break;
                case 0x03: pulse1_seq.sequence = 0b11111100; pulse1_osc.dutycycle = 0.750; break;
            }
            pulse1_seq.sequence = pulse1_seq.new_sequence;
            pulse1_halt = (data & 0x20);
            pulse1_env.volume = (data & 0x0F);
            pulse1_env.disable = (data & 0x10);
            break;

        case 0x4001:
            pulse1_sweep.enabled = data & 0x80;
            pulse1_sweep.period = (data & 0x70) >> 4;
            pulse1_sweep.down = data & 0x08;
            pulse1_sweep.shift = data & 0x07;
            pulse1_sweep.reload = true;
            break;

        case 0x4002:
            pulse1_seq.reload = (pulse1_seq.reload & 0xFF00) | data;
            break;

        case 0x4003:
            pulse1_seq.reload = (uint16_t)((data & 0x07)) << 8 | (pulse1_seq.reload & 0x00FF);
            pulse1_seq.timer = pulse1_seq.reload;
            pulse1_seq.sequence = pulse1_seq.new_sequence;
            pulse1_lc.counter = length_table[(data & 0xF8) >> 3];
            pulse1_env.start = true;
            break;

        case 0x4004:
            break;

        case 0x4005:
            break;

        case 0x4006:
            break;

        case 0x4007:
            break;

        case 0x4008:
            break;

        case 0x400C:
            noise_env.volume = (data & 0x0F);
            noise_env.disable = (data & 0x10);
            noise_halt = (data & 0x20);
            break;

        case 0x400E:
            switch (data & 0x0F)
            {
            case 0x00: noise_seq.reload = 0; break;
            case 0x01: noise_seq.reload = 4; break;
            case 0x02: noise_seq.reload = 8; break;
            case 0x03: noise_seq.reload = 16; break;
            case 0x04: noise_seq.reload = 32; break;
            case 0x05: noise_seq.reload = 64; break;
            case 0x06: noise_seq.reload = 96; break;
            case 0x07: noise_seq.reload = 128; break;
            case 0x08: noise_seq.reload = 160; break;
            case 0x09: noise_seq.reload = 202; break;
            case 0x0A: noise_seq.reload = 254; break;
            case 0x0B: noise_seq.reload = 380; break;
            case 0x0C: noise_seq.reload = 508; break;
            case 0x0D: noise_seq.reload = 1016; break;
            case 0x0E: noise_seq.reload = 2034; break;
            case 0x0F: noise_seq.reload = 4068; break;
            }
            break;

        case 0x4015:
            pulse1_enable = data & 0x01;
            noise_enable = data & 0x04;
            break;

        case 0x400F:
            pulse1_env.start = true;
            noise_env.start = true;
            noise_lc.counter = length_table[(data & 0xF8) >> 3];
            break;
    }
}

uint8_t olc2A03::cpuRead(uint16_t addr) {
    return 0x00;
}

void olc2A03::clock() {
    // The clock for the APU runs at half the rate of the CPU clock and the CPU clock runs at third the rate of PPU clock.
    // Hence the clock of the APU runs at a sixth of the PPU clock.
    
    bool bQuarterFrameClock = false;
    bool bHalfFrameClock = false;

    dGlobalTime += (0.3333333333 / 1789773);

    if (clock_counter % 6 == 0) {
        frame_clock_counter++;

        // 4-step sequence mode
        if (frame_clock_counter == 3729) {
            bQuarterFrameClock = true;
        }
        if (frame_clock_counter == 7457) {
            bQuarterFrameClock = true;
            bHalfFrameClock = true;
        }
        if (frame_clock_counter == 11186) {
            bQuarterFrameClock = true;
        }
        if (frame_clock_counter == 14916) {
            bQuarterFrameClock = true;
            bHalfFrameClock = true;
            frame_clock_counter = 0;
        }

        // Quarter frame "beats" adjust the volume envelope
        if (bQuarterFrameClock) {

        }

        // Half frame "beats" adjust the note length and frequence sweepers
        if (bHalfFrameClock) {

        }

        // Update pulse1 channel:
        // pulse1_seq.clock(pulse1_enable, [](uint32_t &s)
        //     {
        //         // Shift right by 1 bit, wrapping around
        //         s = ((s & 0x0001) << 7) | ((s & 0x00FE) >> 1);
        //     });
        // pulse1_sample = (double)pulse1_seq.output;

        pulse1_osc.frequency = 1789773.0 / (16.0 * (double)(pulse1_seq.reload + 1));
        pulse1_sample = pulse1_osc.sample(dGlobalTime);
    }
    clock_counter++;
}

void olc2A03::reset() {

}

double olc2A03::GetOutputSample() {
    return pulse1_sample;
}