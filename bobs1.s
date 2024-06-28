************************************************************************************
***  Level2
************************************************************************************

		XDEF	EnemyList1
		XDEF	Level1BobTab

		XDEF	Global,Tropfen2,GlobalHund2,LBieneFast2,LBieneSlow2
		XDEF	FussGlobal,LFassSubMove,LKeuleGlobal,FussGänger
		XDEF	KopfGlobal,KopfBigGlobal,LBiene,LokGlobal
		XDEF	GlobalKiss,WeckerGlobal,LKeuleGlobal2,WeckerGlobal2
		XDEF	Tropfen3,GlobalLFlieger
		XDEF	Spacer,Blip,KatzeGlobal,BulleGlobal
		XDEF	MöveGlobal


		XREF	_MyExecBase
		XREF	ShootColl,RonnyColl,EnergyColl,HealthColl

		XREF	FallHandler,CommonRemBob,WonderVars
		XREF	CommonRemBobTest
		XREF	GetElem,GetInfo,ShopColl

		XREF	ImmerHonkBob,ImmerJumpBob,ImmerBombBob,ImmerCheeseBob,ImmerMagnetoBob
		XREF	ImmerFrageZeichen,ImmerBonusBob1,ImmerBonusBob3
		XREF	ImmerShopBob1
		XREF	ImmerCoinBob,Coin,ImmerEmptyBob
		XREF	ImmerCubeBob1,ImmerCubeBob2,ImmerCubeBob3,ImmerCubeBob4
		XREF	ImmerGetJobBob,ImmerSandUhr
		XREF	ImmerBusStop1,ImmerBusStop2,ImmerBusStop3

		XREF	ImmerHaus64Bob,Job1Done,ImmerCloudBob
		XREF	Play8SVX

		INCLUDE "myexec.i"
		INCLUDE	"drawbob.i"
		INCLUDE	"sfx.i"
		INCLUDE	"definitions.i"
		INCLUDE	"Gfx/Level1Bob.i"
		INCLUDE	"Gfx/ImmerBobs.i"

	STRUCTURE Level1bobStructure,0

		BYTE	Level1Dummy
		BYTE	Level1ShopBob
		BYTE	Level1CoinBob
		BYTE	Level1CubeBob1
		BYTE	Level1CubeBob2
		BYTE	Level1CubeBob3
		BYTE	Level1CubeBob4
		BYTE	Level1JumpBob
		BYTE	Level1CheeseBob
		BYTE	Level1BombBob
		BYTE	Level1BonusBob1
		BYTE	Level1BonusBob3
		BYTE	Level1FrageZeichen
		BYTE	Level1Haus64Bob
		BYTE	Level1EmptyBob
		BYTE	Level1GetJobBob
		BYTE	Level1BusStop
		BYTE	Level1SandUhr

		BYTE	Level1Wecker
		BYTE	Level1StopSchild
		BYTE	Level1GreenHupf
		BYTE	Level1Kopf
		BYTE	Level1LBieneSlow
		BYTE	Level1LBieneFast
		BYTE	Level1LVogelSlow
		BYTE	Level1LVogelFast
		BYTE	Level1GreenKoffer
		BYTE	Level1KackVogel
		BYTE	Level1LHund
		BYTE	Level1PyloneMove
		BYTE	Level1LRoller
		BYTE	Level1KissMouth
		BYTE	Level1KopfBigMove
		BYTE	Level1Blume
		BYTE	Level1Milch
		BYTE	Level1NachtTopf
		BYTE	Level1LSchmetterling
		BYTE	Level1Banane
		BYTE	Level1Tropfen
		BYTE	Level1Hydrant
		BYTE	Level1LKatze
		BYTE	Level1AutoKlein100
		BYTE	Level1AutoKlein40
		BYTE	Level1PlattForm
		BYTE	Level1FahrVerbot
		BYTE	Level1LKeule
		BYTE	Level1LFussgänger
		BYTE	Level1LFass
		BYTE	Level1Draisine
		BYTE	Level1LFlieger
		BYTE	Level1LRöhre
		BYTE	Level1DampfLok
		BYTE	Level1LBuch
		BYTE	Level1LBall
		BYTE	Level1LBulle
		BYTE	Level1LBullenAuto

