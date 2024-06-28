SNDPLAYER_S:

****************************************************************************
*                                                                          *
*     Sound Abspiel Routine zu Sound FX    � 1988 LINEL Switzerland        *
*                                                                          *
*        Modified to handle more than one tune by CHW  29-Jun-88           *
*                                                                          *
*     07-Sep-88  CHW  Added 'LockVoices'                                   *
*                                                                          *
*  In das Label 'SongPtr' muss ein Zeiger auf die Sound-Daten, welche mit  *
*  dem SoundFx-Befehl 'Save Datas' (NICHT Save Final!) abgespeichert wur-  *
*  den, eingetragen werden. Die Daten m�ssen nat�rlich im CHIP-Memory ste- *
*  hen, sonst gibt's nur Bit-Salat...                                      *
*                                                                          *
****************************************************************************

		XDEF	SetSound,MusicVBL,LockVoices,SongPtr
		XDEF	PlayFX
		XREF	RasterDelay,WonderVars
		XREF	_SysBase

		INCLUDE "MyExec.i"
		INCLUDE "definitions.i"
		INCLUDE "relcustom.i"
		INCLUDE "sfx.i"


SongStr:	EQU	60		; Offset der Song-Struktur
ch_SIZEOF:	EQU	24		; Gr��e der ChannelData-Struktur

****************************************************************************

		*** Definitionen der Lieder (hier Beispiel Dugger)
		*** Format der Eintr�ge: dc.w Start-Pattern,L�nge in Patterns

		SECTION	MyData,Data

		CNOP	0,2

SongDefs:	dc.w	0,6	; Song 0: IntroSong
		dc.w	0,11	; Song 1: GameSongI
		dc.w	0,12	; Song 2: GameSongII

LastChannel:	dc.w	0

****************************************************************************

		SECTION	Program,CODE

		*** A0 - SoundStructure
		*** D0 - Channel

PlayFX:		movem.l	d0-d7/a0-a6,-(SP)
		lea	WonderVars,a6
		lea	custom,a5

		tst.b	FxFlag(A6)
		bne	.Loop
		tst.l	FXBase(A6)
		beq	.Loop

		lea	ChannelData3,a1
		moveq	#4-1,d1			;4 Stimmen
.FindChannel:	tst.w	22(A1)
		beq.s	.FixChannel
		lea	-ch_SIZEOF(a1),a1
		dbf	d1,.FindChannel

		moveq	#3,d1

;		tst.b	MusicFlag(A6)
;		beq.s	.FixChannel

;		move.w	LastChannel,d1
;		addq.w	#1,d1
;		cmp.w	#4,d1
;		bne.s	.ResetChannel

;		moveq	#0,d1

;.ResetChannel:	move.w	d1,LastChannel

.FixChannel:	lea	aud(A5),a4
		moveq	#0,d0
		bset	d1,d0				;maske f�r lockvoices

		lsl.w	#4,d1
		add.w	d1,a4
		move	d0,dmacon(A5)			;dma sperren

		move.w	sfx_Length(A0),d1
		ext.l	d1
		divu	#100,d1
		addq.w	#5,d1
		mulu	sfx_Period(a0),d1
;		divu	#859,d1
		divu	#425,d1
		addq.w	#2,d1
		ext.l	d1				;Zeit

		bsr	LockVoices

		move.w	d0,d1

		move.l	sfx_Address(a0),a1
		add.l	FXBase(A6),a1
		move.l	a1,audlc(a4)

		move.w	sfx_Length(A0),d0
		and.w	#$7fff,d0
		move.w	d0,audlen(A4)
		move.w	sfx_Period(A0),audper(A4)

		move.w	sfx_Volume(A0),d0
		mulu	#MasterFXVolume,d0
		asr.w	#6,d0
		move.w	d0,audvol(A4)

		bsr.s	SoundDelay
		or.w	#$8000,d1
		move.w	d1,dmacon(A5)			;dma zulassen
		bsr.s	SoundDelay

		move.w	sfx_Length(A0),d0
		btst	#15,d0				;LoopBit gesetzt ?
		bne.s	.Loop				;ja ->
		
		clr.l	EmptySample
		move.l	#EmptySample,audlc(a4)
		move.w	#1,audlen(A4)
