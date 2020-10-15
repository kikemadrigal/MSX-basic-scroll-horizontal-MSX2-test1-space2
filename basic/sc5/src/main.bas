10 rem Program: Tapadera
20 rem Autor: MSX Murcia 2020
30 rem Platform: MSX2
40 rem language: MSX Basic


80 print #1, "Ejecutando main"
1 'Inicilizamos dispositivo: 003B, inicilizamos teclado: 003E'
90 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0)
1 'cargamos las rutinas de apgar y encender pantalla'
100 defint a-z: defusr1=&H41:defusr2=&H44
1 'Inicializar mapa, son 96 columnas y 24 filas'
140 gosub 20000
1 'Llamamos a la rutina guardar información en array'
1 'Si eliges  la línea 20300 en lugar de la 20500 te qudarás con la mitad de bytes 20300 ocupa 7000 bytes'
150 'gosub 20300
160 gosub 20500
1 'Inicializamos el personaje'
170 gosub 10000
1 'inicializar disparos'
180 gosub 11000
1 'con el 0 le decimos que es la barra espaciadora y no los botones de los joystick'
1 'Cunado se pulse la barra espaciadora hiremos a la línea 11100'
220 strig(0) on:on strig gosub 11100
1 'Rutina mostrar mapa seleccionado y cargarlo'
230 gosub 20100
1 'Mostramos el HUD'
240 'gosub 9000
1 'Mostramos lo que contiene el array'
250 'gosub 21700
280 goto 500



1'------------------------------------'
1'  Pantalla de Bienvenida y records 
1'------------------------------------'
290 cls:preset (100,212/2): print #1, "Space 2": print #1,"Pulsa una tecla para continuar": print #1,"Espacio libre: "fre(0)
1 'Repetir mientras no se pulse una tecla'
300 k$=inkey$:if k$="" then goto 300
1 'Borramos el mensaje de bienvenida'
310 cls

1'------------------------------------'
1'     Pantalla Ganadora'
1'------------------------------------'
1' Dibujamos el texto de la pantalla ganadora
320 print #1,"has ganado"
1' Otra partida s/n,es posible borrar la interrogación con for i=0 to 7: vpoke base(2)+(63*8)+i,0: next i
330 'input #1,"¿Otra partida S/N ";a$
340 if inkey$="s" then 290
350 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end

1'------------------------------------'
1'           Game over 
1'------------------------------------'
1' Dibujamos el texto de la pantalla game over

1' Otra partida s/n,es posible borrar la interrogación con for i=0 to 7: vpoke base(2)+(63*8)+i,0: next i
500 preset (0,10)
550 print #1," Te han matado!!"
560 'input #1,"¿Otra partida S/N ";a$
340 if inkey$="s" then 290
350 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end






1 ' ----------------------'
1 '      MAIN LOOP
1 ' ----------------------'
1 'Rutina desplazar pantalla a la izquierda
500 gosub 21500
1 ' Obtenemos el tile deL array que toca (mc) y lo pintamos al final de la pantalla
510 gosub 20700
1 'Capturamos las teclas'
520 gosub 6200
1 'Comprobamos las colisiones'
530 gosub 8000
1 'Actaulizamos el render'
540 gosub 7000
1 'Mostrar infomacion'
550 'gosub 9000
560 goto 500





1 ' ----------------------'
1 '     INPUT SYSTEM'
1 ' ----------------------'
1 '2 Sistema de input'
    6200 px=x:py=y 
    6210 on stick(0) gosub 6230,6200,6240,6200,6250,6200,6260
6220 return
1 '1 arriba'
6230 y=y-pv:ps=4:return
1 '3 derecha'
6240 x=x+pv:ps=0:return
1 '5 abajo'
6250 y=y+pv:ps=2:return
1 '7 izquierda'
6260 x=x-pv:ps=0:return





1 ' ----------------------'
1 '     RENDER SYSTEM'
1 ' ----------------------'
    1 'Pintamos de nuevo el player con la posición
    7000 gosub 10500
    1 'pintamos los disparos'
    7010 gosub 11200
7110 return





1 ' ----------------------'
1 '     COLLISION SYSTEM'
1 ' ----------------------'
    1 'Colision del player con la pantalla'
    8000 if y<=0 then y=py
    8070 if y>212-16 then y=py
    8080 if x<0 then x=px
    8090 if x>256-16 then x=px
8100 return




1 ' ----------------------'
1 '     HUD'
1 ' ----------------------'
    9000 'preset (0,192-8):print #1,"Tapadera game, fre "fre(0)
9090 return





