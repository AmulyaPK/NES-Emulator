;
; File generated by cc65 v 2.19 - Git 162bc6b
;
	.fopt		compiler,"cc65 v 2.19 - Git 162bc6b"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_pal_bg
	.import		_pal_spr
	.import		_ppu_wait_nmi
	.import		_ppu_off
	.import		_ppu_on_all
	.import		_oam_clear
	.import		_oam_spr
	.import		_oam_meta_spr
	.import		_pad_poll
	.import		_bank_bg
	.import		_rand8
	.import		_vram_adr
	.import		_vram_unrle
	.export		_backNT
	.export		_grapesMS
	.export		_bombMS
	.export		_watermelonMS
	.export		_appleMS
	.export		_bananaMS
	.export		_orangeMS
	.export		_basketMS
	.export		_paletteSpr
	.export		_paletteBG
	.export		_basket
	.export		_controller
	.export		_fruits
	.export		_heart
	.export		_visible
	.export		_fruitType
	.export		_heart_color
	.export		_scoreText
	.export		_score
	.export		_speed
	.export		_counter
	.export		_i
	.export		_c
	.export		_gameState
	.export		_playText
	.export		_gameOverText
	.export		_moveBasket
	.export		_checkCollision
	.export		_convertScoreToChar
	.export		_drawHearts
	.export		_updateHeart
	.export		_initializeNewGame
	.export		_main

.segment	"DATA"

_basket:
	.byte	$80
	.byte	$B9
	.byte	$1F
	.byte	$1F
_score:
	.word	$0000
_speed:
	.byte	$32
_counter:
	.byte	$00
_c:
	.byte	$02
_gameState:
	.byte	$00
_playText:
	.byte	$50
	.byte	$4C
	.byte	$41
	.byte	$59
	.byte	$21
_gameOverText:
	.byte	$47
	.byte	$41
	.byte	$4D
	.byte	$45
	.byte	$20
	.byte	$4F
	.byte	$56
	.byte	$45
	.byte	$52
	.byte	$21

.segment	"RODATA"

