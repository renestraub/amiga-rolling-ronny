
		XDEF	GetPosition,InsertScore,HiList
		XDEF	LoadScores,SaveScores

		XREF	WriteData,ReadData
		XREF	_SysBase

		INCLUDE	"MyExec.i"
		INCLUDE	"DosFileNames.i"
		INCLUDE	"definitions.i"


* Input:	D0 = Score
* Result	D0 = Position / A0 = Zeiger auf Eintrag

GetPosition:	movem.l	d1-d7/a1-a6,-(SP)
		moveq.l	#1,d1
		moveq.l	#NUMENTRIES-1,d2
		lea	HiList(pc),a0
1$:		cmp.l	he_Score(A0),d0	
		beq.s	2$
		bgt.s	2$
		add.w	#he_SIZEOF,a0
		addq.w	#1,d1
		dbf	d2,1$
		moveq.l	#0,d1
2$:
		move.l	d1,d0
		movem.l	(SP)+,d1-d7/a1-a6
		rts


* Input:	D0 = Score / A0 = Name
* Result:	D0 = Position 

InsertScore:	movem.l	d1-d7/a1-a6,-(SP)
		move.l	a0,a1
		move.l	d0,d1
		bsr.s	GetPosition
		move.l	a0,a6
		move.w	d0,d7
		beq.s	5$
		move.l	a0,a2
		lea	HiList+hl_SIZEOF-he_SIZEOF(pc),a4  ; letzter Eintrag
		lea	-he_SIZEOF(A4),a3		; zweitletzter Eintrag

1$:		cmp.l	a0,a4
		beq.s	3$
		moveq.l	#he_SIZEOF-1,d2			; Länge eines Eintrages
2$:		move.b	(A3)+,(A4)+
		dbf	d2,2$
		sub.w	#2*he_SIZEOF,a3
		sub.w	#2*he_SIZEOF,a4
		bra.s	1$
3$:			
		move.l	d1,he_Score(a0)
		moveq.l	#NAMESIZE-1,d0
4$:		move.b	(A1)+,(A0)+
		dbf	d0,4$
		move.w	d7,d0
		move.l	a6,a0
5$:		movem.l	(SP)+,d1-d7/a1-a6
		rts

LoadScores:	movem.l	d0-d7/a0-a6,-(sp)
		lea	HiList-4,a0
	;;	jsr	ReadData
		movem.l	(sp)+,d0-d7/a0-a6
		rts

SaveScores:	movem.l	d0-d7/a0-a6,-(sp)
		lea	HiList-4,a0			* Destination
	;;	jsr	WriteData
		movem.l	(sp)+,d0-d7/a0-a6
		rts

		dc.l	12345678
HiList:		dc.b	"ROLLING",0
		dc.l	90000
		dc.b	" RONNY ",0
		dc.l	80000
		dc.b	"-------",0
		dc.l	70000
		dc.b	" AMIGA ",0
		dc.l	60000
		dc.b	"VERSION",0
		dc.l	50000
		dc.b	"  BY   ",0
		dc.l	40000
		dc.b	" RENE  ",0
		dc.l	30000
		dc.b	"ORLANDO",0
		dc.l	20000
		dc.b	"  AND  ",0
		dc.l	10000
		dc.b	"CHW/CHH",0
		dc.l	5000

		dc.l	0,0,0,0,0,0,0

