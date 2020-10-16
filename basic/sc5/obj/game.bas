10 rem Program: Tapadera
20 rem Autor: MSX Murcia 2020
30 rem Platform: MSX2
40 rem language: MSX Basic
70 'print #1, "Ejecutando main"
80 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0)
90 defint a-z: defusr1=&H41:defusr2=&H44
110 gosub 20000
120 gosub 10000
130 gosub 11000
140 gosub 11400
200 cls:preset (100,212/2): print #1, "Space 2": print #1,"Pulsa una tecla para continuar": print #1,"Espacio libre: "fre(0)
210 k$=inkey$:if k$="" then goto 210
220 goto 400
300 print #1,"has ganado"
310 'input #1,"¿Otra partida S/N ";a$
320 if inkey$="s" then 290
330 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end
350 preset (0,10)
360 print #1," Te han matado!!"
370 'input #1,"¿Otra partida S/N ";a$
380 if inkey$="s" then 290
390 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end
400 color 15,1,1
405 cls:ti=1:ms=0
410 gosub 20500
420 for i=0 to 200: pset(rnd(1)*256,rnd(1)*212),15: next i
430 gosub 20700
440 on strig gosub 11100:strig(0) on
450 LINE(0,0)-(256,15),11,b
460 'on interval=50 gosub 9000:interval on:time=0
    500 gosub 20100
    510 gosub 600
    520 'nada'
    530 gosub 8000
    540 gosub 7000
    550 gosub 6200
    560 goto 500
    600 if ti mod 10 =0 then gosub 11500
610 return
    6200 px=x:py=y 
    6210 on stick(0) gosub 6240,6210,6250,6210,6260,6210,6270
    6220 if stick(0)=-1 then ps=0
6230 return
6240 y=y-pv:ps=4:return
6250 x=x+pv:ps=0:return
6260 y=y+pv:ps=2:return
6270 x=x-pv:ps=0:return
    7000 gosub 21500
    7010 gosub 20700
    7020 gosub 10500
    7030 gosub 11300
    7040 gosub 11700
7110 return
    8000 if y<=0 then y=py
    8070 if y>212-16 then y=py
    8080 if x<0 then x=px
    8090 if x>256-16 then x=px
8100 return
    9000 'preset (0,192-8):print #1,"Tapadera game, fre "fre(0)
    9010 'preset (0,20):print #1,"       dn "dn
    9020 'preset (0,30):print #1,"D:ds: "ds(dd)", dp: "dp(dd)", dx: "dx(dd)
    9030 'preset (0,5):print using #1,"##";time/50
    9040 'preset (2,6):print #1,"km: "ti"  V: "pe
    9050 preset (2,6):print #1,"en: "en", ti: "ti
9090 return
    10000 x=8*2:px=x:y=212/2:py=y: pw=16: ph=16: pd=3: pu=0: pv=8: pe=100: pc=0
    10010 ps=0: pp=0
10030 return
    10500 put sprite pp,(x,y),,ps
    10510 put sprite pp+1,(x,y),,ps+1
10520 return
    11000 dn=0:dd=0
11060 return
    11100 if dn>9 then return 
    11120 dx(dn)=px+16:dy(dn)=py+8
    11130 dv(dn)=8
    11140 ds(dn)=6:dp(dn)=6+dn
    11150 da(dn)=0
    11160 dn=dn+1
    11170 beep
11180 return
    11200 'Bajamos el número de disparos para que nos pinte los X que habíamos reservado en el loader, solo los que le decimos
    11210 dn=dn-1
    11220 'Ponemos el sprite fuera para que no se vea'
    11230 put sprite dp(dd),(-16,0),15,ds(dd)
    11240 'preset (0,130):print #1,"D:ds: "ds(dd)", dp: "dp(dd)", dx: "dx(dd)
    11250 dx(dd)=dx(dn):dy(dd)=dy(dn):dv(dd)=dv(dn):ds(dd)=ds(dn):dp(dd)=dp(dn):da(dd)=da(dn) 
