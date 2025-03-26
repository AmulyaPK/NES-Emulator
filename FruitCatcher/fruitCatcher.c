#include <stdlib.h>

#include "LIB/nesdoug.h"
#include "LIB/neslib.h"
#include "metasprites.h"
#include "backNT.h"

#define totalPoss 15

const unsigned char paletteSpr[16] = {0x3c, 0x0f, 0x16, 0x2a, 0x3c, 0x0f,
                                      0x13, 0x2a, 0x3c, 0x0f, 0x18, 0x28,
                                      0x3c, 0x0f, 0x27, 0x2a};

const unsigned char paletteBG[16] = {0x1a, 0x37, 0x3c, 0x30, 0x1a, 0x01,
                                   0x21, 0x31, 0x1a, 0x06, 0x16, 0x26,
                                   0x1a, 0x09, 0x19, 0x29};

typedef struct sprites {
    unsigned char x;
    unsigned char y;
    unsigned char width;
    unsigned char height;
} sprites;

sprites basket = {128, 185, 31, 31};
unsigned char controller;

sprites fruits[totalPoss];
unsigned char visible[totalPoss];
unsigned char fruitType[totalPoss]; 
//Fruit Type:
//0 = Bomb
//1 = Banana
//2 = Apple
//3 = Orange
//4 = Watermelon
//5 = Grapes

void moveBasket() {
    if ((controller & PAD_LEFT) && (basket.x > 32)) {
        --basket.x;
    } else if ((controller & PAD_RIGHT) && (basket.x < 255)) {
        ++basket.x;
    }
}

unsigned char checkCollision(sprites fruit, sprites basket){
    if((fruit.x > basket.x - 32 && fruit.x - 16 < basket.x) && (fruit.y > basket.y - 28 && fruit.y - 16 < basket.y)){
        return 1;
    }
    return 0;
}

void main() {

    unsigned char speed = 30;
    unsigned char counter = 0;
    unsigned char score = 0;
    unsigned char i;

    ppu_off();
    pal_spr((const char*)paletteSpr);
    pal_bg((const char*)paletteBG);
    bank_bg(1);
    vram_adr(NAMETABLE_A);
    vram_unrle(backNT);

    ppu_on_all();
    for (i = 0; i < totalPoss; ++i) {
        visible[i] = 0;
        fruits[i].height = 15;
        fruits[i].width = 15;
        fruits[i].x = 0;
        fruits[i].y = 0;
        fruitType[i] = 0;
    }


    while (1) {
        ppu_wait_nmi();
        oam_clear();
        controller = pad_poll(0);
        moveBasket();
        oam_meta_spr(basket.x, basket.y, basketMS);
        ++counter;
        //Create a new Fruit/Bomb
        if(counter >= speed){
            counter = 0;
            for(i = 0; i < totalPoss; i++){
                if(visible[i] == 0){
                    visible[i] = 1;
                    fruitType[i] = rand8() % 6;
                    fruits[i].x = rand8() % 235 + 20;
                    fruits[i].y = 0;
                    break;
                }
            }
        }

        //Disappear the fruits fallen/caught in basket
        for (i = 0; i < totalPoss; ++i) {
            if (fruits[i].y > 180 || checkCollision(fruits[i], basket)) {
                visible[i] = 0;
            }
        }

        //Draw the visible fruits
        for (i = 0; i < totalPoss; ++i) {
            if (visible[i] == 1) {
                if(fruitType[i] == 0){
                    oam_meta_spr(fruits[i].x, fruits[i].y, bombMS);
                }else if(fruitType[i] == 1){
                    oam_meta_spr(fruits[i].x, fruits[i].y, bananaMS);
                }else if(fruitType[i] == 2){
                    oam_meta_spr(fruits[i].x, fruits[i].y, appleMS);
                }else if(fruitType[i] == 3){
                    oam_meta_spr(fruits[i].x, fruits[i].y, orangeMS);
                }else if(fruitType[i] == 4){
                    oam_meta_spr(fruits[i].x, fruits[i].y, watermelonMS);
                }else if(fruitType[i] == 5){
                    oam_meta_spr(fruits[i].x, fruits[i].y, grapesMS);
                }
                ++fruits[i].y;
            }
        }

    }
}
