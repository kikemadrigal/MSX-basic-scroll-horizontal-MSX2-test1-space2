10 rem Program: Tapadera
20 rem Autor: MSX Murcia 2020
30 rem Platform: MSX2
40 rem language: MSX Basic
80 print #1, "Ejecutando main"
90 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0)
100 defint a-z: defusr1=&H41:defusr2=&H44
140 gosub 20000
150 'gosub 20300
160 gosub 20500
170 gosub 10000
180 gosub 11000
220 strig(0) on:on strig gosub 11100
230 gosub 20100
240 'gosub 9000
250 'gosub 21700
280 goto 500
290 cls:preset (100,212/2): print #1, "Space 2": print #1,"Pulsa una tecla para continuar": print #1,"Espacio libre: "fre(0)
300 k$=inkey$:if k$="" then goto 300
310 cls
320 print #1,"has ganado"
330 'input #1,"¿Otra partida S/N ";a$
340 if inkey$="s" then 290
350 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end
500 preset (0,10)
550 print #1," Te han matado!!"
560 'input #1,"¿Otra partida S/N ";a$
340 if inkey$="s" then 290
350 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end
500 gosub 21500
510 gosub 20700
520 gosub 6200
530 gosub 8000
540 gosub 7000
550 'gosub 9000
560 goto 500
    6200 px=x:py=y 
    6210 on stick(0) gosub 6230,6200,6240,6200,6250,6200,6260
6220 return
6230 y=y-pv:ps=4:return
6240 x=x+pv:ps=0:return
6250 y=y+pv:ps=2:return
6260 x=x-pv:ps=0:return
    7000 gosub 10500
    7010 gosub 11200
7110 return
    8000 if y<=0 then y=py
    8070 if y>212-16 then y=py
    8080 if x<0 then x=px
    8090 if x>256-16 then x=px
8100 return
    9000 'preset (0,192-8):print #1,"Tapadera game, fre "fre(0)
9090 return
    10000 x=8*2:px=x:y=212/2:py=y: pw=16: ph=16: pd=3: pu=0: pv=8: pe=100: pc=0
    10010 ps=0: pp=0
10030 return
    10500 put sprite pp,(x,y),,ps
    10510 put sprite pp+1,(x,y),,ps+1
10520 return
    11000 dn=1
    11010 dx(0)=0:dy(0)=0:dv(0)=8:da(0)=0:dc(0)=0:ds(0)=6:dp(0)=6
11020 return
    11100 dx(dn)=px+16:dy(dn)=py+8:dv(dn)=dv(0):da(dn)=da(0):dc(dn)=dc(0):ds(dn)=ds(0):dp(dn)=dn+6
    11110 dn=dn+1
    11120 beep
11130 return
    11200 for i=0 to dn-1
        11210 dx(i)=dx(i)+dv(i)
        11220 put sprite dp(i),(dx(i),dy(i)),15,ds(i)
        11230 ' if dx(i)>256 then dx(i)=-16
    11240 next i
11290 return
    20000 dim m(255,13)
    20010 ms=0:md=0
20020 return
    20100 if ms=0 then gosub 20700
20110 return
20300 'print #1,"Cargando mapa"
20310 for f=0 to 12
    20320 for c=0 to 255
        20330 read a$ 
           20340 if a$ <> "-1" then m(c,f)=VAL(a$) else m(c,f)=255
        20350 next c
    20360 next f
20370 return
    20500 print #1, "Cargando mapa del disco"
    20505 md=&hc001
    20510 'print #1,"Cargando mundo..."
    20520 if ms=0 then bload"word0.bin",r
    20530 if ms=1 then bload"word1.bin",r
    20540 for i=0 to 0
        20550 for f=0 to 12
            20560 for c=0 to 255
                20570 m(c,f)=peek(md):md=md+1
            20580 next c
        20590 next f
    20600 next i
20610 return
    20700 '_TURBO on (mc,m())
    20710 mc=mc+1
    20720 if mc>255 then mc=0
    20730 t1=m(mc,0)
    20740 t2=m(mc,1)
    20750 t3=m(mc,2)
    20760 t4=m(mc,3)
    20770 t5=m(mc,9)
    20780 t6=m(mc,10)
    20790 t7=m(mc,11)
    20800 t8=m(mc,12)
    20810 copy (t1*16,0)-((t1*16)+16,(0*16)+16),1 to (15*16,0*16),0,pset
    20820 copy (t2*16,0)-((t2*16)+16,(0*16)+16),1 to (15*16,1*16),0,pset
    20830 copy (t3*16,0)-((t3*16)+16,(0*16)+16),1 to (15*16,2*16),0,pset
    20840 copy (t4*16,0)-((t3*16)+16,(0*16)+16),1 to (15*16,3*16),0,pset
    20850 copy (t5*16,0)-((t5*16)+16,(0*16)+16),1 to (15*16,9*16),0,pset
    20860 copy (t6*16,0)-((t6*16)+16,(0*16)+16),1 to (15*16,10*16),0,pset
    20870 copy (t7*16,0)-((t7*16)+16,(0*16)+16),1 to (15*16,11*16),0,pset
    20880 copy (t8*16,0)-((t8*16)+16,(0*16)+16),1 to (15*16,12*16),0,pset
    20900 '_TURBO off
20990 return
    21500 _TURBO on
    21530 copy (16,0)-(256,4*16),0 to (0,0),0,pset  
    21540 copy (16,9*16)-(256,13*16),0 to (0,9*16),0,pset  
    21590 _TURBO off
21600 return
 
    21700 for f=0 to 1
        21720 for c=0 to 255
            21730 print #1, m(c,f);
        21740 next c
    21760 next f
21790 return