.Loop:		movem.l	(SP)+,d0-d7/a0-a6
		rts

SoundDelay:	moveq	#5,d0
		bra	RasterDelay

****************************************************************************

	*** Lied ausw�hlen und Play starten, Lied-Nummer in D0

SetSound:	movem.l	d2-d7/a2-a6,-(SP)
		movea.l	SongPtr,a0
		lea	SongStr+472(a0),a0	;Start der Original-Pattern-Tabelle
		lea	SongDefs,a1		;Definitionen der einzelnen Songs
		lsl.w	#2,d0			;Song-Nr. *4
		adda.w	0(a1,d0.w),a0		;Offset dieses Songs
		move.w	2(a1,d0.w),d0		;L�nge dieses Songs
		move.w	d0,AnzPat		;speichern
		subq.w	#1,d0			;f�r dbf
		lea	PatternBuffer,a1	;Patterns des aktuellen Songs
1$:		move.b	(a0)+,(a1)+
		dbf	d0,1$

		bsr	SongLen			;L�nge der Songdaten berechnen
		movea.l	SongPtr,a0
		lea	SongStr+600(a0),a0	;Songstr+L�nge der SongStr.
		adda.l	d0,a0			;Zur Adresse dazu
		movea.l	SongPtr,a2		;L�ngentabelle der Instumente

		lea	Instruments,a1		;Tabelle auf Samples
		moveq	#14,d7			;15 Instrumente

CalcIns:	move.l	a0,(A1)+		;Startadresse des Instr.
		add.l	(a2)+,a0		;berechnen un speichern
		dbf	d7,CalcIns

		bsr	PlayDisable		;Sound DMA abschalten
		bsr	PlayInit		;Loop Bereich setzen
		bsr	PlayEnable		;Player erlauben
		movem.l	(SP)+,d2-d7/a2-a6
		rts



****************************************************************************

	*** Stimmen sperren, damit Digi-Effekte abgespielt werden k�nnen
	*** D0: Abzuschaltende Stimmen (Bit 0=Stimme 0,.. Bit 3 = Stimme3)
	*** z.B. D0=5=%1010 = Stimmen 1 und 3 abschalten
	*** D1 = Sperrzeit in VBlanks (50 = 1 Sekunde usw.)

LockVoices:	movem.l	d2/a0,-(SP)
		lea	ChannelData3,a0
		moveq	#3,d2			;4 Stimmen
1$:		btst	d2,d0
		beq.s	2$
		move.w	d1,22(a0)		;Sperrzeit eintragen
2$:		lea	-ch_SIZEOF(a0),a0
		dbf	d2,1$
		movem.l	(SP)+,d2/a0
		rts

****************************************************************************

;hier werden 5 * effekte gespielt und einmal der song

MusicVBL:					;HauptAbspielRoutine
		movem.l	d0-d7/a0-a6,-(SP)
		addq.w	#1,Timer		;z�hler erh�hen

		move.w	WonderVars+SongSpeed,d0

		cmp.w	Timer,d0		;schon 6?

		bne.s	CheckEffects		;wenn nicht -> effekte
		clr.w	Timer			;sonst z�hler l�schen
		bsr 	PlaySound		;und sound spielen
		bra.s	PlayEnd			;fertig

CheckEffects:	moveq	#3,d7			;4 kan�le
		lea	StepControl0,a4
		lea	ChannelData0,a6		;Zeiger auf Daten f�r 0
		lea	$dff0a0,a5		;Kanal 0

