//
// MSX Murcia 2020
//
/**************DECLARACIONES************/
#include "fusion-c/header/msx_fusion.h"
//Para los sprites de todas las entidades
#include "fusion-c/header/vdp_sprites.h"
//Para el HMMC de pantalla.c
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/io.h"
// Para el memset de pantalla.c, ver http://cplusplus.com/reference/cstring/
#include <string.h>
//itoa, ver http://cplusplus.com/reference/cstdlib/itoa/?kw=itoa
//rand y srand http://cplusplus.com/reference/cstdlib/rand/
#include <stdlib.h>

#include "src/sprites.c"
#include "src/entities/pantalla.c"
#include "src/entities/player.c"
#include "src/entities/fire.c"
#include "src/entities/enemies.c"


//información del juego, Graphics User interface, también llamado HUD 
void gui(void);
// Consiguración del VDP
void inicializar_sprites();
//Input system
void procesar_entrada();
//Colision system
void check_colision();

//Helper rutines
//Rutina utilizada para crear estrellitas
char generar_numero_aleatorio (char a, char b);

TFire* fire;
char colisionX;
char colisionY;
/*********FIN DE LAS DECLARACIONES************/











/*********DEFINICIONES************************/
void main(void){
  //Ponemos a 0 todos los bytes de la page 0 de la VRAM
  FillVram(0,0,65535); 
  SetColors(15,1,1);
  Screen(5);   
  SetColors(15,1,1);

  cargarTileSetEnRAM();
  deRamAVramPage1();
  cargarTileMapEnRAM();
  cargarArrayFilasTileMap();

  //Configuramos los parámteros de los sprites en el VDP
  inicializar_sprites();
  //Cargamos los sprites en VRAM
  cargar_sprites_en_VRAM();
  //Habilitamos las colisiones de los sprites
  SpriteOn();
  colisionX=0;
  colisionY=0;
  
  /*******Pantalla de biendenida y salón de la fama****/
  //PutText(0,0,Itoa(ReadSP(),"  ",10),8);
  PutText(0,100,"Space 2, pulse una tecla para jugar",8);
  WaitKey();
  Cls();
  /*************Fin pantalla de bienvenida**************/
  



  /******************PANTALLA 1**********************/
  repetir:
  //cargamos los datas de los sprites en la VRAM
  inicializar_player(); 
  inicializar_disparos();
  inicilizar_enemigos();
   



  //En esta pantalla vamos a crear 4 enemigos, recuerda que solo hemos reservado espacio para 10
  TEnemy* enemy1=crear_enemigos();
  enemy1->x=255;
  enemy1->y=160;
  enemy1->velocidad=4;
  // 1.Arriba, 3 derecha, 5 abajo, 7 izquierda
  //Este mirará a la izquierda
  enemy1->direccion=7;
  enemy1->plano=8;
  enemy1->sprite=7*4;
  enemy1->color=6;
  //El tipo es una nave enegiga
  enemy1->tipo=0;
 

  TEnemy* enemy2=crear_enemigos();
  enemy2->x=255;
  enemy2->y=90;
  enemy2->velocidad=10;
  //Este mirará a la izquierda
  enemy2->direccion=7;
  enemy2->plano=9;
  enemy2->sprite=7*4;
  enemy2->color=6;
  enemy2->tipo=0;



  TEnemy* enemy3=crear_enemigos();
  enemy3->x=0;
  enemy3->y=70;
  enemy3->velocidad=5;
  //Este mirará a la derecha
  enemy3->direccion=3;
  enemy3->plano=10;
  //El sprite es otro
  enemy3->sprite=8*4;
  enemy3->color=6;
  //El tipo es una nave enemiga
  enemy3->tipo=0;
  

  TEnemy* enemy4=crear_enemigos();
  enemy4->x=255;
  enemy4->y=180;
  //El tanque irá a la misma velocidad que el mapa
  enemy4->velocidad=2;
  //Este mirará a la izquierda
  enemy4->direccion=7;
  enemy4->plano=11;
  //El sprite es el del tanque
  enemy4->sprite=6*4;
  enemy4->color=6;
  //El tipo es un tanque
  enemy4->tipo=1;

  //Vamos a dibujar un montón de estrellas
  for ( int i = 0; i < 200; ++i)
  {
    //Pset dibuja un pixel con el color especificado
    Pset(generar_numero_aleatorio(0,256),generar_numero_aleatorio(0,212),15,0);
  }
  gui();
  poner_columna_negra();
  //Inkey()!=27 si no has pulsado la tecla escape
  while(i<256 && Inkey()!=27){
    recorrerBufferTileMapYPintarPage1EnPage0();
    procesar_entrada();
    actualizar_personaje();
    actualizar_disparos();
    actualizar_enemigos();
    check_colision();
    
    //gui();
  }
  PutText(100,100,"Mision cumplida, desea repetir",8);
  char c=InputChar();
  if (c='s'){
    Cls();
    i=0;
    goto repetir;
  }
  /*************FINAL DE PANTALLA 1*****************/





}





