@echo off

set name="fruitCatcher"

set path=%path%;C:\cc65\bin
set CC65_HOME=C:\cc65


cc65 -Oirs %name%.c --add-source
ca65 crt0.s
ca65 %name%.s -g

ld65 -C nrom_32k_vert.cfg -o %name%.nes crt0.o %name%.o nes.lib -Ln labels.txt --dbgfile dbg.txt

del *.o

move /Y labels.txt BUILD\ 
move /Y %name%.s BUILD\ 
move /Y %name%.nes BUILD\ 

pause

BUILD\%name%.nes