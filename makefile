#####################################################################
#                                                                   #
#   Makefile für Exec Test                                          #
#                                                                   #
#   Created: 18-May-89 CHW             Last update: 22-May-89 CHW   #
#                                                                   #
#####################################################################

#### Allgemeine Flags:

AFLAGS	= -ih: -l
LFLAGS	= SMALLCODE SMALLDATA NOICONS
LFLAGS2	= SMALLCODE NOICONS
DISKMODS  = Main.o Gfx.o Collision.o HiScore.o JoyStick.o SndPlayer.o\
     	    Bobs1.o Bobs2.o Bobs3.o Bobs4.o Copper.o\
	    Bobs5.o Bobs6.o Bobs7.o DosFileNamesI.o\
  	    Bobs8.o Bobs9.o Disk.o ExecBase.o

VMODS = Virgin.o

IMODS = Intro.o Gfx.o Iff.o IntroFilenames.o Gfx/IntroBobs ExecBase.o

MODS  = Main.o Gfx.o Collision.o HiScore.o JoyStick.o SndPlayer.o\
	Bobs1.o Bobs2.o Bobs3.o Bobs4.o Copper.o\
	Bobs5.o Bobs6.o Bobs7.o DosFileNames.o\
	Bobs8.o Bobs9.o Disk.o ExecBase.o Iff.o

DRIVE   = RAM:
DRIVE2  = RAM:
BACKUP  = DH0:Ronny/
ASM	= Genim2

#### Regeln: 

.S.o:
	$(ASM) $*.S -o$*.o $(AFLAGS)

#### Programme:

All:	Virgin Main Intro

Virgin:	$(VMODS)
	SLink FROM $(VMODS) TO $* $(LFLAGS)
	SpecAbsLoad >NIL: -d -oGame/VirginPrg Virgin

Intro:	$(IMODS)
	SLink FROM $(IMODS) TO $* $(LFLAGS)
	SpecAbsLoad >NIL: -d -oGame/IntroPrg Intro
	
Main:	$(MODS)
	SLink FROM $(MODS) TO $* $(LFLAGS2)
	SpecAbsLoad >NIL: -d -oGame/MainPrg Main




main.s:	english.i
gfx.s:	gfx.i
