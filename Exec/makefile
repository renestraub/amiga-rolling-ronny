##########################################################################
#                                                                        #
#   Makefile f�r das mega-geniale Game-Exec-Betriebssystem von CHW :-)   #
#                                                                        #
#   Created: 18-May-89 CHW                  Last update: 23-Feb-91 CHW   #
#                                                                        #
##########################################################################


#### Flags:

CFLAGS = -cfustq -fid -ms -v -rr 
#CFLAGS = -cfrustq -fid -ms -v -rr -d2
AFLAGS = -l -iINCLUDE:
LFLAGS = ADDSYM


#### Regeln:

.c.o:
	LC $(CFLAGS) $*.c

.S.r:
	genim2 $(AFLAGS) $*.S -o$*.r -eRAMVERSION=1

.S.m:
	genim2 $(AFLAGS) $*.S -o$*.m -eSYSTEM=1

.S.o:
	genim2 $(AFLAGS) $*.S -o$*.o -eDISKVERSION=1


#### Alle Exec-Module:

RAMMODS  =	Exec.r Memory.r LoadSeg.r Keyboard.r CDisk.r RAMLib.r\
 PPDecrunch.r RawDoFmt.r DrawBob.r Rnd.r FFS.r EndLabel.r

SYSMODS  =	Exec.m Memory.m LoadSeg.m Keyboard.m SysCDisk.m RAMLib.m\
 PPDecrunch.m RawDoFmt.m DrawBob.m Rnd.m CDTV.m EndLabel.m

DISKMODS =	Exec.o Memory.o LoadSeg.o Keyboard.o CDisk.o RAMLib.o\
 PPDecrunch.o RawDoFmt.o DrawBob.o Rnd.o FFS.o EndLabel.o


#### Programme:

All:		h:MyExec.i h:DrawBob.i Track0 Start SysStart FinalBooter

h:MyExec.i:	MyExec.i
		Copy MyExec.i h:

h:DrawBob.i:	DrawBob.i
		Copy DrawBob.i h:

RAMExec.S:	$(RAMMODS)
		BLINK FROM $(RAMMODS) TO T:__exectmp LIB LIB:small.lib
		AbsLoad >NIL: -a0 -o T:__exectmp2 T:__exectmp
		HexDump -L -X _ExecModuleStart -Y _ExecModuleEnd -O$@ T:__exectmp2
		@Delete T:__exectmp T:__exectmp2

Track0:		$(DISKMODS)
		BLINK FROM $(DISKMODS) TO T:__exectmp LIB LIB:small.lib
		AbsLoad >NIL: -a0 -o T:__exectmp2 T:__exectmp
		Join BootBlock T:__exectmp2 as Track0
		@Delete T:__exectmp T:__exectmp2

Start:		start.o RAMExec.o
		BLINK ADDSYM FROM chlib:arpstartup.o start.o ramexec.o TO $* \
 LIB LIB:arpglue.lib LIB:lcr.lib CHLIB:ch.lib LIB:small.lib
		Copy Start c2: clone

SysStart:	sysstart.o $(SYSMODS)
		BLINK ADDSYM FROM chlib:arpstartup.o Sysstart.o $(SYSMODS) TO $* \
 LIB LIB:arpglue.lib CHLIB:ch.lib LIB:lcr.lib LIB:small.lib
		Copy SysStart c2: clone

FinalBooter:	FinalBooter.o
		BLINK FROM chlib:TinyStartup.o $*.o TO T:__exectmp LIB chlib:ch.lib LIB:small.lib
		AbsLoad -�cb -oFinalBooter T:__exectmp
		@Delete T:__exectmp

Disk-Validator:	FinalBooter.S
		Genim2 -ih: FinalBooter.S -oDisk-Validator -eBCPL=1


#### Abh�ngigkeiten:

$(RAMMODS):	myexec.i
$(DISKMODS):	myexec.i
$(SYSMODS):	myexec.i
DrawBob.o:	h:DrawBob.i
