/**************DECLARACIONES************/
#ifndef __PANTALLA_H__
#define __PANTALLA_H__
//FUNCIONES
//Cargar archivos en memoria RAM y VRAM
void cargarTileSetEnRAM();
void cargarTileMapEnRAM();
//Esto es para asociar un archivo al struct de archivos
void FT_SetName( FCB *p_fcb, const char *p_name );
//Esto me lo he inventado, :)
void cargarArrayFilasTileMap();
void recorrerBufferTileMapYPintarPage1EnPage0();
void deRamAVramPage1(void);
void SetAdjust(signed char x, signed char y);
void poner_columna_negra();
//VARIABLES Y ARRAYS
char fileNameTilseSet[]="tileset.sc5";
char fileNameTileMap[]="word0.bin";
FCB TFileTileSet;
FCB TFileTileMap;
//En screen5 cada byte define 2 colores, entonces 256px de ancho/2=128 bytes*212 filas=27136 bytes para definir una page
//En el ejemplo de fusion c cada 20 líneas son 2560 bytes
//30720
#define tamanobufferTileSet 27136
unsigned char bufferTileSet[tamanobufferTileSet];
//El tile map solo son bytes que identifican un valor correpondiente a cada fila y cada columna
//256*13 filas, 1024 bytes, necesitamos 32 valores para identificar los 13 tiles de cada fila de tiles de 16x16px
#define tamanoBufferTileMap 3328
unsigned char bufferTileMap[tamanoBufferTileMap];
unsigned int fila1[256];
unsigned int fila2[256];
unsigned int fila3[256];
unsigned int fila4[256];
unsigned int fila9[256];
unsigned int fila10[256];
unsigned int fila11[256];
unsigned int fila12[256];
unsigned int i=0;
unsigned int modulo16=0;
//unsigned int desplazamiento=0;
#endif
/********FINAL DE DECLARAIONES***********/




/**************DEFINICIONES************/
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
  //desplazamiento+=2;
  //if (desplazamiento>16) desplazamiento=0; 
  HMMM(2,16, 0,16,256,64);
  HMMM(2,212-64, 0,212-64,256,64);
}

void SetAdjust(signed char x, signed char y) // x and y must be between -7 and +6
{
    char vx,vy,value;
    vx=x;
    if (x<0)
      vx=16+x;
    vy=y;
    if (y<0)
      vy=16+y;
    value = (vy<<4) | vx ;
    Poke(0xFFF1,value);     // Reg 18 Save
    VDPwrite(18,value);
}

void poner_columna_negra(){
  
  //for (int i=0; i<13; i++){
    //PutSprite( 9, 36, 240,16*i, 1 );
  //}
  
}
