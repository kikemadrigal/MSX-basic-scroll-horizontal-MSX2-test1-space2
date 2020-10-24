//
// MSX Murcia 2020
//
//

#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_sprites.h"
#include "fusion-c/header/vdp_graph2.h"

#include <stdio.h>
// Para el memset
#include <string.h>
//itoa
#include <stdlib.h>
//#include "pantalla.h"
#include "player.h"
#include "fire.h"
#include "enemies.h"


#include "fusion-c/header/io.h"


//Pantalla
//Cargar archivos
void cargarTileSetEnRAM();
void cargarTileMapEnRAM();
//Esto es para asociar un archivo al struct de archivos
void FT_SetName( FCB *p_fcb, const char *p_name );
//Esto me lo he inventado, :)
void cargarArrayFilasTileMap();
void recorrerBufferTileMapYPintarPage1EnPage0();
void deRamAVramPage1(void);
char fileNameTilseSet[]="tileset.sc5";
char fileNameTileMap[]="word0.bin";
//Los FCB son una estructuras que necesita fusionc para manejar los archivos, a estudiar!!
FCB TFileTileSet;
FCB TFileTileMap;
//En screen5 cada byte define 2 colores, entonces 256px de ancho/2=128 bytes*212 filas=27136 bytes para definir una page
//En el ejemplo de fusion c cada 20 líneas son 2560 bytes
//30720
#define tamanobufferTileSet 27136
unsigned char bufferTileSet[tamanobufferTileSet];
//El tile map solo son bytes que identifican un valor correpondiente a cada fila y cada columna
//Vamos a definir 256 valores de ancho para identificar a nuestros tiles, 256 de ancho por 13 filas de 16px=3328
#define tamanoBufferTileMap 3328
unsigned char bufferTileMap[tamanoBufferTileMap];
unsigned int fila1[256];
unsigned int fila2[256];
unsigned int fila3[256];
unsigned int fila4[256];
//de la 5 a la nueve la dejamos vacía
unsigned int fila9[256];
unsigned int fila10[256];
unsigned int fila11[256];
unsigned int fila12[256];
unsigned int i=0;
unsigned int modulo16=0;
unsigned int desplazamiento=0;

//información del juego
void gui(void);



void inicializar_sprites();

void inicializar_player();
void actualizar_personaje();

void inicializar_disparos();
void crear_disparos();
void actualizar_disparos();

void procesar_entrada();