11260 return
    11300 if dn=0 then return 
    11310 for i=0 to dn-1 
        11320 dx(i)=dx(i)+dv(i) 
        11330 put sprite dp(i),(dx(i),dy(i)),15,ds(i)
        11340 if dx(i)>=256 then dd=i:gosub 11200
        11350 'preset (0,150+i*10):print #1,"i: "i", ds: "ds(i)", dp: "dp(i)
    11360 next i
11390 return
    11400 en=0
11410 return
    11500 if en>5 then return
    11510 ex(en)=256:ey(en)=rnd(1)*140
    11520 if ey(en)<64 then goto 11510
    11530 ev(en)=16:el(en)=16
    11540 es(en)=8:ep(en)=7+en:ec(en)=rnd(1)*15
    11550 if ec(en)<2 then goto 11540
    11560 ee(en)=100
    11570 en=en+1
11580 return
    11600 en=en-1
    11610 ey(ed)=rnd(1)*140
    11620 if ey(ed)<64 then goto 11610
    11630 ec(ed)=rnd(1)*15
    11640 if ec(ed)<2 then goto 11630
    11650 put sprite ep(ed),(-16,0),ec(ed),es(ed)
11660 return
    11700 if en<=0 then return
    11710 for i=0 to en-1
        11720 ex(i)=ex(i)-ev(i)        
        11730 'nada'
        11770 put sprite ep(i),(ex(i),ey(i)),ec(ei),es(i)
        11780 'preset (0,150+i*10):print #1,"es: "es(i)", ep: "ep(i)", ex: "ex(i)
        11790 if ex(i)<=0 then ed=i:gosub 11600
    11800 next i
11810 return
    20000 dim m(255,13)
    20010 ms=0:md=0:mc=0
20020 return
    20100 if ti=256 then preset (10,90):print #1,"Mision conseguida":return
    20110 ti=ti+1
20120 return
  
20300 'print #1,"Cargando mapa"
20310 for f=0 to 12
    20320 for c=0 to 255
        20330 read a$ 
           20340 if a$ <> "-1" then m(c,f)=VAL(a$) else m(c,f)=255
        20350 next c
    20360 next f
20370 return
    20500 preset (20,80):print #1, "Cargando mapa "ms+1" del disco.."
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
    20610 preset (20,80):print #1, "                                    "
20620 return
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
    20810 copy (t1*16,0)-((t1*16)+16,(0*16)+16),1 to (15*16,1*16),0,pset
    20820 copy (t2*16,0)-((t2*16)+16,(0*16)+16),1 to (15*16,2*16),0,pset
    20830 copy (t3*16,0)-((t3*16)+16,(0*16)+16),1 to (15*16,3*16),0,pset
    20840 copy (t4*16,0)-((t3*16)+16,(0*16)+16),1 to (15*16,4*16),0,pset
    20850 copy (t5*16,0)-((t5*16)+16,(0*16)+16),1 to (15*16,9*16),0,pset
    20860 copy (t6*16,0)-((t6*16)+16,(0*16)+16),1 to (15*16,10*16),0,pset
    20870 copy (t7*16,0)-((t7*16)+16,(0*16)+16),1 to (15*16,11*16),0,pset
    20880 copy (t8*16,0)-((t8*16)+16,(0*16)+16),1 to (15*16,12*16),0,pset
    20900 '_TURBO off
20990 return
    21500 _TURBO on
    21530 copy (16,1*16)-(256,5*16),0 to (0,1*16),0,pset  
    21540 copy (16,9*16)-(256,13*16),0 to (0,9*16),0,pset  
    21590 _TURBO off
21600 return
 
    21700 for f=0 to 1
        21720 for c=0 to 255
            21730 print #1, m(c,f);
        21740 next c
    21760 next f
21790 return