Level1BobTab:	dc.l	0			* Dummy
		dc.l	ImmerShopBob1
		dc.l	ImmerCoinBob
		dc.l	ImmerCubeBob1
		dc.l	ImmerCubeBob2
		dc.l	ImmerCubeBob3
		dc.l	ImmerCubeBob4
		dc.l	ImmerJumpBob
		dc.l	ImmerCheeseBob
		dc.l	ImmerBombBob
		dc.l	ImmerBonusBob1
		dc.l	ImmerBonusBob3
		dc.l	ImmerFrageZeichen
		dc.l	ImmerHaus64Bob
		dc.l	ImmerEmptyBob
		dc.l	ImmerGetJobBob
		dc.l	ImmerBusStop1
		dc.l	ImmerSandUhr

		dc.l	Lev1Wecker
		dc.l	Lev1StopSchild
		dc.l	Lev1GreenHupf
		dc.l	Lev1Kopf
		dc.l	Lev1LBieneSlow
		dc.l	Lev1LBieneFast
		dc.l	Lev1LVogelSlow
		dc.l	Lev1LVogelFast
		dc.l	Lev1GreenKoffer
		dc.l	Lev1KackVogel
		dc.l	Lev1LHund
		dc.l	Lev1PyloneMove
		dc.l	Lev1LRoller
		dc.l	Lev1KissMouth
		dc.l	Lev1KopfBigMove
		dc.l	Lev1Blume
		dc.l	Lev1Milch
		dc.l	Lev1NachtTopf
		dc.l	Lev1LSchmetterling
		dc.l	Lev1Banane
		dc.l	Lev1Tropfen
		dc.l	Lev1Hydrant
		dc.l	Lev1LKatze
		dc.l	Lev1AutoKlein100
		dc.l	Lev1AutoKlein40
		dc.l	Lev1PlattForm
		dc.l	Lev1FahrVerbot
		dc.l	Lev1LKeule
		dc.l	Lev1LFussgänger
		dc.l	Lev1LFass
		dc.l	Lev1Draisine
		dc.l	Lev1LFlieger
		dc.l	Lev1LRöhre
		dc.l	Lev1DampfLok
		dc.l	Lev1LBuch
		dc.l	Lev1LBall
		dc.l	Lev1LBulle
		dc.l	Lev1LBullenAuto


		SECTION	MyData,DATA

		SETBOB	-30000,0,0,0,0