void main(void){
  SetColors(15,1,1);
  Screen(5);
  SetColors(15,1,1);

  cargarTileSetEnRAM();
  deRamAVramPage1();

  cargarTileMapEnRAM();
  cargarArrayFilasTileMap();

  inicializar_sprites();
    


  /*******Pantalla de biendenida y salón de la fama****/
  //PutText(0,0,Itoa(ReadSP(),"  ",10),8);
  PutText(0,100,"Space 2, pulse una tecla para jugar",8);
  WaitForKey();
  Cls();
  /*************Fin pantalla de bienvenida**************/


  inicializar_player(); 
  inicializar_disparos();


  gui();
  repetir:
  //Inkey()!=27 si no has pulsado la tecla escape
  while(i<256 && Inkey()!=27){
    recorrerBufferTileMapYPintarPage1EnPage0();
    procesar_entrada();
    actualizar_personaje();
    //gui();
  }
  PutText(100,100,"Mision cumplida, desea repetir",8);
  char c=InputChar();
  if (c='s'){
    Cls();
    i=0;
    goto repetir;
  }
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
 
void inicializar_player(){
    py=212/2;
    // px= player posición eje x, py= player posición eje y
    // pv player velocidad, pm= player movimiento (se obtiene del teclado)
    // lo metemos en la tabla de dEfinición de patrones
    // el 1 argumento es la posición en la poisión en la tabla de definición de sprites (sprite pattern),tenemos que ir sumando 4 porque fusion c es asi
    // el 2 argumentos son los datos del sprite
    // el 3 argumento es el numero de bytes del patron
    SetSpritePattern( 0, nave_derecha1, 32);
    SetSpritePattern( 4, nave_derecha2, 32);
    SetSpritePattern( 4*2, nave_arriba1, 32);
    SetSpritePattern( 4*3, nave_arriba2, 32);
    SetSpritePattern( 4*4, nave_abajo1, 32);
    SetSpritePattern( 4*5, nave_abajo2, 32);

    //Le ponemos el color al sprite
    SC5SpriteColors(0, color_nave_derecha1);
    SC5SpriteColors(1, color_nave_derecha2);

    // Sobre PutSprite, si queremos podemos hacer que se vea ya el sprite del personaje con
    // 1 El plano o su definición en la tabla de atributos, es donde alamcenará la posición x e y, y su sprite
    // 2 la definición en sprite pattern que va de 4 en 4
    // 3 posición eje x
    // 4 posición eje y
    // 5 color  
    // PutSprite( pplano,psprite,px,py, pcolor );
    // PutSprite( pplano+1,psprite+4,px,py, pcolor+1 );
}
void actualizar_personaje(){
  //Plano, ptron, x, y, color
    PutSprite( pplano, psprite, px,py, pcolor );
    PutSprite( pplano+1, psprite+4, px,py, pcolor+1 );
}


void inicializar_disparos(){
  SetSpritePattern( fire.sprite, disparo, 32);
  PutSprite( fire.plano, fire.sprite, fire.x,fire.y, fire.color );   
}
void crear_disparos(){
  fire.x=px;
  fire.y=py;
}

void actualizar_disparos(){
  fire.x+=fire.velocidad;
  PutSprite( fire.plano, fire.sprite, fire.x,fire.y, fire.color );
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
        py-=pvelocidad;
        //Hay que multiplizar por 4 el sprite porque fusionc es así
        psprite=2*4;
        break;
    case 3:
        px+=pvelocidad;
        psprite=0;
        break;
    case 5:
        py+=pvelocidad;
        psprite=4*4;
        break;
    case 7:
        px-=pvelocidad;
        psprite=0;
        break;
    default:
        break;
  }
  //Leemos el disparo
  char trigger = TriggerRead(0);
  if (trigger!=0) {
    crear_disparos();
    Beep();
  }
}



void gui(){
  BoxLine(0,0,255,16,6,8);
  PutText(2,0,"Colision con X:",8);
  //PutText(8*8,0,Itoa(obtener_colision_x(),"  ",10),8);
  PutText(120,0,Itoa(5,"  ",10),8);
  PutText(150,0,"Y:",8);
}


































































void cargarTileSetEnRAM(){
    //Cargamos el archivo en la estructura
    FT_SetName( &TFileTileSet, &fileNameTilseSet[0] );
    fcb_open( &TFileTileSet );
    //Sino omitimos los 7 primeros bytes (los que defininen la estructura del binario) aparecen  unas marcas arriba a la derecha
    fcb_read( &TFileTileSet, &bufferTileSet[0], 7 ); 
    //Cargamos el archivo definido en la estructura y lo ponemos en la RAM (buffer)
    fcb_read( &TFileTileSet, &bufferTileSet[0], tamanobufferTileSet );  
    fcb_close( &TFileTileSet );
}

void cargarTileMapEnRAM(){
    FT_SetName( &TFileTileMap, &fileNameTileMap[0] );
    fcb_open( &TFileTileMap );
    //Analizando el archivo word0.bin con un editor hexadecimal vemos que hay que saltar 8 bytes que definen al .bin
    fcb_read( &TFileTileMap, &bufferTileMap[0], 8 );  // Skip 7 first bytes of the file  
    fcb_read( &TFileTileMap, &bufferTileMap[0], tamanoBufferTileMap );  // Read 20 lines of image data (128bytes per line in screen5)
    fcb_close( &TFileTileMap);
}

void deRamAVramPage1(void){
  //HMMC transfiere bloques de RAM a VRAM rápidamente en un area rectangular, ver www.tipolisto.es/files/v9938 página 66
  //HMMM(buffer en RAM, posición_x, posición_Y (256 será la page 1), ancho copia, alto copia)
  HMMC(&bufferTileSet[0], 0,256,256,212 ); 
}