EffLoop:	tst.w	22(a6)			;Stimme gelockt ?
		beq.s	1$			;nein --->
		subq.w	#1,22(a6)
		bra.s	NoEff
1$:		movem.l	d7/a5,-(SP)
		bsr	MakeEffekts		;Effekt spielen
		movem.l	(SP)+,d7/a5

NoEff:		adda.w	#8,a4
		adda.w	#$10,a5			;n�chster Kanal
		adda.w	#ch_SIZEOF,a6		;N�chste KanalDaten
		dbf	d7,EffLoop

PlayEnd:	movem.l	(SP)+,d0-d7/a0-a6
		rts

;-----------------------------------------------------------------------
;	Ab hier folgen nur noch lokale Routinen !!!
;-----------------------------------------------------------------------

PlayInit:	lea	Instruments,a0		;Zeiger auf instr.Tabelle
		moveq	#14,d0			;15 Instrumente
1$:		movea.l	(A0)+,a1		;Zeiger holen
		clr.l	(A1)			;erstes Longword l�schen
		;nop
		dbf	d0,1$
		rts

;-----------------------------------------------------------------------

PlayEnable:	lea	$dff000,a0		;AMIGA
		st.b	PlayLock		;player zulassen
		clr.w	$a8(A0)			;Alle Voloumenregs. auf 0
		clr.w	$b8(A0)
		clr.w	$c8(a0)
		clr.w	$d8(a0)
		clr.w	Timer			;zahler auf 0
		clr.l	TrackPos		;zeiger auf pos
		clr.l	PosCounter		;zeiger innehalb des pattern
		rts

;----------------------------------------------------------------------

PlayDisable:	lea	$dff000,a0		;AMIGA
		sf.b	PlayLock		;player sperren
		clr.w	$a8(a0)			;volumen auf 0
		clr.w	$b8(a0)
		clr.w	$c8(a0)
		clr.w	$d8(a0)
		move.w	#$f,$96(A0)		;dma sperren
		rts

;---------------------------------------------------------------------------

SongLen:	movem.l	d1-d7/a0-a6,-(SP)
		movea.l	SongPtr,a0
		lea	SongStr+472(a0),a0	;Patterntabelle
		moveq	#0,d2
		move.b	-2(a0),d2		;wieviel Positions im Ganzen
		subq.w	#1,d2			;f�r dbf
		moveq.l	#0,d0
		moveq.l	#0,d1

SongLenLoop:	move.b	(a0)+,d1		;Patternnummer holen
		cmp.b	d1,d0			;ist es die h�chste ?
		bhi.s	LenHigher		;nein!
		move.b	d1,d0			;ja

LenHigher:	dbf	d2,SongLenLoop
		addq	#1,d0			;H�chste BlockNummer plus 1
		mulu.w	#1024,d0		;mal L�nge eines Block
		movem.l	(SP)+,d1-d7/a0-a6
		rts

;-------------------------------------------------------------------

MakeEffekts:	move.w	(A4),d0
		beq.s	NoStep
		bmi.s	StepItUp
		add	d0,2(A4)
		move	2(A4),d0
		move	4(A4),d1
		cmp	d0,d1
		bhi.s	StepOk
		move	d1,d0

StepOk:		move	d0,6(a5)
		move	D0,2(A4)
		rts

StepItUp:	add	d0,2(A4)
		move	2(A4),d0
		move	4(A4),d1
		cmp	d0,d1
		blt.s	StepOk
		move	d1,d0
		bra.s	StepOk

NoStep:		move.b	2(a6),d0
		and.b	#$0f,d0
		cmp.b	#1,d0
		beq	Arpeggiato
		cmp.b	#2,d0
		beq	pitchbend
		cmp.b	#7,d0
		beq.s	SetStepUp
		cmp.b	#8,d0
		beq.s	SetStepDown
		rts

