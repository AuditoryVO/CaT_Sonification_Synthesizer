;CaT Explorer
;Adrián García Riber
;2024
<Cabbage>
form caption("CaT Explorer") size(835, 535), colour(255, 255, 255), pluginID("CaT Explorer")

image bounds(56, 12, 799, 303), channel("bkgrnd"), corners(10) alpha(0.05)
image bounds(6, 478, 527, 50), channel("deco1"), , corners(10) colour(243, 243, 243, 255)
image bounds(538, 478, 274, 49), channel("deco2"), , corners(10) colour(243, 243, 243, 255)
image bounds(774, 30, 49, 372), channel("deco3"), , corners(10) colour(243, 243, 243, 255)


image bounds(-52, -42, 902, 519) identchannel("Image") corners(10) file("Spectrum.png") 

texteditor bounds(48, 450, 74, 19) channel("texteditor") identchannel("editorIdent0") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
button bounds(16, 450, 28, 19) text("R2", "R2") channel("Mute0") value(1) corners(4)  identchannel("Mute0") fontcolour:0(164, 39, 39, 255) colour:1(148, 148, 148, 255) colour:0(204, 204, 204, 255) 

texteditor bounds(598, 450, 19, 19) channel("texteditor") identchannel("editorIdent1") colour:0(210, 210, 210, 255) fontcolour(100, 100, 100, 255) colour(210, 210, 210, 255) fontcolour:0(100, 100, 100, 255) 
button bounds(548, 450, 41, 19) text("Lines", "Lines") channel("Mute1") value(1) corners(4)  identchannel("Mute1") fontcolour:0(164, 39, 39, 255) colour:1(148, 148, 148, 255) colour:0(204, 204, 204, 255) 
hslider bounds(552, 488, 122, 29) channel("Tremolo"), text("TREM"), range(0, 2, 1, 1, 0.001) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255)

;button bounds(630, 450, 41, 19) text("EQ", "EQ") channel("Mute2") value(1) corners(4)  identchannel("Mute2") fontcolour:0(164, 39, 39, 255) colour:1(148, 148, 148, 255) colour:0(204, 204, 204, 255) 

vslider bounds(784, 38, 30, 113), channel("level"), text("Level"), range(0, 2, 1, 1, 0.001) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255)
hslider bounds(680, 488, 122, 29) channel("Send"), text("REV"), range(0, 4, 2, 1, 0.001) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255)
;hslider bounds(532, 460, 122, 29) channel("Send2"), text("DLY"), range(0, 2, 0.5, 1, 0.001) trackercolour(0, 124, 204, 255) colour(204, 204, 204, 255)
hslider bounds(18, 488, 121, 30), channel("A"), text("A"), range(0.1, 3, 1.5, 1, 0.001) colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)
hslider bounds(144, 488, 121, 31), channel("D"), text("D"), range(0.1, 100, 50, 1, 0.001) colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)
hslider bounds(270, 488, 121, 30), channel("S"), text("S"), range(0.1, 100, 10, 1, 0.001) colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)
hslider bounds(396, 488, 121, 30), channel("R"), text("R"), range(0, 10, 5, 1, 0.001)  colour(204, 204, 204, 255) trackercolour(0, 124, 207, 255)


vslider bounds(784, 156, 30, 113) channel("LpFrec"), text("LPF"), range(20, 20000, 20000, 0.5, 1) trackercolour(0, 124, 207, 255) textboxoutlinecolour(0, 0, 0, 0) colour(204, 204, 204, 255)
vslider bounds(780, 286, 38, 113) channel("HpFrec"), text("HPF")range(20, 20000, 20, 0.5, 1) trackercolour(0, 124, 207, 255) colour(204, 204, 204, 255) 




</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
-odac
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 48000
ksmps =32
nchnls = 2
0dbfs = 1


gks init 0
gkplay init 0
gifrec init 0

gkr2 init 0
gklines init 0
gkf1 init 0
gkf2 init 0
gkf3 init 0
gkf4 init 0
gkf5 init 0
gkf6 init 0

