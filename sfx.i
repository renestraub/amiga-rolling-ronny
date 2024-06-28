
	IFD	SNDPLAYER_S
	 XDEF	SetSound,MusicVBL,LockVoices,SongPtr		* SndPlayer
	 XDEF	PlayFX
	ENDC

	IFND	SNDPLAYER_S
	 XREF	SetSound,MusicVBL,LockVoices,SongPtr		* SndPlayer
	 XREF	PlayFX
	ENDC

	STRUCTURE SoundFxStrct,0

		ULONG	sfx_Address
		UWORD	sfx_Length
		UWORD	sfx_Period
		UWORD	sfx_Volume
		LABEL	sfx_SIZEOF

SFX_LOOP:	EQU	$8000

SoundFX:	MACRO

		 IFNE	NARG-4
		  FAIL	"ERROR : SoundFX-Macro needs 4 Arguments"
		 ENDC

		 IFEQ	NARG-4
		  dc.l	\1			; Address
		  dc.w	\2/2			; Length
		  dc.w	\3,\4			; Period/Volume
		 ENDC
		ENDM	

