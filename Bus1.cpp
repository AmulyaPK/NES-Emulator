
#include "Bus.h"

Bus::Bus(){
    //Clear RAM contents
    for(auto &i : cpuRam){
        i = 0x00;
    }

    cpu.ConnectBus(this);

}

Bus:: ~Bus(){

}

void Bus::cpuWrite(uint16_t addr, uint8_t data){
    if(addr >= 0x0000 && addr <= 0xFFFF)  // Allow full 64KB range
        cpuRam[addr] = data;
}

uint8_t Bus::cpuRead(uint16_t addr, bool bReadOnly){
    if(addr >= 0x0000 && addr <= 0xFFFF)  // Allow full 64KB range
        return cpuRam[addr];
    return 0;
}