void inicializar_sprites(){
  //Ponemos a 0 todos los sprites
  SpriteReset(); 
  // tamaño de sprites 16x16
  Sprite16(); 
  // tamaño de sprites sin ampliar   
  SpriteSmall(); 
  // Los datas del sprites los cargamos con SetSpritePattern, SC5SpriteColors y PutSprite que debería estar en el update
}
 

//Sistema de input
void procesar_entrada(){
  //Screen(0);
	// 0 son cursores teclado
  // 0=inactive  1=up 2=up & right 3=right 4=down & right 5=down 6=down & left 7=left 8=up & left 
	char joy = JoystickRead(0);
  switch (joy)
  {
    case 1:
        //py-=pvelocidad;
        player.y-=player.velocidad;
        //Hay que multiplizar por 4 el sprite porque fusionc es así
        //psprite=2*4;
        player.sprite=2*4;
        break;
    case 3:
        //px+=pvelocidad;
        player.x+=player.velocidad;
        //psprite=0;
        player.sprite=0;
        break;
    case 5:
        //py+=pvelocidad;
        player.y+=player.velocidad;
        //psprite=4*4;
        player.sprite=4*4;
        break;
    case 7:
        //px-=pvelocidad;
        player.x-=player.velocidad;
        //psprite=0;
        player.sprite=0;
        break;
    default:
        break;
  }
  //Leemos el disparo
  char trigger = TriggerRead(0);
  if (trigger!=0) {
    if (numero_disparo<6){
      Beep();
      TEnemy* enemy1=crear_enemigos();
      TFire* fire=crear_disparos();
      fire->x=player.x+20;
      fire->y=player.y+8;
      fire->plano=10+numero_disparo;
      fire->sprite=10*4;
      gui();
    }

  }
}

//Sistema de colisiones
void check_colision(){
  /********COLISION CON EL MAPA***********/
  //Point devuelve el color del pixel que se encuentra en x e y
  char color=0;
  //Colision superior
  color=Point(player.x, player.y);
  //Si el color es gris (el 14) o el color es amarillo(el 10)
  if (color!=1 && color!=0){
    Beep();
  }
  //Colision inferior
  color=Point(player.x, player.y+16);
  if (color!=1 && color!=0){
    Beep();
  }
  /******FIN DE COLISION CON EL MAPA******/

  /********COLISION CON LOS SPRITES*******/
  char colision=SpriteCollision();
  if(colision==1){
    Beep();
    colisionX=SpriteCollisionX();
    colisionY=SpriteCollisionY();
    gui();
  }

  /*******FIN DE COLOSION CON LOS SPRITES****/
}


//HUD
void gui(){
  BoxLine(0,0,255,16,6,8);
  //PutText(2,0,"Colision con X:",8);
  //PutText(8*8,0,Itoa(obtener_colision_x(),"  ",10),8);
  //PutText(120,0,Itoa(fireSprite,"  ",10),8);
  PutText(2,2,Itoa(ReadSP(),"   ",10),8);
  PutText(60,2,"x: ",8);
  PutText(80,2,Itoa(colisionX,"   ",10),8);
  PutText(120,2,"y: ",8);
  PutText(160,2,Itoa(colisionY,"   ",10),8);
  //PrintNumber(player.sprite);
}


char generar_numero_aleatorio (char a, char b){
  //Time es un struct + typedef con 3 enteros para las horas, minutos y segundos
    //TIME tm;
    char random; 
    //GetTime obtiene la hora del MSDOS y se la asigna al struct TIME
    //GetTime(&tm); 
    //srand utiliza los segundos como semilla para generar un número aleatorio  
    //srand y rand forman parte de la librería stdlib.h normalmente utilizada para castear strings y manejar memoria dinámica         
    //srand(tm.sec);
    random = rand()%(b-a)+a;  
    return(random);
}


























