SetStepUp:	moveq	#0,d4
StepFinder:	clr	(a4)
		move	(A6),2(a4)
		moveq	#0,d2
		move.b	3(a6),d2
		and	#$0f,d2
		tst	d4
		beq.s	NoNegIt
		neg	d2

NoNegIt:	move	d2,(a4)
		moveq	#0,d2
		move.b	3(a6),d2
		lsr	#4,d2
		move	(a6),d0
		lea	NoteTable,a0

StepUpFindLoop:	move	(A0),d1
		cmp	#-1,d1
		beq.s	EndStepUpFind
		cmp	d1,d0
		beq.s	StepUpFound
		addq	#2,a0
		bra.s	StepUpFindLoop

StepUpFound:	lsl	#1,d2
		tst	d4
		bne.s	NoNegStep
		neg	d2

NoNegStep:	move	(a0,d2.w),d0
		move	d0,4(A4)
		rts

EndStepUpFind:	move	d0,4(A4)
		rts
	
SetStepDown:	st	d4
		bra.s	StepFinder

;-------------------------------------------------------------------

ArpeTable:	dc.l	Arpe1
		dc.l	Arpe2
		dc.l	Arpe3
		dc.l	Arpe1
		dc.l	Arpe2

Arpeggiato:	move.w	Timer,d0
		subq.w	#1,d0
		lsl.w	#2,d0
		movea.l	ArpeTable(PC,d0.w),a0
		jmp	(A0)

Arpe4:		lsl.l	#1,d0
		moveq	#0,d1
		move.w	16(a6),d1
		lea.l	NoteTable,a0

Arpe5:		move.w	(a0,d0.l),d2
		cmp.w	(a0),d1
		beq.s	Arpe6
		addq.l	#2,a0
		bra.s	Arpe5

Arpe1:		moveq	#0,d0
		move.b	3(a6),d0
		lsr.b	#4,d0
		bra.s	Arpe4

Arpe2:		moveq	#0,d0
		move.b	3(a6),d0
		andi.b	#$0f,d0
		bra.s	Arpe4

Arpe3:		move.w	16(a6),d2
Arpe6:		move.w	d2,6(a5)
		rts

;-------------------------------------------------------------------

pitchbend:	moveq	#0,d0
		move.b	3(a6),d0
		lsr.b	#4,d0
		cmp.b	#0,d0
		beq.s	pitch2
		add.w	d0,(a6)
		move.w	(a6),6(a5)
		rts

pitch2:		moveq	#0,d0
		move.b	3(a6),d0
		and.b	#$0f,d0
		cmp.b	#0,d0
		beq.s	pitch3
		sub.w	d0,(a6)
		move.w	(a6),6(a5)
pitch3:		rts


;--------------------------------------------------------------------

PlaySound:	movea.l	SongPtr,a0
		lea	SongStr(a0),a0		;Zeiger auf SongFile
		movea.l	a0,a2
		movea.l	a0,a3
		adda.w	#600,a0			;Zeiger auf BlockDaten
		lea	PatternBuffer,a2	;Zeiger auf Patterntab.
		adda.l	TrackPos,a2		;Postionzeiger dazu
		adda.w	#12,a3			;Zeiger auf Instr.Daten
		moveq	#0,d1
		move.b	(a2),d1			;dazugeh�rige PatternNr. holen
		moveq	#10,d7
		lsl.l	d7,d1			;*1024 (L�nge eines Patterns)
		add.l	PosCounter,d1		;Offset ins Pattern
		clr.w	DmaCon
		lea	StepControl0,a4
		lea	$dff0a0,a5		;Zeiger auf Kanal0
		lea	ChannelData0,a6		;Daten f�r Kanal0
		moveq	#3,d7			;4 Kan�le
SoundHandleLoop:
		move.l	a5,-(SP)
		tst.w	22(a6)			;Stimme gelockt ?
		beq.s	1$			;nein --->
		lea	Nullen,a5		;Stimme in Ruhe lassen