EnemyList1:
		SETBOB	6,62,0,Level1CoinBob,Level1CoinBob

		SETBOB	122,128,0,Level1StopSchild,Level1StopSchild

		SETBOB	232,85,0,Level1CubeBob1,Level1CubeBob1
		SETBOB	244,127,0,Level1GreenHupf,Level1GreenHupf

		SETBOB	315,60,0,Level1Kopf,Level1Kopf
		SETBOB	323,30,0,Level1LBieneFast,0
		SETBOB	329,146,0,Level1CubeBob3,Level1CubeBob3
		SETBOB	360,60,0,Level1Kopf,Level1Kopf
		SETBOB	361,90,0,Level1LBieneFast,0
		SETBOB	385,40,0,Level1LBieneSlow,0

		SETBOB	405,60,0,Level1Kopf,Level1Kopf
		SETBOB	472,127,0,Level1GreenKoffer,Level1GreenKoffer
		SETBOB	489,118,0,Level1CheeseBob,Level1CheeseBob

		SETBOB	620,69,0,Level1LVogelSlow,0
		SETBOB	650,80,0,Level1LVogelFast,0
		SETBOB	664,110,0,Level1FrageZeichen,Level1FrageZeichen

		SETBOB	712,161,0,Level1LVogelSlow,0
		SETBOB	714,55,0,Level1CubeBob1,Level1CubeBob1
		SETBOB	760,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	770,44,0,Level1LVogelSlow,0
		SETBOB	775,175,0,Level1LHund,Level1LHund
		SETBOB	790,69,0,Level1LVogelSlow,0

		SETBOB	805,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	820,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	830,80,0,Level1LVogelSlow,0

		SETBOB	928,175,0,Level1PyloneMove,Level1PyloneMove
		SETBOB	960,154,0,Level1Kopf,Level1Kopf
		SETBOB	983,85,0,Level1CubeBob2,Level1CubeBob2

		SETBOB	1005,154,0,Level1Kopf,Level1Kopf
		SETBOB	1030,140,0,Level1CubeBob1,Level1CubeBob1
		SETBOB	1050,154,0,Level1Kopf,Level1Kopf

		SETBOB	1200,175,0,Level1LRoller,0

		SETBOB	1200,68,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	1200,68,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	1200,68,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	1200,68,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	1200,68,$0200,Level1CoinBob,Level1CoinBob

		SETBOB	1320,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	1350,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	1390,38,0,Level1KackVogel,Level1KackVogel

		SETBOB	1430,78,0,Level1LVogelFast,0
		SETBOB	1450,100,0,Level1JumpBob,Level1JumpBob

		SETBOB	1520,176,0,Level1KissMouth,Level1KissMouth
		SETBOB	1536,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	1592,206,0,Level1KopfBigMove,Level1KopfBigMove
		SETBOB	1592,130,0,Level1KopfBigMove,Level1KopfBigMove

		SETBOB	1670,36,0,Level1CubeBob3,Level1CubeBob3
		SETBOB	1688,95,0,Level1Blume,Level1Blume

		SETBOB	1704,175,0,Level1Milch,Level1Milch
		SETBOB	1725,95,0,Level1NachtTopf,Level1NachtTopf
		SETBOB	1790,60,0,Level1CubeBob1,Level1CubeBob1

		SETBOB	1898,91,0,Level1BonusBob1,Level1BonusBob1

		SETBOB	1959,11,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	1959,11,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	1959,11,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	1959,11,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	1959,11,$0200,Level1CoinBob,Level1CoinBob
		SETBOB	1995,80,0,Level1LSchmetterling,0

		SETBOB	2062,175,0,Level1Milch,Level1Milch
		SETBOB	2097,68,0,Level1CubeBob1,Level1CubeBob1

		SETBOB	2109,175,0,Level1Banane,Level1Banane
		SETBOB	2182,20,0,Level1Tropfen,Level1Tropfen
		SETBOB	2198,0,0,Level1Tropfen,Level1Tropfen

		SETBOB	2212,175,0,Level1Hydrant,Level1Hydrant
		SETBOB	2253,10,0,Level1Tropfen,Level1Tropfen
		SETBOB	2263,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	2267,100,0,Level1CubeBob2,Level1CubeBob2
		SETBOB	2273,20,0,Level1Tropfen,Level1Tropfen
		SETBOB	2283,0,0,Level1Tropfen,Level1Tropfen

		SETBOB	2303,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	2313,20,0,Level1Tropfen,Level1Tropfen
		SETBOB	2323,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	2332,120,0,Level1CubeBob1,Level1CubeBob1
		SETBOB	2333,10,0,Level1Tropfen,Level1Tropfen

		SETBOB	2411,66,0,Level1CubeBob3,Level1CubeBob3

		SETBOB	2555,46,0,Level1FrageZeichen,Level1FrageZeichen
		SETBOB	2583,175,0,Level1LKatze,Level1LKatze

		SETBOB	2645,79,0,Level1AutoKlein100,Level1AutoKlein100
		SETBOB	2692,31,0,Level1AutoKlein40,Level1AutoKlein40

		SETBOB	2711,36,0,Level1EmptyBob,Level1EmptyBob

		SETBOB	2866,47,0,Level1AutoKlein100,Level1AutoKlein100
		SETBOB	2882,79,0,Level1AutoKlein100,Level1AutoKlein100

		SETBOB	2989,106,0,Level1BonusBob3,Level1BonusBob3

		SETBOB	3100,120,0,Level1PlattForm,Level1PlattForm
		SETBOB	3187,175,0,Level1FahrVerbot,Level1FahrVerbot
		SETBOB	3198,175,0,Level1LHund,Level1LHund

		SETBOB	3299,34,0,Level1CubeBob4,Level1CubeBob4

		SETBOB	3325,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	3348,4,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	3348,4,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	3348,4,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	3348,4,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	3348,4,$0200,Level1CoinBob,Level1CoinBob
		SETBOB	3359,111,0,Level1Banane,Level1Banane

		SETBOB	3413,64,0,Level1LVogelFast,0
		SETBOB	3498,22,0,Level1KackVogel,Level1KackVogel

		SETBOB	3520,37,0,Level1LVogelSlow,0
		SETBOB	3597,100,0,Level1LVogelFast,0
		SETBOB	3598,90,0,Level1EmptyBob,Level1EmptyBob

		SETBOB	3600,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	3645,21,0,Level1LVogelSlow,0
		SETBOB	3650,148,0,Level1LKeule,0
		SETBOB	3680,165,0,Level1LKeule,0

		SETBOB	3703,69,0,Level1CubeBob3,Level1CubeBob3
		SETBOB	3710,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	3720,148,0,Level1LKeule,0
		SETBOB	3723,76,0,Level1LVogelFast,0
		SETBOB	3730,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	3745,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	3767,63,0,Level1FrageZeichen,Level1FrageZeichen

		SETBOB	3800,175,0,Level1LFussgänger,Level1LFussgänger
		SETBOB	3870,175,0,Level1GreenHupf,0

		SETBOB	3900,175,0,Level1GreenHupf,0
		SETBOB	3907,50,0,Level1CubeBob2,Level1CubeBob2
		SETBOB	3928,152,0,Level1Haus64Bob,Level1Haus64Bob
		SETBOB	3975,175,0,Level1LFass,Level1LFass
		SETBOB	3989,55,0,Level1EmptyBob,Level1EmptyBob

		SETBOB	4052,175,0,Level1Wecker,Level1Wecker

		SETBOB	4104,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	4119,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	4196,51,0,Level1CubeBob1,Level1CubeBob1

		SETBOB	4223,30,0,Level1LBieneFast,0
		SETBOB	4244,86,0,Level1LBieneSlow,0
		SETBOB	4252,55,0,Level1LBieneFast,0

		SETBOB	4319,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	4350,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	4356,158,0,Level1LSchmetterling,0

		SETBOB	4400,175,0,Level1Draisine,0
		SETBOB	4460,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	4470,48,0,Level1LFlieger,0
		SETBOB	4485,70,0,Level1CubeBob3,Level1CubeBob3
		SETBOB	4490,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	4496,38,0,Level1KackVogel,Level1KackVogel

		SETBOB	4519,0,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	4519,0,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	4519,0,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	4519,0,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	4519,0,$0200,Level1CoinBob,Level1CoinBob
		SETBOB	4550,38,0,Level1KackVogel,Level1KackVogel

		SETBOB	4654,155,0,Level1LFlieger,0
		SETBOB	4657,173,0,Level1LRöhre,Level1LRöhre

		SETBOB	4756,106,0,Level1CubeBob2,Level1CubeBob2
		SETBOB	4757,131,0,Level1LRöhre,Level1LRöhre

		SETBOB	4840,90,0,Level1EmptyBob,Level1EmptyBob
		SETBOB	4857,173,0,Level1LRöhre,Level1LRöhre

		SETBOB	4900,22,0,Level1KackVogel,Level1KackVogel

		SETBOB	5013,119,0,Level1JumpBob,Level1JumpBob
		SETBOB	5088,38,0,Level1KackVogel,Level1KackVogel

		SETBOB	5100,22,0,Level1KackVogel,Level1KackVogel
		SETBOB	5125,38,0,Level1KackVogel,Level1KackVogel

		SETBOB	5225,106,0,Level1BonusBob3,Level1BonusBob3

		SETBOB	5323,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	5333,20,0,Level1Tropfen,Level1Tropfen
		SETBOB	5343,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	5353,10,0,Level1Tropfen,Level1Tropfen
		SETBOB	5363,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	5373,20,0,Level1Tropfen,Level1Tropfen
		SETBOB	5376,57,0,Level1CubeBob3,Level1CubeBob3
		SETBOB	5383,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	5393,10,0,Level1Tropfen,Level1Tropfen

		SETBOB	5403,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	5413,20,0,Level1Tropfen,Level1Tropfen
		SETBOB	5421,80,0,Level1CubeBob4,Level1CubeBob4
		SETBOB	5423,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	5433,10,0,Level1Tropfen,Level1Tropfen
		SETBOB	5443,0,0,Level1Tropfen,Level1Tropfen
		SETBOB	5450,150,0,Level1EmptyBob,Level1EmptyBob
		SETBOB	5453,20,0,Level1Tropfen,Level1Tropfen
		SETBOB	5463,0,0,Level1Tropfen,Level1Tropfen

		SETBOB	5498,154,0,Level1FrageZeichen,Level1FrageZeichen
		SETBOB	5555,130,0,Level1CubeBob2,Level1CubeBob2

		SETBOB	5660,158,0,Level1LVogelFast,0

		SETBOB	5718,0,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	5718,0,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	5718,0,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	5718,0,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	5718,0,$0200,Level1CoinBob,Level1CoinBob
		SETBOB	5719,175,0,Level1LVogelSlow,0
		SETBOB	5721,101,0,Level1EmptyBob,Level1EmptyBob
		SETBOB	5750,151,0,Level1LVogelFast,0
		SETBOB	5784,66,0,Level1EmptyBob,Level1EmptyBob
		SETBOB	5784,130,0,Level1EmptyBob,Level1EmptyBob

		SETBOB	5833,66,0,Level1EmptyBob,Level1EmptyBob
		SETBOB	5833,105,0,Level1EmptyBob,Level1EmptyBob
		SETBOB	5855,32,0,Level1CubeBob2,Level1CubeBob2

		SETBOB	5999,4,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	5999,4,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	5999,4,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	5999,4,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	5999,4,$0200,Level1CoinBob,Level1CoinBob

		SETBOB	6069,162,0,Level1EmptyBob,Level1EmptyBob

		SETBOB	6206,143,0,Level1ShopBob,Level1ShopBob

		SETBOB	6412,44,0,Level1CubeBob3,Level1CubeBob3
		SETBOB	6479,62,0,Level1CoinBob,Level1CoinBob

		SETBOB	6567,175,0,Level1DampfLok,0
		SETBOB	6569,155,0,Level1EmptyBob,Level1EmptyBob

		SETBOB	6741,122,0,Level1LBuch,0
		SETBOB	6774,108,0,Level1LBuch,0
		SETBOB	6795,97,0,Level1FrageZeichen,Level1FrageZeichen

		SETBOB	6886,149,$FD00,Level1LBall,Level1LBall

		SETBOB	6904,144,0,Level1KissMouth,Level1KissMouth
		SETBOB	6960,174,0,Level1LBullenAuto,Level1LBullenAuto

		SETBOB	7001,25,0,Level1CoinBob,Level1CoinBob
		SETBOB	7047,25,0,Level1CoinBob,Level1CoinBob

		SETBOB	7100,25,0,Level1CoinBob,Level1CoinBob
		SETBOB	7177,25,0,Level1CoinBob,Level1CoinBob

		SETBOB	7232,63,0,Level1LKatze,Level1LKatze

		SETBOB	7411,175,0,Level1GetJobBob,Level1GetJobBob

		SETBOB	7650,175,0,Level1LBulle,0
		SETBOB	7657,87,0,Level1CoinBob,Level1CoinBob
		SETBOB	7682,168,0,Level1CubeBob1,Level1CubeBob1

		SETBOB	7700,77,0,Level1EmptyBob,Level1EmptyBob
		SETBOB	7710,175,0,Level1Hydrant,Level1Hydrant
		SETBOB	7777,47,0,Level1BonusBob1,Level1BonusBob1
		SETBOB	7795,124,0,Level1FrageZeichen,Level1FrageZeichen

		SETBOB	7889,54,0,Level1LRöhre,Level1LRöhre

		SETBOB	7960,158,0,Level1Kopf,Level1Kopf
		SETBOB	7969,4,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	7969,4,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	7969,4,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	7969,4,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	7969,4,$0200,Level1CoinBob,Level1CoinBob

		SETBOB	8096,47,0,Level1LFass,Level1LFass

		SETBOB	8112,175,0,Level1LBulle,Level1LBulle
		SETBOB	8170,117,0,Level1BombBob,Level1BombBob
		SETBOB	8172,38,0,Level1KackVogel,Level1KackVogel
		SETBOB	8282,93,0,Level1SandUhr,Level1SandUhr
		SETBOB	8361,166,0,Level1JumpBob,Level1JumpBob
		SETBOB	8454,56,0,Level1CubeBob1,Level1CubeBob1
		SETBOB	8540,175,0,Level1LBulle,Level1LBulle
		SETBOB	8567,141,0,Level1CubeBob2,Level1CubeBob2
		SETBOB	8586,64,0,Level1CoinBob,Level1CoinBob
		SETBOB	8653,86,0,Level1KackVogel,Level1KackVogel
		SETBOB	8698,75,0,Level1BonusBob3,Level1BonusBob3
		SETBOB	8840,175,0,Level1LRoller,0

		SETBOB	8951,52,0,Level1CubeBob4,Level1CubeBob4
		SETBOB	8990,90,0,Level1EmptyBob,Level1EmptyBob

		SETBOB	9025,174,0,Level1LBullenAuto,Level1LBullenAuto

		SETBOB	9175,0,$FE00,Level1CoinBob,Level1CoinBob
		SETBOB	9175,0,$FF00,Level1CoinBob,Level1CoinBob
		SETBOB	9175,0,$0000,Level1CoinBob,Level1CoinBob
		SETBOB	9175,0,$0100,Level1CoinBob,Level1CoinBob
		SETBOB	9175,0,$0200,Level1CoinBob,Level1CoinBob

		SETBOB	9800,175,0,Level1BusStop,Level1BusStop

		SETBOB	30000,0,0,0,0

