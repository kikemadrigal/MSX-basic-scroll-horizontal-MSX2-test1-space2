//
// Fusion-C
// My First Program in C
//

#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/newTypes.h"
#include "fusion-c/header/vdp_sprites.h"
#include "fusion-c/header/vdp_graph2.h"

#include <stdio.h>
// Para el memset
#include <string.h>
//itoa
#include <stdlib.h>
#include "player.h"

#include "fusion-c/header/io.h"



void leerMapaDeTiles();
void leerArchivo();
void FT_SetName( FCB *p_fcb, const char *p_name );
void cargar_filas();
void recorreArrayConMapa();

void deRamAVramPage1(void);
void deVramAVramEBloquesArribaAbajo(void);
void deVramAVramTodaLaPantalla(void);

void inicializar_player(struct TPlayer*);
void actualizar_personaje(struct TPlayer*);
void procesar_entrada();




FCB TFile;
FCB TArchivo;
unsigned char buffer_pantalla[30720];
//3328 bytes, 256*13
unsigned char buffer_archivo[3328];
unsigned int fila1[511];
unsigned int fila2[511];
unsigned int fila3[511];
unsigned int fila4[511];
char file_name_pantalla_1[]="tiles.bin";
char nombre_archivo[]="word0.bin";

int contador1=0;
int contador2=256;        

void main(void){
  char c[]="Hola desde el espacio";
  SpriteReset();
    Screen(5);


  leerMapaDeTiles();

  deRamAVramPage1();
  deVramAVramEBloquesArribaAbajo();
  leerArchivo();
  cargar_filas();
  recorreArrayConMapa();

  //PutText(10,100,"Holaaaaaaa2",0);
  //Sprite16();
 
  //inicializar_player(&player);


  //Bucle render
  while(1){
    recorreArrayConMapa();
  }

}
 
void inicializar_player(struct TPlayer *player){
    // px= player posición eje x, py= player posición eje y
    // pv player velocidad, pm= player movimiento (se obtiene del teclado)
    //px=100; py=192-32; pv=5; pm=0;
    // lo metemos en la tabla de dEfinición de patrones
    // el 1 argumento es la posición en la poisión en la tabla de definición de sprites (sprite pattern)
    // el 2 argumentos son los datos del sprite
    // el 3 argumento es el numero del línea del patron

    SetSpritePattern( 0, coche_derecha, 32);
    SetSpritePattern( 4, coche_izquierda, 32);

    //Le ponemos el color al sprite
    //SC5SpriteColors( 0, color_coche_derecha );	
    //SC5SpriteColors( 0, color_coche_izquierda );	
    // Mostramos nuestro esprite
    // 1. el plano o su definición en la tabla de atributos, ahí s e alamcenará la posición x e y
    // 2 la definición en sprite pattern qu eva de 4 en 4 bytes
    // 3 posición eje x, 4 posición eje y, 5 color
    //Ponemos el player
    PutSprite( 0, player->plano, player->x, player->y, 6 );
    
}
void actualizar_personaje(struct TPlayer *player){

    PutSprite( 0, player->plano, player->x,player->y, player->color );
}



//Sistema de input
void procesar_entrada(){
  //Screen(0);
	// 0 son cursores teclado
  // 0=inactive  1=up 2=up & right 3=right 4=down & right 5=down 6=down & left 7=left 8=up & left 
	int8 pm = JoystickRead(0);
    switch (pm)
    {
      case 1:
          player.y-=player.v;
          break;
      case 3:
          player.x+=player.v;
          player.plano=0;

          break;
      case 5:
          player.y+=player.v;
          break;
      case 7:
          player.x-=player.v;
          player.plano=1;
          break;
      default:
          break;
    }
}


/**********************************************************
* *******************MAPA**********************************
**********************************************************/

void leerMapaDeTiles(){
    //Cargamos el archivo en la estructura
    FT_SetName( &TFile, &file_name_pantalla_1[0] );
    fcb_open( &TFile );
    //Sino omitimos los 7 primeros bytes (los que defininen la estructura del binario) aparecen  unas marcas arriba a la derecha
    fcb_read( &TFile, &buffer_pantalla[0], 7 ); 
    //Cargamos el archivo definido en la estructura y lo ponemos en la RAM (buffer)
    fcb_read( &TFile, &buffer_pantalla[0], 30720 );  
    fcb_close( &TFile );
}

void leerArchivo(){
    FT_SetName( &TArchivo, &nombre_archivo[0] );
    fcb_open( &TArchivo );
    fcb_read( &TArchivo, &buffer_archivo[0], 7 );  // Skip 7 first bytes of the file  
    fcb_read( &TArchivo, &buffer_archivo[0], 3328 );  // Read 20 lines of image data (128bytes per line in screen5)
    fcb_close( &TArchivo);
}

void deRamAVramPage1(void){
  HMMC(&buffer_pantalla[0], 0,256,256,212 ); 
}

void deVramAVramEBloquesArribaAbajo(void){
contador1+=1;
  //contador2-=1;

  //HMMM(posicion x,posicion y (si es mayor que 256 es la page 1),destina x,destino y,anchura copia,altura copia);
  HMMM(contador1,256,0,0,16*2,16);
  //if (contador1>255) contador1=0;
  //if (contador2<0) contador2=256;
  
}
void deVramAVramTodaLaPantalla(void){
  contador1+=1;
  contador2-=1;
  //if(contador=0) contador=256;
  //HMMM(posicion x,posicion y (si es mayor que 256 es la page 1),destina x,destino y,anchura copia,altura copia);
  HMMM(contador1,256,0,0,256,212);
  HMMM(0,256,contador2,0,256,212);
  if (contador1>255) contador1=0;
  if (contador2<0) contador2=256;
}
void cargar_filas(){
  int contador_fila1,contador_fila2,contador_fila3,contador_fila4;
  contador_fila2=0;contador_fila3=0;contador_fila4=0;
  for (int i=1; i<511;i++){
    fila1[i]=buffer_archivo[i];
  }
  for (int i=511; i<1022;i++){
    contador_fila2++;
    fila2[contador_fila2]=buffer_archivo[i];
  }
    for (int i=1022; i<1533;i++){
      contador_fila3++;
    fila3[contador_fila3]=buffer_archivo[i];
  }
    for (int i=1533; i<2044;i++){
      contador_fila4++;
    fila4[contador_fila4]=buffer_archivo[i];
  }
}
void recorreArrayConMapa(){
 
    //t3=sizeof(buffer_archivo);
    
    
    //Screen(0);
    for (int i=1; i<511;i++){
        Halt();
        Halt();
        Halt();
        HMMM(fila1[i]*16,256, 256-16,0,16,16);
        HMMM(fila2[i]*16,256, 256-16,16,16,16);
        HMMM(fila3[i]*16,256, 256-16,16*2,16,16);
        HMMM(fila4[i]*16,256, 256-16,16*3,16,16);
        HMMM(16,0, 0,0,256,32);
      
      //printf(" %d ,",buffer_archivo[i]); 

    }
    //printf(" Gola");
    //printf("Tamanioo archivo : %d",buffer_archivo[i]);   
  // HMMC(&buffer_pantalla[0], posicion x,posición y,longitux de la zona a copiar,la altura de la zona a copiar ); 
  //char nombre_archivo=itoa(sizeof(buffer_archivo), &tamanio_char[0],10);
  //HMMC(nombre, 48,0,16,16 ); 
  //Copia un rectangulo de VRAM a VRAM
  //x,y, destino_x, destino_y, anhura y altura)

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