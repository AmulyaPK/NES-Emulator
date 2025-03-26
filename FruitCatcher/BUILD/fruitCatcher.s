;
; File generated by cc65 v 2.19 - Git 852b622
;
	.fopt		compiler,"cc65 v 2.19 - Git 852b622"
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
	.import		_oam_meta_spr
	.import		_pad_poll
	.import		_bank_bg
	.import		_vram_adr
	.import		_vram_unrle
	.export		_grapesMS
	.export		_bombMS
	.export		_watermelonMS
	.export		_appleMS
	.export		_bananaMS
	.export		_orangeMS
	.export		_basketMS
	.export		_tempBg
	.export		_paletteSpr
	.export		_paletteBG
	.export		_basket
	.export		_controller
	.export		_moveBasket
	.export		_main

.segment	"DATA"

_basket:
	.byte	$80
	.byte	$A0
	.byte	$1F
	.byte	$1F

.segment	"RODATA"

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
_tempBg:
	.byte	$04
	.byte	$00
	.byte	$04
	.byte	$FE
	.byte	$00
	.byte	$04
	.byte	$FE
	.byte	$00
	.byte	$04
	.byte	$A1
	.byte	$01
	.byte	$04
	.byte	$1F
	.byte	$02
	.byte	$04
	.byte	$1F
	.byte	$03
	.byte	$04
	.byte	$DF
	.byte	$00
	.byte	$04
	.byte	$3E
	.byte	$00
	.byte	$04
	.byte	$00
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
	.byte	$3C
	.byte	$19
	.byte	$2A
	.byte	$3C
	.byte	$3C
	.byte	$01
	.byte	$21
	.byte	$31
	.byte	$3C
	.byte	$06
	.byte	$16
	.byte	$26
	.byte	$3C
	.byte	$09
	.byte	$19
	.byte	$29

.segment	"BSS"

_controller:
	.res	1,$00

; ---------------------------------------------------------------
; void __near__ moveBasket (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_moveBasket: near

.segment	"CODE"

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
; --basket.x;
;
	dec     _basket
;
; } else if ((controller & PAD_RIGHT) && (basket.x < 255)) {
;
	rts
L000F:	lda     _controller
	and     #$01
	beq     L0011
	lda     _basket
	cmp     #$FF
	bcc     L0012
L0011:	rts
;
; ++basket.x;
;
L0012:	inc     _basket
;
; }
;
	rts

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
; pal_spr(paletteSpr);
;
	lda     #<(_paletteSpr)
	ldx     #>(_paletteSpr)
	jsr     _pal_spr
;
; pal_bg(paletteBG);
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
; vram_unrle(tempBg);
;
	lda     #<(_tempBg)
	ldx     #>(_tempBg)
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
; moveBasket();
;
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
; while (1) {
;
	jmp     L0002

.endproc