****************************************************************************

Lev1LSchmetterling:
		SETDATA		Level1Bob12,WonderVars+BobBase
		SETANIM		BieneAnim
		SETMOVE		BieneMoveSlow
		SETANIMSPEED	2
		GOTO		LBiene

****************************************************************************

Lev1LBieneFast:	SETDATA		Level1Bob44,WonderVars+BobBase
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
LBieneFast2:	SETANIM		BieneAnim
		SETMOVE		BieneMoveFast
		GOTO		LBiene

Lev1LBieneSlow:	SETDATA		Level1Bob44,WonderVars+BobBase
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
LBieneSlow2:	SETANIM		BieneAnim
		SETMOVE		BieneMoveSlow
LBiene:		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

Lev1RBieneFast:	SETDATA		Level1Bob46,WonderVars+BobBase
		SETFLAGS	BOBF_FLIPXMOVE
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		LBieneFast2

Lev1RBieneSlow:	SETDATA		Level1Bob46,WonderVars+BobBase
		SETFLAGS	BOBF_FLIPXMOVE
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		GOTO		LBieneSlow2

BieneAnim:	dc.w		0,1
		LOOP


BieneMoveFast:	SETMOVESTEP	3
		LEFT		120
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

BieneMoveSlow:	SETMOVESTEP	2
		LEFT		180
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev1LVogelFast:	SETDATA		Level1Bob160,WonderVars+BobBase
		SETANIM		VogelAnim
		SETMOVE		BieneMoveFast
		GOTO		LBiene

