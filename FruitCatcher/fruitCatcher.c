#include "LIB/nesdoug.h"
#include "LIB/neslib.h"
#include "metasprites.h"
#include <stdlib.h>
#include <time.h>

const unsigned char paletteSpr[16] = {0x3c, 0x0f, 0x16, 0x2a, 0x3c, 0x0f,
                                      0x13, 0x2a, 0x3c, 0x0f, 0x18, 0x28,
                                      0x3c, 0x0f, 0x27, 0x2a};

const unsigned char paletteBG[16] = {0x31, 0x16, 0x22, 0x36, 0x31, 0x0f,
                                     0x0f, 0x0f, 0x31, 0x0f, 0x0f, 0x0f,
                                     0x31, 0x0f, 0x0f, 0x0f};

unsigned char yPos = 0x40;
unsigned char xPos2 = 0x10;

void main() {
    srand(time(0));
    ppu_off();

    pal_spr(paletteSpr);
    pal_bg(paletteBG);

    ppu_on_all();

    while (1) {
        ppu_wait_nmi();
        oam_clear();

        oam_meta_spr(xPos2 + 100, yPos, watermelon);
        oam_meta_spr(xPos2 + 20, yPos, basket);

        ++yPos;
    }
}
