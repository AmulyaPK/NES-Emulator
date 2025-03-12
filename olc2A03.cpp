#include "olc2A03.h"

olc2A03::olc2A03() {

}

olc2A03::~olc2A03() {

}

void olc2A03::cpuWrite(uint16_t addr, uint8_t data) {
    switch (addr) {
        case 0x4000:
            switch ((data & 0xC0) >> 6) {
                case 0x00: pulse1_seq.sequence = 0b00000001; break;
                case 0x01: pulse1_seq.sequence = 0b00000011; break;
                case 0x02: pulse1_seq.sequence = 0b00001111; break;
                case 0x03: pulse1_seq.sequence = 0b11111100; break;
            }
            break;

        case 0x4001:
            break;

        case 0x4002:
            pulse1_seq.reload = (pulse1_seq.reload & 0xFF00) | data;
            break;

        case 0x4003:
            pulse1_seq.reload = (uint16_t)((data & 0x07)) << 8 | (pulse1_seq.reload & 0x00FF);
            pulse1_seq.timer = pulse1_seq.reload;
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
            break;

        case 0x400E:
            break;

        case 0x4015:
            pulse1_enable = data & 0x01;
            break;

        case 0x400F:
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
        pulse1_seq.clock(pulse1_enable, [](uint32_t &s)
            {
                // Shift right by 1 bit, wrapping around
                s = ((s & 0x0001) << 7) | ((s & 0x00FE) >> 1);
            });
        pulse1_sample = (double)pulse1_seq.output;
    }
    clock_counter++;
}

void olc2A03::reset() {

}

double olc2A03::GetOutputSample() {
    return pulse1_sample;
}