Lev1LVogelSlow:	SETDATA		Level1Bob160,WonderVars+BobBase
MöveGlobal:	SETANIM		VogelAnim
		SETMOVE		BieneMoveSlow
		SETUSERDATA	$01000000
		GOTO		LBiene

VogelAnim:	SETANIMSPEED	3
		ANIMTO		0,3
		ANIMTO		3,0
		LOOP

****************************************************************************

Lev1LHund:	SETDATA		Level1Bob84,WonderVars+BobBase
GlobalHund2:	SETANIM		LHundAnim
		SETMOVE		LHundMove
		SETMOVESTEP	8
		SETANIMSPEED	3

GlobalHund:	SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETUSERDATA	$02000000
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

LHundAnim:	FOR		24
		 ANIMTO		4,7
		 LSIGNAL	1
		NEXT
		FOR		24
		 ANIMTO		0,3
		 LSIGNAL	1
		NEXT
		LOOP

LHundMove:	FOR		15
		 LEFT		1
		 LWAIT		1
		NEXT
		FOR		9
		 LEFT		1
		 LWAIT		1
		NEXT
		FOR		24
		 RIGHT		1
		 LWAIT		1
		NEXT
		LOOP

****************************************************************************

Lev1LKatze:	SETDATA		Level1Bob130,WonderVars+BobBase
KatzeGlobal:	SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	14
		SETANIMSPEED	2
		GOTO		GlobalHund

