#ifndef __PANTALLA_H__
#define __PANTALLA_H__
//Pantalla
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
/*char fileNameTilseSet[]="tileset.sc5";
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
unsigned int desplazamiento=0;*/


#endif