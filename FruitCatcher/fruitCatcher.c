#include <stdlib.h>

#include "LIB/nesdoug.h"
#include "LIB/neslib.h"
#include "metasprites.h"
#include "tempBg.h"

const unsigned char paletteSpr[16] = {0x3c, 0x0f, 0x16, 0x2a, 0x3c, 0x0f,
                                      0x13, 0x2a, 0x3c, 0x0f, 0x18, 0x28,
                                      0x3c, 0x0f, 0x27, 0x2a};

const unsigned char paletteBG[16] = {0x3c, 0x19, 0x2a, 0x3c, 0x3c, 0x01,
                                     0x21, 0x31, 0x3c, 0x06, 0x16, 0x26,
                                     0x3c, 0x09, 0x19, 0x29};

struct sprites {
    unsigned char x;
    unsigned char y;
    unsigned char width;
    unsigned char height;
};

struct sprites basket = {128, 160, 31, 31};
unsigned char controller;

void moveBasket() {
    if ((controller & PAD_LEFT) && (basket.x > 32)) {
        --basket.x;
    } else if ((controller & PAD_RIGHT) && (basket.x < 255)) {
        ++basket.x;
    }
}

void main() {
    ppu_off();

    pal_spr(paletteSpr);
    pal_bg(paletteBG);
    bank_bg(1);
    vram_adr(NAMETABLE_A);
    vram_unrle(tempBg);

    ppu_on_all();

    while (1) {
        ppu_wait_nmi();
        oam_clear();
        controller = pad_poll(0);
        moveBasket();
        oam_meta_spr(basket.x, basket.y, basketMS);
    }
}