1$:		FOR		16
		 ANIMTO		8,15
		 LSIGNAL	1
		NEXT
		FOR		16
		 ANIMTO		0,7
		 LSIGNAL	1
		NEXT
		LOOP

2$:		FOR		16
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		16
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

****************************************************************************

Lev1LFlieger:	SETDATA		Level1Bob61,WonderVars+BobBase
GlobalLFlieger:	SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	2
		SETANIMSPEED	2
		SETPRI		32
		GOTO		GlobalHund

1$:		dc.w		0
		RNDDELAY	10,40
		ANIMTO		0,7
		dc.w		0
		LOOP

2$:		LEFT		180
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev1LBulle:	SETDATA		Level1Bob113,WonderVars+BobBase
BulleGlobal:	SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	13
		GOTO		FussGlobal

1$:		FOR		30
		 ANIMTO		0,6
		 LSIGNAL	1
		NEXT
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

2$:		FOREVER
		 LWAIT		1
		 LEFT		1
		NEXT

****************************************************************************

Lev1AutoKlein100:
		SETDATA		Level1Bob35,WonderVars+BobBase
		SETANIM		AutoAnim100
		SETMOVE		AutoMove100
AutoBob:	SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		ENDE

Lev1AutoKlein40:
		SETDATA		Level1Bob35,WonderVars+BobBase
		SETANIM		AutoAnim40
		SETMOVE		AutoMove40
		GOTO		AutoBob

AutoAnim100:	FOR		25
		 dc.w		2,3
		NEXT
		FOR		25
		 dc.w		0,1
		NEXT
		LOOP

AutoAnim40:	FOR		10
		 dc.w		2,3
		NEXT
		FOR		10
		 dc.w		0,1
		NEXT
		LOOP

AutoMove100:	LEFT		100
		RIGHT		100
		LOOP

AutoMove40:	LEFT		40
		RIGHT		40
		LOOP

****************************************************************************

Lev1LBullenAuto:
		SETDATA		Level1Bob111,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_STURZ
		SETPRI		32
		ENDE

1$:		dc.w		0
		LWAIT		1
		dc.w		1
		LWAIT		1
		LOOP
		
2$:		LEFT		100
		LSIGNAL		1
		RIGHT		100
		LSIGNAL		1
		CPUJUMP		Play8SVX,Hupe
		LOOP

****************************************************************************

Lev1LBall:	SETDATA		Level1Bob97,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_STURZ
		ENDE

1$:		SETANIMSPEED	2
		ANIMTO	3,0
		LOOP

2$:		CPUJUMP		Coin,0			* Init
		FOREVER
		 CPUJUMP	Coin,1			* Move
		 DELAY		1
		NEXT

****************************************************************************

Lev1LRoller:	SETDATA		Level1Bob9,WonderVars+BobBase
		SETMOVE		2$
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_STURZ
		ENDE

2$:		ADDDAUGHTER	Dampf,26,-5
		LEFT		160
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev1Kopf:	SETDATA		Level1Bob146,WonderVars+BobBase
KopfGlobal:	SETMOVE		KopfMove1
GotoKopf:	SETANIM		KopfAnim
		SETANIMSPEED	2
		SETMOVESTEP	2
		SETUSERFLAGS	BOBF_ENEMY|BOBF_REMOVE
		SETHITMASK	RONNY_HITCOLL
		ENDE