1$:		bsr	PlayNote		;aktuelle Note spielen
		add	#8,a4
		move.l	(SP)+,a5
		add	#$10,a5			;n�chster Kanal
		add	#ch_SIZEOF,a6		;n�chste Daten
		dbf	d7,SoundHandleLoop	;4*
	
		move	DmaCon,d0		;DmaBits
		bset	#15,d0			;Clear or Set Bit setzen
		move.w	d0,$dff096		;DMA ein!

		move.w	#250,d0			;Verz�gern (genug f�r MC68030)
2$:		dbf	d0,2$

		lea	ChannelData3,a6
		lea	$dff0d0,a5
		moveq	#3,d7

SetRegsLoop:	move.l	a5,-(SP)
		tst.w	22(a6)			;Stimme gelockt ?
		beq.s	1$			;nein --->
		subq.w	#1,22(a6)		;LockTimer runterz�hlen
		clr.l	10(a6)			;Adresse
		move	#1,14(a6)		;L�nge
		lea	Nullen,a5		;Stimme in Ruhe lassen

1$:		move.l	10(A6),(a5)		;Adresse
		move	14(A6),4(A5)		;l�nge

NoSetRegs:	sub	#ch_SIZEOF,a6		;n�chste Daten
		move.l	(SP)+,a5
		sub	#$10,a5			;n�chster Kanal
		dbf	d7,SetRegsLoop
		tst.b	PlayLock
		beq.s	NoEndPattern
		add.l	#16,PosCounter		;PatternPos erh�hen
		cmp.l	#1024,PosCounter	;schon Ende ?
		blt.s	NoEndPattern

		clr.l	PosCounter		;PatternPos l�schen
		addq.l	#1,TrackPos		;Position erh�hen

NoAddPos:	move.w	AnzPat,d0		;AnzahlPosition
		move.l	TrackPos,d1		;Aktuelle Pos
		cmp.w	d0,d1			;Ende?
		bne.s	NoEndPattern		;nein!
		clr.l	TrackPos		;ja/ Sound von vorne
NoEndPattern:	rts

;-------------------------------------------------------------------

PlayNote:	clr.l	(A6)
		tst.b	PlayLock		;Player zugelassen ?
		beq.s	NoGetNote		;
		move.l	(a0,d1.l),(a6)		;Aktuelle Note holen

NoGetNote:	addq.l	#4,d1			;PattenOffset + 4
		moveq	#0,d2
		cmp	#-3,(A6)		;Ist Note = 'PIC' ?
		beq	NoInstr2		;wenn ja -> ignorieren
		move.b	2(a6),d2		;Instr Nummer holen	
		and.b	#$f0,d2			;ausmaskieren
		lsr.b	#4,d2			;ins untere Nibble
		tst.b	d2			;kein Intrument ?
		beq	NoInstr2		;wenn ja -> �berspringen
	
		moveq	#0,d3
		lea	Instruments,a1		;Instr. Tabelle
		move.l	d2,d4			;Instrument Nummer
		subq.w	#1,d2
		lsl.w	#2,d2			;Offset auf akt. Instr.
		mulu	#30,d4			;Offset Auf Instr.Daten
		move.l	(a1,d2.w),4(a6)		;Zeiger auf akt. Instr.
		move.w	(a3,d4.l),8(a6)		;Instr.L�nge
		move.w	2(a3,d4.l),18(a6)	;Volume
		move.w	4(a3,d4.l),d3		;Repeat
		move.l	4(a6),d2		;Instrument	
		add.l	d3,d2			;rep Offset
		move.l	d2,10(a6)		;in Rep. Pos.
		move.w	6(a3,d4.l),14(a6)	;rep L�nge
		move.w	18(a6),d3 		;Volume in Hardware