_backNT:
	.byte	$71
	.byte	$00
	.byte	$71
	.byte	$2E
	.byte	$01
	.byte	$15
	.byte	$00
	.byte	$71
	.byte	$1C
	.byte	$02
	.byte	$03
	.byte	$16
	.byte	$00
	.byte	$71
	.byte	$10
	.byte	$04
	.byte	$05
	.byte	$00
	.byte	$71
	.byte	$09
	.byte	$06
	.byte	$07
	.byte	$07
	.byte	$00
	.byte	$71
	.byte	$0A
	.byte	$17
	.byte	$11
	.byte	$18
	.byte	$00
	.byte	$00
	.byte	$08
	.byte	$09
	.byte	$0A
	.byte	$0B
	.byte	$00
	.byte	$71
	.byte	$0F
	.byte	$19
	.byte	$1A
	.byte	$00
	.byte	$71
	.byte	$04
	.byte	$13
	.byte	$13
	.byte	$1B
	.byte	$00
	.byte	$00
	.byte	$0C
	.byte	$0D
	.byte	$0D
	.byte	$0E
	.byte	$00
	.byte	$71
	.byte	$04
	.byte	$0F
	.byte	$00
	.byte	$71
	.byte	$08
	.byte	$1C
	.byte	$1D
	.byte	$1E
	.byte	$05
	.byte	$00
	.byte	$71
	.byte	$10
	.byte	$10
	.byte	$11
	.byte	$10
	.byte	$12
	.byte	$00
	.byte	$71
	.byte	$06
	.byte	$1F
	.byte	$07
	.byte	$07
	.byte	$20
	.byte	$00
	.byte	$71
	.byte	$10
	.byte	$13
	.byte	$71
	.byte	$02
	.byte	$14
	.byte	$00
	.byte	$71
	.byte	$FE
	.byte	$00
	.byte	$71
	.byte	$74
	.byte	$21
	.byte	$22
	.byte	$23
	.byte	$24
	.byte	$00
	.byte	$71
	.byte	$03
	.byte	$25
	.byte	$26
	.byte	$27
	.byte	$28
	.byte	$29
	.byte	$00
	.byte	$71
	.byte	$03
	.byte	$49
	.byte	$4A
	.byte	$4B
	.byte	$4C
	.byte	$00
	.byte	$71
	.byte	$04
	.byte	$4D
	.byte	$4E
	.byte	$4F
	.byte	$50
	.byte	$00
	.byte	$00
	.byte	$2A
	.byte	$2B
	.byte	$71
	.byte	$02
	.byte	$2C
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$2D
	.byte	$2E
	.byte	$2B
	.byte	$2B
	.byte	$2F
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$51
	.byte	$52
	.byte	$2B
	.byte	$2B
	.byte	$53
	.byte	$54
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$55
	.byte	$56
	.byte	$2B
	.byte	$2B
	.byte	$57
	.byte	$58
	.byte	$30
	.byte	$31
	.byte	$2B
	.byte	$32
	.byte	$33
	.byte	$34
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$35
	.byte	$36
	.byte	$37
	.byte	$2B
	.byte	$38
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$59
	.byte	$5A
	.byte	$5B
	.byte	$5C
	.byte	$5D
	.byte	$5E
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$5F
	.byte	$60
	.byte	$61
	.byte	$2B
	.byte	$62
	.byte	$63
	.byte	$39
	.byte	$3A
	.byte	$3B
	.byte	$2B
	.byte	$3C
	.byte	$3D
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$3E
	.byte	$3F
	.byte	$2B
	.byte	$40
	.byte	$41
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$64
	.byte	$65
	.byte	$66
	.byte	$2B
	.byte	$67
	.byte	$68
	.byte	$00
	.byte	$71
	.byte	$02
	.byte	$69
	.byte	$6A
	.byte	$2B
	.byte	$6B
	.byte	$6C
	.byte	$6D
	.byte	$42
	.byte	$43
	.byte	$44
	.byte	$71
	.byte	$02
	.byte	$45
	.byte	$42
	.byte	$71
	.byte	$02
	.byte	$46
	.byte	$44
	.byte	$71
	.byte	$02
	.byte	$47
	.byte	$42
	.byte	$71
	.byte	$03
	.byte	$44
	.byte	$71
	.byte	$03
	.byte	$6E
	.byte	$42
	.byte	$71
	.byte	$02
	.byte	$6F
	.byte	$44
	.byte	$71
	.byte	$02
	.byte	$70
	.byte	$42
	.byte	$48
	.byte	$71
	.byte	$BF
	.byte	$00
	.byte	$71
	.byte	$3E
	.byte	$00
	.byte	$71
	.byte	$00
_grapesMS:
	.byte	$E9
	.byte	$EA
	.byte	$00
	.byte	$01
	.byte	$F1
	.byte	$EA
	.byte	$01
	.byte	$01
	.byte	$E9
	.byte	$F2
	.byte	$10
	.byte	$01
	.byte	$F1
	.byte	$F2
	.byte	$11
	.byte	$01
	.byte	$80
_bombMS:
	.byte	$DF
	.byte	$F5
	.byte	$02
	.byte	$01
	.byte	$E7
	.byte	$F5
	.byte	$03
	.byte	$01
	.byte	$DF
	.byte	$FC
	.byte	$12
	.byte	$01
	.byte	$E7
	.byte	$FC
	.byte	$13
	.byte	$01
	.byte	$80
_watermelonMS:
	.byte	$EA
	.byte	$F1
	.byte	$04
	.byte	$00
	.byte	$F2
	.byte	$F1
	.byte	$05
	.byte	$00
	.byte	$EA
	.byte	$F9
	.byte	$14
	.byte	$00
	.byte	$F2
	.byte	$F9
	.byte	$15
	.byte	$00
	.byte	$80
_appleMS:
	.byte	$E2
	.byte	$E7
	.byte	$06
	.byte	$00
	.byte	$EA
	.byte	$E7
	.byte	$07
	.byte	$00
	.byte	$E2
	.byte	$EF
	.byte	$16
	.byte	$00
	.byte	$EA
	.byte	$EF
	.byte	$17
	.byte	$00
	.byte	$80
_bananaMS:
	.byte	$E7
	.byte	$ED
	.byte	$20
	.byte	$02
	.byte	$EF
	.byte	$ED
	.byte	$21
	.byte	$02
	.byte	$E7
	.byte	$F5
	.byte	$30
	.byte	$02
	.byte	$EF
	.byte	$F5
	.byte	$31
	.byte	$02
	.byte	$80