Lev1KopfBigMove:
		SETDATA		Level1Bob146,WonderVars+BobBase
KopfBigGlobal:	SETMOVE		KopfMove2
		GOTO		GotoKopf


KopfAnim:	ANIMTO		0,5
		LOOP

KopfMove1:	UP		16
		CPUJUMP		Play8SVX,Blip
		DOWN		16
		CPUJUMP		Play8SVX,Blip
		LOOP

KopfMove2:	UP		32
		CPUJUMP		Play8SVX,Blip
		DOWN		32
		CPUJUMP		Play8SVX,Blip
		LOOP

****************************************************************************

Lev1KissMouth:	SETDATA		Level1Bob120,WonderVars+BobBase
GlobalKiss:	SETANIM		1$
		SETANIMSPEED	6
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		ENDE

1$:		RNDDELAY	5,15
		ANIMTO		0,2
		dc.w		1,2,1,1,2,1,2,2,1
		ANIMTO		2,0
		LOOP


****************************************************************************

Lev1GreenHupf:	SETDATA		Level1Bob105,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		SETANIMSPEED	5
		SETMOVESPEED	2	
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		ENDE
	
1$:		FOR		16
		 dc.w		0,1
		NEXT
		FOR		16
		 dc.w		2,3
		NEXT
		LOOP

2$:		LEFT		80
		RIGHT		80
		LOOP

****************************************************************************

Lev1Pylone:	SETDATA		Level1Bob104,WonderVars+BobBase
		SETHITMASK	RONNY_STURZ
		GOTO		Global

Lev1PyloneMove:	SETDATA		Level1Bob104,WonderVars+BobBase
		SETMOVE		1$
		SETHITMASK	RONNY_STURZ
		GOTO		Global

1$:		LEFT		70
		RIGHT		70
		LOOP

****************************************************************************

Lev1LKeule:	SETDATA		Level1Bob27,WonderVars+BobBase
		SETUSERDATA	$03000000
LKeuleGlobal:	SETANIM		LBuchAnim
		SETMOVE		LBuchMove
LKeuleGlobal2:	SETMOVESTEP	2
		SETANIMSPEED	2
		SETHITMASK	RONNY_HITCOLL
		GOTO		Global

****************************************************************************

Lev1LBuch:	SETDATA		Level1Bob152,WonderVars+BobBase
		GOTO		LKeuleGlobal

LBuchAnim:	ANIMTO		0,7
		LOOP

LBuchMove:	LEFT		180
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE

****************************************************************************

Lev1LRöhre:	SETDATA		Level1Bob123,WonderVars+BobBase
RöhreGlobal:	SETANIM		1$
		SETMOVE		2$
		GOTO		LKeuleGlobal2

1$:		ANIMTO		0,6
		LOOP

2$:		LEFT		20
		RIGHT		20
		LOOP

****************************************************************************

Lev1PlattForm:	SETDATA		Level1Bob92,WonderVars+BobBase
		SETANIM		1$
		SETANIMSPEED	3
		SETHITMASK	RONNY_HITCOLL
		GOTO		Global

1$:		ANIMTO		0,4
		LOOP

****************************************************************************

Lev1Milch3:	SETDATA		Level1Bob6,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1NachtTopf:	SETDATA		Level1Bob5,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1StopSchild:	SETDATA		Level1Bob0,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1KackVogel:	SETDATA		Level1Bob69,WonderVars+BobBase
		SETANIM		1$
		GOTO		Global

1$:		RNDDELAY	120,180
		ADDRELBOB	2$,0,0
		LOOP

2$:		SETDATA		Level1Bob168,WonderVars+BobBase
		SETMOVE		3$
		SETMOVESTEP	4
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETHITMASK	RONNY_HITCOLL
		ENDE

3$:		DOWN		45
		REMOVE
		ENDE

****************************************************************************

Lev1LFass:	SETDATA		Level1Bob15,WonderVars+BobBase
		SETANIM		1$
		GOTO		Global

1$:		ADDRELBOB	LFassSub,-10,0
		DELAY		100
		LOOP

LFassSub:	SETDATA		Level1Bob16,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		LFassSubMove
		SETANIMSPEED	3
		SETHITMASK	RONNY_STURZ
		SETUSERFLAGS	BOBF_ENEMY
		SETPRI		-1
		ENDE

1$:		ANIMTO		8,0
		LOOP

LFassSubMove:	CPUJUMP		1$,0
		SETUSERFLAGS	BOBF_ENEMY|BOBF_REMOVE
		FOREVER
		 CPUJUMP	Coin,1
		 DELAY		1
		NEXT