void FT_SetName( FCB *p_fcb, const char *p_name )  // Routine servant à vérifier le format du nom de fichier
{
  char i, j;
  memset( p_fcb, 0, sizeof(FCB) );
  for( i = 0; i < 11; i++ ) {
    p_fcb->name[i] = ' ';
  }
  for( i = 0; (i < 8) && (p_name[i] != 0) && (p_name[i] != '.'); i++ ) {
    p_fcb->name[i] =  p_name[i];
  }
  if( p_name[i] == '.' ) {
    i++;
    for( j = 0; (j < 3) && (p_name[i + j] != 0) && (p_name[i + j] != '.'); j++ ) {
      p_fcb->ext[j] =  p_name[i + j] ;
    }
  }
}


void cargarArrayFilasTileMap(){
  int contador_fila2,contador_fila3,contador_fila4,contador_fila9,contador_fila10,contador_fila11,contador_fila12;
  contador_fila2=0;contador_fila3=0;contador_fila4=0;contador_fila9=0;contador_fila10=0;contador_fila11=0;contador_fila12=0;
  for (int i=0; i<256;i++){
    fila1[i]=bufferTileMap[i];
  }
  for (int i=256; i<512;i++){
    contador_fila2++;
    fila2[contador_fila2]=bufferTileMap[i];
  }
  for (int i=512; i<768;i++){
    contador_fila3++;
    fila3[contador_fila3]=bufferTileMap[i];
  }
  for (int i=256*3; i<256*4;i++){
    contador_fila4++;
    fila3[contador_fila3]=bufferTileMap[i];
  }
  //5
  //6
  //7
  //8
  //9
  for (int i=256*9; i<256*10;i++){
    contador_fila9++;
    fila9[contador_fila9]=bufferTileMap[i];
  }
  for (int i=256*10; i<256*11;i++){
    contador_fila10++;
    fila10[contador_fila10]=bufferTileMap[i];
  }
  for (int i=256*11; i<256*12;i++){
    contador_fila11++;
    fila11[contador_fila11]=bufferTileMap[i];
  }
  for (int i=256*12; i<256*13;i++){
    contador_fila12++;
    fila12[contador_fila12]=bufferTileMap[i];
  }
}


void recorrerBufferTileMapYPintarPage1EnPage0(){



    //HMMM transfiere datos de VRAM a VRAM rápidamente
    //El bufer solo lo utilizamos para obtener su valor y ver desde donde tenemos que copiar
    //HMMM(16,256, 0,0,16,16);
    //Screen(0);
    //printf("Fila 1--> ");
    //if(i<256){
  modulo16+=2;
  if (modulo16>256) modulo16=0;
  if(modulo16 % 16==0){
    i++;
    //Fila 0
    HMMM(fila1[i]*16,256,256-16,16*1,16,16);
    //Fila 1
    //printf(" %d: %d",i,bufferTileMap[i]);
    HMMM(fila2[i]*16,256, 256-16,16*2,16,16);
    //Fila 2
    //printf(" %d: %d",i+32,bufferTileMap[i+32]);
    HMMM(fila3[i]*16,256, 256-16,16*3,16,16);
    //Fila 3
    //printf(" %d: %d",i+64,bufferTileMap[i+64]);
    HMMM(fila4[i]*16,256, 256-16,16*4,16,16);

    //Fila 9
    HMMM(fila9[i]*16,256, 256-16,16*9,16,16);
    //Fila 10
    HMMM(fila10[i]*16,256, 256-16,16*10,16,16);
    //Fila 11
    HMMM(fila11[i]*16,256, 256-16,16*11,16,16);
    //Fila 12
    HMMM(fila12[i]*16,256, 256-16,16*12,16,16);
  }
  desplazamiento+=2;
  if (desplazamiento>16) desplazamiento=0; 
  HMMM(2,16, 0,16,256,64);
  HMMM(2,212-64, 0,212-64,256,64);
  BoxFill(256,16,256,212,1,0);
}