1 ' ----------------------'
1 '         PLAYER
1 ' ----------------------'
1 'inicialice player'
    10000 x=8*2:px=x:y=212/2:py=y: pw=16: ph=16: pd=3: pu=0: pv=8: pe=100: pc=0
    1 'variables para manejar los sprites, 
    1 'ps=payer sprite, lo cremaos con el spritedevtools 
    1 'pp=player plano; para cambiarlo en el plano osprite paraq ue de la sención de movimento
    10010 ps=0: pp=0
10030 return

1 'Update player'
    10500 put sprite pp,(x,y),,ps
    10510 put sprite pp+1,(x,y),,ps+1
10520 return

1' ------------------------------------------------------------------------------'
1' -------------------------Rutinas disparos / fires ----------------------------'
1' ------------------------------------------------------------------------------'
1 'Rutina inicializar disparos'
1 'Los disparos se hirán creando dinámicamente según vayamos pulsando la barra espaciadora'
1 'dn= disparo número, sirve para ir creando disparos ya que despues se incrementa'
    11000 dn=1
    1 'ds=disparosprite, dp=disparo plano'
    11010 dx(0)=0:dy(0)=0:dv(0)=8:da(0)=0:dc(0)=0:ds(0)=6:dp(0)=6
11020 return

1 'Rutina crear disparos'
1 ' Para crear disparos simplemente copiamos el 1 y sumamos 1 al contador de numero de disparos'
1 'Recuerda que hemos reservamos espacio para  disparos en el loader'
    11100 dx(dn)=px+16:dy(dn)=py+8:dv(dn)=dv(0):da(dn)=da(0):dc(dn)=dc(0):ds(dn)=ds(0):dp(dn)=dn+6
    11110 dn=dn+1
    11120 beep
11130 return

1 'Rutina actualizar disparos'
    11200 for i=0 to dn-1
        1 'Lo movemos'
        11210 dx(i)=dx(i)+dv(i)
        1 'lo dibujamos'
        11220 put sprite dp(i),(dx(i),dy(i)),15,ds(i)
        11230 ' if dx(i)>256 then dx(i)=-16
    11240 next i
11290 return


1 ' ----------------------'
1 '         MAP'
1 ' ----------------------'
1 'm() nuestro array tiene 2 dimensiones, la 1 es la que almacena las columnas o eje x y la segunda las filas o eje y
    20000 dim m(255,13)
    1 'mc: mapa contador columna, utilizado para ir haciendo los copys con el data de la columna leida del array'
    1 'ms: mapa selecionado, para elegir el mapa y cambiarlo cuando sea conveniente'
    1 'md=mapa dirección que está en la ram y que es cargada con bload'
    20010 ms=0:md=0
20020 return

1 'Rutina seleccionar mapa'
1 'Si el mapa seleccionado es el 0 vamos a poner la paleta y el mapa de la linea'
    20100 if ms=0 then gosub 20700
20110 return


1 'Rutina cargar mapa con array de datas'
1 'ahora leemos las filas o la posición x
20300 'print #1,"Cargando mapa"
20310 for f=0 to 12
    1 'ahora leemos las columnas c o la posicion y
    20320 for c=0 to 255
        20330 read a$ 
           20340 if a$ <> "-1" then m(c,f)=VAL(a$) else m(c,f)=255
        20350 next c
    20360 next f
20370 return


1 'Guardar_mapa_en_array desde un archivo guardado en disco
    1 'Cada mapa ocupa 862 bytes'
    1 'md=mapa dirección, la dirección c001 se la he puesto yo en el archivo binario cuando lo creé'
    1 'El archivo tan solo contiene los datos de la definición de los mapas'
    20500 print #1, "Cargando mapa del disco"
    20505 md=&hc001
    20510 'print #1,"Cargando mundo..."
    20520 if ms=0 then bload"word0.bin",r
    20530 if ms=1 then bload"word1.bin",r
    20540 for i=0 to 0
        1 'ahora leemos las filas o la posición x
        20550 for f=0 to 12
        1 'ahora leemos las columnas c o la posicion y
            20560 for c=0 to 255
                20570 m(c,f)=peek(md):md=md+1
            20580 next c
        20590 next f
    20600 next i
20610 return



1 'Rutina dibujar mapa'
    1 'Obtenemos el tile deL array que toca (mc) y lo pintamos al final de la pantalla'
    20700 '_TURBO on (mc,m())
    1 'Creamos un contador de columnas para que se vaya desplazando en el array'
    20710 mc=mc+1
    1 'Le pondremos como máximo 31 columnas de ancho (recuerda que nuestra oantalla son 16 columnas de 16px por tile)'
    20720 if mc>255 then mc=0
    1 'El t1 será los tiles de la 1 fila desde 0 hasta 16 px de alto'
    20730 t1=m(mc,0)
    1 'El t2 serán los tiles de la 2 fila de 16pz a 32 px'
    20740 t2=m(mc,1)
    1 't3 son los tiles de la 3 fila'
    20750 t3=m(mc,2)
    20760 t4=m(mc,3)

    1 'fila 9'
    20770 t5=m(mc,9)
    1 'fila 10'
    20780 t6=m(mc,10)
    1 'fila 11'
    20790 t7=m(mc,11)
    1 'fila 12'
    20800 t8=m(mc,12)
    1 'Si te fijas en el mapa tan solo obtenemos el valor que hay en el mapa,
    1 'este valor indica su posicón en el tileset o el dibujo que hemos pegado en la page 1 en el cargador
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