1$:		move.b		#1,bob_UserData+ud_FallingDist(a0)
		move.b		#-2,bob_UserData+ud_XMove(A0)
		rts

****************************************************************************

Lev1FahrVerbot:	SETDATA		Level1Bob3,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1Hydrant:	SETDATA		Level1Bob110,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1Blume:	SETDATA		Level1Bob4,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1Milch:	SETDATA		Level1Bob6,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1Banane:	SETDATA		Level1Bob7,WonderVars+BobBase
		SETMOVE		1$
		SETHITMASK	RONNY_STURZ
		GOTO		Global

1$:		LEFT		20
		RIGHT		20
		LOOP

****************************************************************************

Lev1Muell:	SETDATA		Level1Bob14,WonderVars+BobBase
		GOTO		Global

****************************************************************************

Lev1GreenKoffer:
		SETDATA		Level1Bob103,WonderVars+BobBase
		SETHITMASK	RONNY_STURZ
		GOTO		Global

****************************************************************************

Lev1Wecker:	SETDATA		Level1Bob43,WonderVars+BobBase
WeckerGlobal:	SETMOVE		WeckerMove
WeckerGlobal2:	SETHITMASK	RONNY_HITCOLL
Global:		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETPRI		0
		ENDE

WeckerMove:	LEFT		30
		RIGHT		30
		LOOP

****************************************************************************

Lev1Tropfen:	SETDATA		Level1Bob39,WonderVars+BobBase
Tropfen2:	SETX		-100
		SETUSERFLAGS	BOBF_REMOVE
Tropfen3:	SETMOVE		1$
		SETMOVESTEP	4
		SETCLIP		0,0,0,0,CLIPF_ALL
		SETHITMASK	RONNY_HITCOLL
		ENDE

1$:		DOWN		1
		CPUJUMP		TropfenHandler,0
		LOOP

TropfenAnim:	SETMOVE		0
		dc.w		1,2
		CPUJUMP		CommonRemBobTest,0
		REMOVE
		ENDE



TropfenHandler:	cmp.w		#172,bob_Y(A0)
		blt.s		.KeinBoden

		move.w		#172,bob_Y(A0)

		lea		TropfenAnim(pc),a1
		moveq		#2,d0
		SYSCALL		SetAnimPrg

.KeinBoden:	rts

****************************************************************************

Lev1LFussgänger:
		SETDATA		Level1Bob70,WonderVars+BobBase
FussGänger:	SETANIM		FussAnim
		SETMOVE		FussMove
		SETMOVESTEP	12

FussGlobal:	SETANIMSPEED	2
		SETUSERFLAGS	BOBF_REMOVE
		ENDE

FussAnim:	FOR		20
		 ANIMTO		0,6
		 LSIGNAL	1
		NEXT
		FOR		20
		 ANIMTO		7,13
		 LSIGNAL	1
		NEXT
		LOOP

FussMove:	FOR		20
		 LWAIT		1
		 LEFT		1
		NEXT
		FOR		20
		 LWAIT		1
		 RIGHT		1
		NEXT
		LOOP

****************************************************************************

Lev1Draisine:	SETDATA		Level1Bob24,WonderVars+BobBase
		SETANIM		1$
		SETMOVE		2$
		SETMOVESTEP	2
		SETANIMSPEED	4
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETHITMASK	RONNY_HITCOLL
		ENDE

1$:		FOR		5
		 dc.w		0,1,2,1
		NEXT
		LOOP

2$:		LEFT		80
		RIGHT		80
		LOOP

****************************************************************************

Lev1DampfLok:	SETDATA		Level1Bob42,WonderVars+BobBase
LokGlobal:	SETMOVE		2$
		SETANIM		1$
		SETUSERFLAGS	BOBF_REMOVE|BOBF_ENEMY
		SETUSERDATA	$10000000
		SETHITMASK	RONNY_HITCOLL
		SETMEMASK	SHOOT_COLL
		SETCOLLHANDLER	ShootColl
		ENDE

1$:		CPUJUMP		Play8SVX,SndDampf
		DELAY		11
		LOOP

2$:		ADDDAUGHTER	Dampf,-8,-33
		FOREVER
		 LEFT		150
		 RIGHT		100
		 LEFT		100
		 RIGHT		120
		NEXT
		
****************************************************************************

Dampf:		SETDATA		Level1Bob51,WonderVars+BobBase
		SETANIM		1$
		SETANIMSPEED	2
		SETCLIP		0,0,0,0,CLIPF_ALL
		ENDE

1$:		ANIMTO		0,9
		LOOP

Hupe:		SoundFX	sfx_Hupe,3710,690,45
Spacer:		SoundFX	sfx_Spacer,1524,690,64
Blip:		SoundFX	sfx_Blip,1820,750,50
SndDampf:	SoundFX	sfx_DampfLok,2328,650,50