giosc0 OSCinit 9990 
giosc1 OSCinit 9991 
gioscf1 OSCinit 9992 
gioscf2 OSCinit 9993 
gioscf3 OSCinit 9994 
gioscf4 OSCinit 9995 
gioscf5 OSCinit 9996 
gioscf6 OSCinit 9997 



instr 1 ; Synth 1

gkFader chnget "level"
gkLpFrec chnget "LpFrec"
gkHpFrec chnget "HpFrec"

giAtt chnget "A"
giDec chnget "D"
giSus chnget "S"
giRel chnget "R"
kSend chnget "Send"


;------------------------Tremolo
k_mute1 chnget "Mute1" 
  

kaverageamp chnget "Tremolo" 
kaveragefreq = gklines/2
krandamountfreq = 0
kampminrate init 1
kampmaxrate init 15
kcpsminrate init 1
kcpsmaxrate init 15
kvib vibrato kaverageamp, kaveragefreq, 1, krandamountfreq, kampminrate, kampmaxrate, kcpsminrate, kcpsmaxrate, 1

;-----------------------------------------------------------SYNTH 1: VCO2 / SYNTH 2: FMB3
    iShape=2
    iDuty=0.9
;    iAttack=8*0.5*giAtt
;    iRelease=(4-iAttack)*2*giRel
    iAttack = giAtt
    iDecay = giDec
    iSustain = giSus
    iRelease = giRel

    if gklines != 0 then
        kmix = gklines/10
    endif    
    
    gkEnv madsr iAttack, iDecay, iSustain ,iRelease

    aVCO	vco2	(p5 + 0.01*kvib*k_mute1),	(p4), iShape, iDuty
    aFM   fmb3 (p5 + 0.01*kvib*k_mute1),	(p4), 8, 5, .2, 6

    kEnvFrec expseg 100*2, iAttack, 100*20, iRelease, 100
    
    aVCF	moogladder (aFM*(1-kmix) + aVCO*kmix), kEnvFrec, .2
 
    aHp butterhp aVCF, gkHpFrec
    aFilt moogladder aHp, gkLpFrec, 0.1


;-------------------------Output


    outs (aFilt)*gkEnv*gkFader, (aFilt)*gkEnv*gkFader
   
   
gasendL= aFilt*gkEnv*kSend	
gasendR= aFilt*gkEnv*kSend


endin



instr 2 ; Graphical representation
giosc_s OSCinit 9989

kans_graph OSClisten giosc_s, "/s", "f", gks ;Control signal


if gks!=0 then
	
	Scurve sprintfk "file(%s)", "Spectrum.png"
    chnset Scurve, "Image"
    giImage imageload "Spectrum.png"
    
elseif gks==0 then
    Scurve sprintfk "file(%s)", "Init.png"
	chnset Scurve, "Image"	
	imagefree giImage
					
endif

endin




instr 3 ;R2 representation

k_mute chnget "Mute0"    
kans0 OSClisten giosc0, "/r2", "f", gkr2
SMessage0 sprintfk "text(\"%f\") ", gkr2
chnset SMessage0, "editorIdent0"
printk2 gkr2

kans1 OSClisten giosc1, "/lines", "i", gklines
SMessage1 sprintfk "text(\"%i\") ", gklines
chnset SMessage1, "editorIdent1"

printk2 gklines


kdens expon 200, p3, 200
a0 dust2 (k_mute*(1-gkr2))/80, kdens 


;a0  oscil gkr2, gkr2*100, -1, 0
outs a0*gkEnv*gkFader, a0*gkEnv*gkFader


endin



instr 6

gaRevLf, gaRevRf		reverbsc	gasendL,gasendR,0.85,10000
gaRevLr, gaRevRr		reverbsc	gasendL,gasendR,0.85,10000
		
		out	gaRevLf*gkFader,gaRevRf*gkFader
		clear		gasendL, gasendR
endin






</CsInstruments>
<CsScore>
f 1 0 1024 10 1

i 2 0 3600*24*7
i 3 0 3600*24*7
i 6 0 3600*24*7

e

</CsScore>
</CsoundSynthesizer>