_orangeMS:
	.byte	$F3
	.byte	$EE
	.byte	$22
	.byte	$03
	.byte	$FB
	.byte	$EE
	.byte	$23
	.byte	$03
	.byte	$F3
	.byte	$F6
	.byte	$32
	.byte	$03
	.byte	$FB
	.byte	$F6
	.byte	$33
	.byte	$03
	.byte	$80
_basketMS:
	.byte	$E0
	.byte	$F0
	.byte	$24
	.byte	$02
	.byte	$E8
	.byte	$F0
	.byte	$25
	.byte	$02
	.byte	$F0
	.byte	$F0
	.byte	$26
	.byte	$02
	.byte	$F8
	.byte	$F0
	.byte	$27
	.byte	$02
	.byte	$E0
	.byte	$F8
	.byte	$34
	.byte	$02
	.byte	$E8
	.byte	$F8
	.byte	$35
	.byte	$02
	.byte	$F0
	.byte	$F8
	.byte	$36
	.byte	$02
	.byte	$F8
	.byte	$F8
	.byte	$37
	.byte	$02
	.byte	$E0
	.byte	$00
	.byte	$44
	.byte	$02
	.byte	$E8
	.byte	$00
	.byte	$45
	.byte	$02
	.byte	$F0
	.byte	$00
	.byte	$46
	.byte	$02
	.byte	$F8
	.byte	$00
	.byte	$47
	.byte	$02
	.byte	$E0
	.byte	$08
	.byte	$54
	.byte	$02
	.byte	$E8
	.byte	$08
	.byte	$55
	.byte	$02
	.byte	$F0
	.byte	$08
	.byte	$56
	.byte	$02
	.byte	$F8
	.byte	$08
	.byte	$57
	.byte	$02
	.byte	$80
_paletteSpr:
	.byte	$3C
	.byte	$0F
	.byte	$16
	.byte	$2A
	.byte	$3C
	.byte	$0F
	.byte	$13
	.byte	$2A
	.byte	$3C
	.byte	$0F
	.byte	$18
	.byte	$28
	.byte	$3C
	.byte	$0F
	.byte	$27
	.byte	$2A
_paletteBG:
	.byte	$1A
	.byte	$37
	.byte	$3C
	.byte	$30
	.byte	$1A
	.byte	$01
	.byte	$21
	.byte	$31
	.byte	$1A
	.byte	$06
	.byte	$16
	.byte	$26
	.byte	$1A
	.byte	$09
	.byte	$19
	.byte	$29

.segment	"BSS"

_controller:
	.res	1,$00
_fruits:
	.res	60,$00
_heart:
	.res	20,$00
_visible:
	.res	15,$00
_fruitType:
	.res	15,$00
_heart_color:
	.res	5,$00
_scoreText:
	.res	5,$00
_i:
	.res	1,$00

; ---------------------------------------------------------------
; void __near__ moveBasket (c) int c;
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_moveBasket: near

.segment	"CODE"

