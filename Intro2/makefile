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
MODS    = Intro.o Gfx.o DosFilenames.o Gfx/IntroBobs
DRIVE   = RAM:
ASM	= GenIm2

#### Regeln: 

.s.o:
		$(ASM) $*.S -o$*.o $(AFLAGS) 

#### Programme:

All:		Intro

Intro:		$(MODS) 
		SLink FROM $(MODS) TO $* $(LFLAGS2)
		SpecAbsLoad >NIL: -d -oGame/MainPrg Intro

#$(MODS):	Filenames.i