1 'Rutina desplazar pantalla a la izquierda
    21500 _TURBO on
    21530 copy (16,0)-(256,4*16),0 to (0,0),0,pset  
    21540 copy (16,9*16)-(256,13*16),0 to (0,9*16),0,pset  
    21590 _TURBO off
21600 return
 
1 'Mostrar lo que hay guardado en el array
    21700 for f=0 to 1
    1 '' ahora leemos las columnas c
        21720 for c=0 to 255
            21730 print #1, m(c,f);
        21740 next c
    21760 next f
21790 return


1 '------------------DEFINICION DE MAPAS---------------------------------'
1 'level 1'

1 '30000 data 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,0,0,0,8,8,8,8,8,8,8,8
1 '30010 data 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,8,8,8,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
1 '30020 data 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,3,3,3,0
1 '30030 data 3,3,3,3,0,0,3,3,3,3,3,3,3,3,3,3,0,3,3,3,0,0,3,3,3,3,0,3,3,3,3
1 '30040 data 0,3,3,3,1,0,0,1,3,3,3,0,2,2,2,0,3,3,3,3,0,2,0,0,3,3,3,3,3,3,3,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,8,8
1 '30050 data 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,1,1,1,1,0,0,8,8,0,0,0,0,0,0,0,0,0,8,8,8,8,0,3,3,3,3,3,3,1,1,1,1,1,3,3,3,3,3,3,3,0,3,3,3,3,3,3,3
1 '30060 data 3,3,3,3,3,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,1,1,3,3,3,3,3,3,3,3,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30070 data 0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2,2
1 '30080 data 0,1,3,3,0,0,0,0,0,1,0,0,0,0,0,0,3,3,3,3,0,0,0,0,1,3,3,3,3,3,1,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
1 '30090 data 8,8,8,8,8,8,8,2,2,2,2,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,2,3,3,3,3,3
1 '30100 data 3,3,0,0,0,0,0,0,0,0,1,1,0,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,1,1,1,1,1,0,0,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30110 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30120 data 0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,2,3,3,2,0,0,0,0,0,3,1,3,1,3,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30130 data 2,2,2,2,2,2,2,0,0,0,0,2,2,2,2,2,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,3,3,3
1 '30140 data 3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30150 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30160 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30170 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30180 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30190 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30200 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30210 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30220 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30230 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30240 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30250 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30260 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30270 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30280 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30290 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30300 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30310 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30320 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30330 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30340 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30350 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30360 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,4,0,0,0,0,0,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30370 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,6,7,0,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30380 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30390 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30400 data 0,0,0,4,5,6,4,4,5,6,4,0,0,0,0,8,8,8,8,4,0,0,4,4,8,8,8,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30410 data 0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,3,3,3,3,3,3,3,3,5,6,0,5,6,0,5,6,0,0,5,6,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30420 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,6,6,0,6,0,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,4,5,4,5,4,4,5,6,7,8,8,0,0,0,0,0,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30430 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30440 data 4,5,6,8,8,8,8,8,8,8,8,6,7,7,8,8,8,8,8,8,6,7,8,8,8,8,8,8,4,5,6,4,5,4,4,4,5,6,7,4,5,6,7,4,5,6,4,5,6,7,4,5,6,7,7,7,6,7,6,7,7,7,7,7,0,0,0,0,0,0,0,0,4,5,6
1 '30450 data 7,4,5,6,7,5,6,7,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,0,0,6,0,0,0,0,6,0,0,0,0,0,6,0,0,0,0,0,0,0
1 '30460 data 0,0,0,0,0,0,0,8,8,8,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,5,5,5,5,5
1 '30470 data 5,5,6,0,0,0,0,0,5,5,5,6,0,0,0,0,0,0,0,0,0,0,0,0,5,6,0,5,6,0,0
1 '30480 data 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,3,3,3,3,3
1 '30490 data 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,8,6,6,6,8,8,0,0,0,8,8,0,0,0,0,8,8,8,6,6,6,6,6,6
1 '30500 data 8,8,8,8,0,0,0,8,8,8,8,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,4,4,4,4,4,5,6,7,5,6,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8
1 '30510 data 8,8,5,5,5,5,5,5,5,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