CheckPic:
NoInstr:	move.b	2(A6),d2
		and	#$0f,d2
		cmp.b	#5,d2
		beq.s	ChangeUpVolume
		cmp.b	#6,d2
		bne	SetVolume2
		moveq	#0,d2
		move.b	3(A6),d2
		sub	d2,d3		
		tst	d3
		bpl	SetVolume2	
		clr	d3
		bra	SetVolume2

ChangeUpVolume:	moveq	#0,d2
		move.b	3(A6),d2
		add	d2,d3
		tst	d3
		cmp	#64,d3
		ble	SetVolume2
		move	#64,d3

SetVolume2:	mulu	#MasterVolume,d3	; * MasterVolume
		asr.w	#6,d3			; /64
		move	d3,8(A5)

NoInstr2:	cmp	#-3,(A6)		;Ist Note == 'PIC' ?
		bne.s	NoPic		
		clr	2(A6)			;wenn ja -> Note auf 0 setzen
		bra.s	NoNote	

NoPic:		tst	(A6)			;Note ?
		beq.s	NoNote			;wenn 0 -> nicht spielen
	
		clr	(a4)
		move.w	(a6),16(a6)		;eintragen
		tst.w	22(a6)			;Stimme gelockt ?
		bne.s	2$			;ja ---> Nix machen
		move.w	20(a6),$dff096		;dma abschalten
		move.w	#250,d0			;genug f�r MC68030
1$:		dbf	d0,1$			;delay
2$:		cmpi.w	#-2,(A6)		;Ist es 'STP'
		bne.s	NoStop			;Nein!
		clr.w	8(A5)
		bra.s	Super

NoStop:		move.l	4(a6),0(a5)		;Instrument Adr.
		move.w	8(a6),4(a5)		;L�nge
		move.w	0(a6),6(a5)		;Period

Super:		move.w	20(a6),d0		;DMA Bit
		or.w	d0,DmaCon		;einodern

NoNote:		rts

;--------------------------------------------------------------------

ChannelBase:	dc.l	$43485721		;Basis-Rate-Code

ChannelData0:	dc.l	0,0,0,0,0		;Daten f�r Note
		dc.w	1			;DMA - Bit
		dc.w	0			;Lock-Timer (0=free)

ChannelData1:	dc.l	0,0,0,0,0		;u.s.w
		dc.w	2
		dc.w	0

ChannelData2:	dc.l	0,0,0,0,0		;etc.
		dc.w	4
		dc.w	0

ChannelData3:	dc.l	0,0,0,0,0		;a.s.o
		dc.w	8
		dc.w	0

Reserve:	dc.w	856,856,856,856,856,856,856,856,856,856,856,856
NoteTable:	dc.w	856,808,762,720,678,640,604,570,538,508,480,453
		dc.w	428,404,381,360,339,320,302,285,269,254,240,226
		dc.w	214,202,190,180,170,160,151,143,135,127,120,113
		dc.w	113,113,113,113,113,113,113,113,113,113,113,113
		dc.w	-1

;-------------------------------------------------------------------

;		SECTION	MyBSS,BSS

		EVEN

StepControl0:	DS.B	8
StepControl1:	DS.B	8
StepControl2:	DS.B	8
StepControl3:	DS.B	8

SongPtr:	DS.B	4		; Zeiger auf Songs hier eintragen!
Instruments:	DS.B	60		; Zeiger auf die 15 Instrumente
PosCounter:	DS.B	4		; Offset ins Pattern
TrackPos:	DS.B	4		; Position Counter
Timer:		DS.B	2		; Z�hler 0-5
DmaCon:		DS.B	2		; Zwischenspeicher f�r DmaCon
AnzPat:		DS.B	2		; Anzahl Positions

PatternBuffer:	DS.B	128		; Patterns des aktuellen Songs
Nullen:		DS.B	16
PlayLock:	DS.B	2		; Flag f�r 'Sound erlaubt'
ActualVoice:	DS.B	2		; Aktuelle Stimme

		SECTION	chipbss,BSS_C

EmptySample:	ds.l	1