;
; void moveBasket(c) {
;
	jsr     pushax
;
; if ((controller & PAD_LEFT) && (basket.x > 32)) {
;
	lda     _controller
	and     #$02
	beq     L000F
	lda     _basket
	cmp     #$21
	bcc     L000F
;
; basket.x -= c;
;
	ldy     #$00
	lda     (sp),y
	eor     #$FF
	sec
;
; } else if ((controller & PAD_RIGHT) && (basket.x < 255)) {
;
	jmp     L0013
L000F:	lda     _controller
	and     #$01
	beq     L0007
	lda     _basket
	cmp     #$FF
	bcs     L0007
;
; basket.x += c;
;
	ldy     #$00
	lda     (sp),y
	clc
L0013:	adc     _basket
	sta     _basket
;
; }
;
L0007:	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; unsigned char __near__ checkCollision (struct sprites fruit, struct sprites basket)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_checkCollision: near

.segment	"CODE"

;
; unsigned char checkCollision(sprites fruit, sprites basket) {
;
	jsr     pusheax
;
; if ((fruit.x > basket.x - 32 && fruit.x - 16 < basket.x) &&
;
	ldy     #$04
	lda     (sp),y
	jsr     pusha0
	ldy     #$02
	lda     (sp),y
	sec
	sbc     #$20
	bcs     L0003
	ldx     #$FF
L0003:	jsr     tosicmp
	bmi     L0004
	beq     L0004
	ldy     #$04
	ldx     #$00
	lda     (sp),y
	sec
	sbc     #$10
	bcs     L0005
	dex
L0005:	ldy     #$00
	cmp     (sp),y
	txa
	sbc     #$00
	bvc     L0010
	eor     #$80
L0010:	bmi     L0012
L0004:	ldx     #$00
	txa
	jmp     incsp8
;
; (fruit.y > basket.y - 24 && fruit.y - 16 < basket.y)) {
;
L0012:	ldy     #$05
	lda     (sp),y
	jsr     pusha0
	ldy     #$03
	lda     (sp),y
	sec
	sbc     #$18
	bcs     L0009
	ldx     #$FF
L0009:	jsr     tosicmp
	bmi     L000A
	beq     L000A
	ldy     #$05
	ldx     #$00
	lda     (sp),y
	sec
	sbc     #$10
	bcs     L000B
	dex
L000B:	ldy     #$01
	cmp     (sp),y
	txa
	sbc     #$00
	bvc     L0011
	eor     #$80
L0011:	asl     a
	ldx     #$00
	bcs     L0013
L000A:	ldx     #$00
	txa
	jmp     incsp8
L0013:	tya
;
; }
;
	jmp     incsp8

.endproc

; ---------------------------------------------------------------
; void __near__ convertScoreToChar (unsigned int num)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_convertScoreToChar: near

.segment	"CODE"

;
; void convertScoreToChar(unsigned int num) {
;
	jsr     pushax
;
; scoreText[4] = num % 10;
;
	jsr     pushw0sp
	lda     #$0A
	jsr     tosumoda0
	sta     _scoreText+4
;
; num /= 10;
;
	jsr     pushw0sp
	lda     #$0A
	jsr     tosudiva0
	jsr     stax0sp
;
; scoreText[3] = num % 10;
;
	jsr     pushax
	lda     #$0A
	jsr     tosumoda0
	sta     _scoreText+3
;
; num /= 10;
;
	jsr     pushw0sp
	lda     #$0A
	jsr     tosudiva0
	jsr     stax0sp
;
; scoreText[2] = num % 10;
;
	jsr     pushax
	lda     #$0A
	jsr     tosumoda0
	sta     _scoreText+2
;
; num /= 10;
;
	jsr     pushw0sp
	lda     #$0A
	jsr     tosudiva0
	jsr     stax0sp
;
; scoreText[1] = num % 10;
;
	jsr     pushax
	lda     #$0A
	jsr     tosumoda0
	sta     _scoreText+1
;
; num /= 10;
;
	jsr     pushw0sp
	lda     #$0A
	jsr     tosudiva0
	jsr     stax0sp
;
; scoreText[0] = num % 10;
;
	jsr     pushax
	lda     #$0A
	jsr     tosumoda0
	sta     _scoreText
;
; num /= 10;
;
	jsr     pushw0sp
	lda     #$0A
	jsr     tosudiva0
	jsr     stax0sp
;
; }
;
	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ drawHearts (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_drawHearts: near

.segment	"CODE"

;
; for (i = 0; i < MAX_HEARTS; ++i) {
;
	lda     #$00
	sta     _i
L000C:	lda     _i
	cmp     #$05
	bcs     L0003
;
; if (heart_color[i] == 1)
;
	ldy     _i
	lda     _heart_color,y
	cmp     #$01
	bne     L0006
;
; oam_spr(210 + i * 8, 10, 8, 0);
;
	jsr     decsp3
	lda     _i
	asl     a
	asl     a
	asl     a
	clc
	adc     #$D2
	ldy     #$02
	sta     (sp),y
	lda     #$0A
	dey
	sta     (sp),y
	lda     #$08
;
; else
;
	jmp     L000F
;
; oam_spr(210 + i * 8, 10, 9, 0);
;
L0006:	jsr     decsp3
	lda     _i
	asl     a
	asl     a
	asl     a
	clc
	adc     #$D2
	ldy     #$02
	sta     (sp),y
	lda     #$0A
	dey
	sta     (sp),y
	lda     #$09
L000F:	dey
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; for (i = 0; i < MAX_HEARTS; ++i) {
;
	inc     _i
	jmp     L000C
;
; }
;
L0003:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ updateHeart (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_updateHeart: near

.segment	"CODE"

;
; signed char j = MAX_HEARTS;
;
	lda     #$05
	jsr     pusha
;
; for (j = MAX_HEARTS - 1; j >= 0; --j) {
;
	lda     #$04
	ldy     #$00
	sta     (sp),y
L000E:	lda     (sp),y
	tax
	bmi     L0003
;
; if (heart_color[j] == 1) {
;
	lda     (sp),y
	tay
	lda     _heart_color,y
	cmp     #$01
	bne     L0004
;
; heart_color[j] = 0;
;
	ldy     #$00
	lda     (sp),y
	tay
	lda     #$00
	sta     _heart_color,y
;
; break;
;
	jmp     incsp1
;
; for (j = MAX_HEARTS - 1; j >= 0; --j) {
;
L0004:	ldy     #$00
	lda     (sp),y
	sec
	sbc     #$01
	sta     (sp),y
	bpl     L000E
	jmp     L000E
;
; }
;
L0003:	jmp     incsp1

.endproc

; ---------------------------------------------------------------
; void __near__ initializeNewGame (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_initializeNewGame: near

.segment	"CODE"

;
; score = 0;
;
	lda     #$00
	sta     _score
	sta     _score+1
;
; speed = 100;
;
	lda     #$64
	sta     _speed
;
; for (i = 0; i < 5; ++i) {
;
	lda     #$00
	sta     _i
L0012:	lda     _i
	cmp     #$05
	bcs     L0013
;
; scoreText[i] = 0;
;
	ldy     _i
	lda     #$00
	sta     _scoreText,y
;
; for (i = 0; i < 5; ++i) {
;
	inc     _i
	jmp     L0012
;
; for (i = 0; i < totalPoss; ++i) {
;
L0013:	lda     #$00
	sta     _i
L0014:	lda     _i
	cmp     #$0F
	bcs     L0015
;
; visible[i] = 0;
;
	ldy     _i
	lda     #$00
	sta     _visible,y
;
; fruits[i].height = 15;
;
	tax
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     #$0F
	ldy     #$03
	sta     (ptr1),y
;
; fruits[i].width = 15;
;
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     #$0F
	dey
	sta     (ptr1),y
;
; fruits[i].x = 0;
;
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     #$00
	tay
	sta     (ptr1),y
;
; fruits[i].y = 0;
;
	tax
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	tya
	iny
	sta     (ptr1),y
;
; fruitType[i] = 0;
;
	ldy     _i
	sta     _fruitType,y
;
; for (i = 0; i < totalPoss; ++i) {
;
	inc     _i
	jmp     L0014
;
; for (i = 0; i < MAX_HEARTS; ++i) {
;
L0015:	lda     #$00
	sta     _i
L0016:	lda     _i
	cmp     #$05
	bcs     L000E
;
; heart_color[i] = 1;
;
	ldy     _i
	lda     #$01
	sta     _heart_color,y
;
; for (i = 0; i < MAX_HEARTS; ++i) {
;
	inc     _i
	jmp     L0016
;
; }
;
L000E:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; ppu_off();
;
	jsr     _ppu_off
;
; initializeNewGame();
;
	jsr     _initializeNewGame
;
; pal_spr((const char*)paletteSpr);
;
	lda     #<(_paletteSpr)
	ldx     #>(_paletteSpr)
	jsr     _pal_spr
;
; pal_bg((const char*)paletteBG);
;
	lda     #<(_paletteBG)
	ldx     #>(_paletteBG)
	jsr     _pal_bg
;
; bank_bg(1);
;
	lda     #$01
	jsr     _bank_bg
;
; vram_adr(NAMETABLE_A);
;
	ldx     #$20
	lda     #$00
	jsr     _vram_adr
;
; vram_unrle(backNT);
;
	lda     #<(_backNT)
	ldx     #>(_backNT)
	jsr     _vram_unrle
;
; ppu_on_all();
;
	jsr     _ppu_on_all
;
; ppu_wait_nmi();
;
L0002:	jsr     _ppu_wait_nmi
;
; oam_clear();
;
	jsr     _oam_clear
;
; controller = pad_poll(0);
;
	lda     #$00
	jsr     _pad_poll
	sta     _controller
;
; if (gameState == 0) {
;
	lda     _gameState
	bne     L0063
;
; oam_clear();
;
	jsr     _oam_clear
;
; for (i = 0; i < 5; ++i) {
;
	lda     #$00
	sta     _i
L0061:	lda     _i
	cmp     #$05
	bcs     L0062
;
; oam_spr(120 + i * 8, 112, playText[i] + 96, 3);
;
	jsr     decsp3
	lda     _i
	asl     a
	asl     a
	asl     a
	clc
	adc     #$78
	ldy     #$02
	sta     (sp),y
	lda     #$70
	dey
	sta     (sp),y
	ldy     _i
	lda     _playText,y
	clc
	adc     #$60
	ldy     #$00
	sta     (sp),y
	lda     #$03
	jsr     _oam_spr
;
; for (i = 0; i < 5; ++i) {
;
	inc     _i
	jmp     L0061
;
; if (controller & PAD_SELECT) {
;
L0062:	lda     _controller
	and     #$20
	beq     L0063
;
; gameState = 1;
;
	lda     #$01
	sta     _gameState
;
; if (gameState == 2) {
;
L0063:	lda     _gameState
	cmp     #$02
	jne     L0068
;
; oam_clear();
;
	jsr     _oam_clear
;
; for (i = 0; i < 4; ++i) {
;
	lda     #$00
	sta     _i
L0064:	lda     _i
	cmp     #$04
	bcs     L0065
;
; oam_spr(100 + i * 8, 100, gameOverText[i] + 96, 0);
;
	jsr     decsp3
	lda     _i
	asl     a
	asl     a
	asl     a
	clc
	adc     #$64
	ldy     #$02
	sta     (sp),y
	lda     #$64
	dey
	sta     (sp),y
	ldy     _i
	lda     _gameOverText,y
	clc
	adc     #$60
	ldy     #$00
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; for (i = 0; i < 4; ++i) {
;
	inc     _i
	jmp     L0064
;
; for (i = 4; i < 10; ++i) {
;
L0065:	lda     #$04
	sta     _i
L0066:	lda     _i
	cmp     #$0A
	bcs     L0067
;
; oam_spr(100 + (i - 4) * 8, 110, gameOverText[i] + 96, 0);
;
	jsr     decsp3
	lda     _i
	sec
	sbc     #$04
	asl     a
	asl     a
	asl     a
	clc
	adc     #$64
	ldy     #$02
	sta     (sp),y
	lda     #$6E
	dey
	sta     (sp),y
	ldy     _i
	lda     _gameOverText,y
	clc
	adc     #$60
	ldy     #$00
	sta     (sp),y
	tya
	jsr     _oam_spr
;
; for (i = 4; i < 10; ++i) {
;
	inc     _i
	jmp     L0066
;
; if (controller & PAD_SELECT) {
;
L0067:	lda     _controller
	and     #$20
	beq     L0068
;
; initializeNewGame();
;
	jsr     _initializeNewGame
;
; gameState = 1;
;
	lda     #$01
	sta     _gameState
;
; if (gameState == 1) {
;
L0068:	lda     _gameState
	cmp     #$01
	jne     L006B
;
; moveBasket(c);
;
	ldx     #$00
	lda     _c
	jsr     _moveBasket
;
; oam_meta_spr(basket.x, basket.y, basketMS);
;
	jsr     decsp2
	lda     _basket
	ldy     #$01
	sta     (sp),y
	lda     _basket+1
	dey
	sta     (sp),y
	lda     #<(_basketMS)
	ldx     #>(_basketMS)
	jsr     _oam_meta_spr
;
; ++counter;
;
	inc     _counter
;
; if (counter >= speed) {
;
	lda     _counter
	cmp     _speed
	jcc     L006B
;
; counter = 0;
;
	lda     #$00
	sta     _counter
;
; for (i = 0; i < totalPoss; i++) {
;
	sta     _i
L0069:	lda     _i
	cmp     #$0F
	bcs     L006B
;
; if (visible[i] == 0) {
;
	ldy     _i
	lda     _visible,y
	bne     L006A
;
; visible[i] = 1;
;
	ldy     _i
	lda     #$01
	sta     _visible,y
;
; fruitType[i] = rand8() % 7;
;
	lda     #<(_fruitType)
	ldx     #>(_fruitType)
	clc
	adc     _i
	bcc     L0028
	inx
L0028:	jsr     pushax
	jsr     _rand8
	jsr     pushax
	lda     #$07
	jsr     tosumoda0
	ldy     #$00
	jsr     staspidx
;
; fruits[i].x = rand8() % 235 + 20;
;
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	tay
	txa
	adc     #>(_fruits)
	tax
	tya
	jsr     pushax
	jsr     _rand8
	jsr     pushax
	lda     #$EB
	jsr     tosumoda0
	clc
	adc     #$14
	ldy     #$00
	jsr     staspidx
;
; fruits[i].y = 0;
;
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     #$00
	ldy     #$01
	sta     (ptr1),y
;
; break;
;
	jmp     L006C
;
; for (i = 0; i < totalPoss; i++) {
;
L006A:	inc     _i
	jmp     L0069
;
; for (i = 0; i < totalPoss; ++i) {
;
L006B:	lda     #$00
L006C:	sta     _i
L006D:	lda     _i
	cmp     #$0F
	jcs     L0070
;
; if (visible[i] == 1) {
;
	ldy     _i
	lda     _visible,y
	cmp     #$01
	jne     L006F
;
; if (fruits[i].y > 190) {
;
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	cmp     #$BF
	ldx     #$00
	bcc     L006E
;
; visible[i] = 0;
;
	ldy     _i
	txa
	sta     _visible,y
;
; if (fruitType[i] != 0)
;
	ldy     _i
	lda     _fruitType,y
	beq     L006F
;
; updateHeart();  // Change color of a heart
;
	jsr     _updateHeart
;
; } else if (checkCollision(fruits[i], basket)) {
;
	jmp     L006F
L006E:	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	tay
	txa
	adc     #>(_fruits)
	tax
	tya
	jsr     ldeaxi
	jsr     pusheax
	lda     _basket+3
	sta     sreg+1
	lda     _basket+2
	sta     sreg
	ldx     _basket+1
	lda     _basket
	jsr     _checkCollision
	tax
	beq     L006F
;
; if (fruitType[i] == 0) {
;
	ldy     _i
	lda     _fruitType,y
	bne     L0036
;
; updateHeart();
;
	jsr     _updateHeart
;
; } else {
;
	jmp     L0038
;
; ++score;
;
L0036:	inc     _score
	bne     L0039
	inc     _score+1
;
; convertScoreToChar(score);
;
L0039:	lda     _score
	ldx     _score+1
	jsr     _convertScoreToChar
;
; visible[i] = 0;
;
L0038:	ldy     _i
	lda     #$00
	sta     _visible,y
;
; for (i = 0; i < totalPoss; ++i) {
;
L006F:	inc     _i
	jmp     L006D
;
; if (heart_color[0] == 0) {
;
L0070:	lda     _heart_color
	bne     L0071
;
; gameState = 2;
;
	lda     #$02
	sta     _gameState
;
; continue;
;
	jmp     L0002
;
; for (i = 0; i < totalPoss; ++i) {
;
L0071:	lda     #$00
	sta     _i
L0072:	lda     _i
	cmp     #$0F
	jcs     L0075
;
; if (visible[i] == 1) {
;
	ldy     _i
	lda     _visible,y
	cmp     #$01
	jne     L0074
;
; if (fruitType[i] == 0) {
;
	ldy     _i
	lda     _fruitType,y
	bne     L0042
;
; oam_meta_spr(fruits[i].x, fruits[i].y, bombMS);
;
	jsr     decsp2
	ldx     #$00
	lda     _i
	jsr     aslax2
	sta     ptr1
	txa
	clc
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #<(_fruits)
	lda     (ptr1),y
	ldy     #$01
	sta     (sp),y
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     (ptr1),y
	dey
	sta     (sp),y
	lda     #<(_bombMS)
	ldx     #>(_bombMS)
;
; } else if (fruitType[i] == 1) {
;
	jmp     L0060
L0042:	ldy     _i
	lda     _fruitType,y
	cmp     #$01
	bne     L0045
;
; oam_meta_spr(fruits[i].x, fruits[i].y, bananaMS);
;
	jsr     decsp2
	ldx     #$00
	lda     _i
	jsr     aslax2
	sta     ptr1
	txa
	clc
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #<(_fruits)
	lda     (ptr1),y
	ldy     #$01
	sta     (sp),y
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     (ptr1),y
	dey
	sta     (sp),y
	lda     #<(_bananaMS)
	ldx     #>(_bananaMS)
;
; } else if (fruitType[i] == 2) {
;
	jmp     L0060
L0045:	ldy     _i
	lda     _fruitType,y
	cmp     #$02
	bne     L0048
;
; oam_meta_spr(fruits[i].x, fruits[i].y, appleMS);
;
	jsr     decsp2
	ldx     #$00
	lda     _i
	jsr     aslax2
	sta     ptr1
	txa
	clc
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #<(_fruits)
	lda     (ptr1),y
	ldy     #$01
	sta     (sp),y
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     (ptr1),y
	dey
	sta     (sp),y
	lda     #<(_appleMS)
	ldx     #>(_appleMS)
;
; } else if (fruitType[i] == 3) {
;
	jmp     L0060
L0048:	ldy     _i
	lda     _fruitType,y
	cmp     #$03
	bne     L004B
;
; oam_meta_spr(fruits[i].x, fruits[i].y, orangeMS);
;
	jsr     decsp2
	ldx     #$00
	lda     _i
	jsr     aslax2
	sta     ptr1
	txa
	clc
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #<(_fruits)
	lda     (ptr1),y
	ldy     #$01
	sta     (sp),y
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     (ptr1),y
	dey
	sta     (sp),y
	lda     #<(_orangeMS)
	ldx     #>(_orangeMS)
;
; } else if (fruitType[i] == 4) {
;
	jmp     L0060
L004B:	ldy     _i
	lda     _fruitType,y
	cmp     #$04
	bne     L004E
;
; oam_meta_spr(fruits[i].x, fruits[i].y, watermelonMS);
;
	jsr     decsp2
	ldx     #$00
	lda     _i
	jsr     aslax2
	sta     ptr1
	txa
	clc
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #<(_fruits)
	lda     (ptr1),y
	ldy     #$01
	sta     (sp),y
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     (ptr1),y
	dey
	sta     (sp),y
	lda     #<(_watermelonMS)
	ldx     #>(_watermelonMS)
;
; } else if (fruitType[i] == 5) {
;
	jmp     L0060
L004E:	ldy     _i
	ldx     #$00
	lda     _fruitType,y
	cmp     #$05
	bne     L0073
;
; oam_meta_spr(fruits[i].x, fruits[i].y, grapesMS);
;
	jsr     decsp2
	lda     _i
	jsr     aslax2
	sta     ptr1
	txa
	clc
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #<(_fruits)
	lda     (ptr1),y
	ldy     #$01
	sta     (sp),y
	ldx     #$00
	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	lda     (ptr1),y
	dey
	sta     (sp),y
	lda     #<(_grapesMS)
	ldx     #>(_grapesMS)
L0060:	jsr     _oam_meta_spr
;
; ++fruits[i].y;
;
	ldx     #$00
L0073:	lda     _i
	jsr     aslax2
	clc
	adc     #<(_fruits)
	sta     ptr1
	txa
	adc     #>(_fruits)
	sta     ptr1+1
	ldy     #$01
	tya
	clc
	adc     (ptr1),y
	sta     (ptr1),y
;
; for (i = 0; i < totalPoss; ++i) {
;
L0074:	inc     _i
	jmp     L0072
;
; for (i = 0; i < 5; ++i) {
;
L0075:	lda     #$00
	sta     _i
L0076:	lda     _i
	cmp     #$05
	bcs     L0054
;
; oam_spr(220 + i * 7, 20, scoreText[i] + 144, 2);
;
	jsr     decsp3
	ldx     #$00
	lda     _i
	jsr     mulax7
	clc
	adc     #$DC
	ldy     #$02
	sta     (sp),y
	lda     #$14
	dey
	sta     (sp),y
	ldy     _i
	lda     _scoreText,y
	clc
	adc     #$90
	ldy     #$00
	sta     (sp),y
	lda     #$02
	jsr     _oam_spr
;
; for (i = 0; i < 5; ++i) {
;
	inc     _i
	jmp     L0076
;
; drawHearts();
;
L0054:	jsr     _drawHearts
;
; if (score % 10 == 0 && score != 0) {
;
	lda     _score
	ldx     _score+1
	jsr     pushax
	lda     #$0A
	jsr     tosumoda0
	cpx     #$00
	jne     L0002
	cmp     #$00
	jne     L0002
	lda     _score
	ora     _score+1
	jeq     L0002
;
; speed--;
;
	dec     _speed
;
; while (1) {
;
	jmp     L0002

.endproc

