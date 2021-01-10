;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _inicilizar_enemigos
	.globl _rand
	.globl _HMMM
	.globl _HMMC
	.globl _BoxLine
	.globl _Point
	.globl _Pset
	.globl _SC5SpriteColors
	.globl _SetSpritePattern
	.globl _PutSprite
	.globl _SpriteCollisionY
	.globl _SpriteCollisionX
	.globl _SpriteCollision
	.globl _SpriteReset
	.globl _SpriteOn
	.globl _SpriteSmall
	.globl _Sprite16
	.globl _fcb_read
	.globl _fcb_close
	.globl _fcb_open
	.globl _ReadSP
	.globl _Itoa
	.globl _Inkey
	.globl _WaitKey
	.globl _PutText
	.globl _FillVram
	.globl _VDPwrite
	.globl _SetColors
	.globl _TriggerRead
	.globl _JoystickRead
	.globl _Screen
	.globl _Cls
	.globl _Beep
	.globl _InputChar
	.globl _player
	.globl _modulo16
	.globl _i
	.globl _fileNameTileMap
	.globl _fileNameTilseSet
	.globl _color_sprite_disparo
	.globl _color_sprite_bloque_vacio
	.globl _color_sprite_enemigo2_izquierda
	.globl _color_sprite_enemigo2_derecha
	.globl _color_sprite_enemigo1
	.globl _color_sprite_nave_abajo2
	.globl _color_sprite_nave_abajo1
	.globl _color_sprite_nave_arriba2
	.globl _color_sprite_nave_arriba1
	.globl _color_sprite_nave_derecha2
	.globl _color_sprite_nave_derecha1
	.globl _sprite_disparo
	.globl _sprite_bloque_negro
	.globl _sprite_enemigo2_izquierda
	.globl _sprite_enemigo2_derecha
	.globl _sprite_enemigo1
	.globl _sprite_nave_abajo2
	.globl _sprite_nave_abajo1
	.globl _sprite_nave_arriba2
	.globl _sprite_nave_arriba1
	.globl _sprite_nave_derecha2
	.globl _sprite_nave_derecha1
	.globl _colisionY
	.globl _colisionX
	.globl _fire
	.globl _numero_de_enemigo
	.globl _array_structs_enemigos
	.globl _numero_disparo
	.globl _array_structs_fires
	.globl _fila12
	.globl _fila11
	.globl _fila10
	.globl _fila9
	.globl _fila4
	.globl _fila3
	.globl _fila2
	.globl _fila1
	.globl _bufferTileMap
	.globl _bufferTileSet
	.globl _TFileTileMap
	.globl _TFileTileSet
	.globl _cargar_sprites_en_VRAM
	.globl _cargarTileSetEnRAM
	.globl _cargarTileMapEnRAM
	.globl _deRamAVramPage1
	.globl _FT_SetName
	.globl _cargarArrayFilasTileMap
	.globl _recorrerBufferTileMapYPintarPage1EnPage0
	.globl _SetAdjust
	.globl _poner_columna_negra
	.globl _inicializar_player
	.globl _actualizar_personaje
	.globl _inicializar_disparos
	.globl _crear_disparos
	.globl _actualizar_disparos
	.globl _eliminar_disparos
	.globl _crear_enemigos
	.globl _actualizar_enemigos
	.globl _eliminar_enemigos
	.globl _inicializar_sprites
	.globl _procesar_entrada
	.globl _check_colision
	.globl _gui
	.globl _generar_numero_aleatorio
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_TFileTileSet::
	.ds 37
_TFileTileMap::
	.ds 37
_bufferTileSet::
	.ds 27136
_bufferTileMap::
	.ds 3328
_fila1::
	.ds 512
_fila2::
	.ds 512
_fila3::
	.ds 512
_fila4::
	.ds 512
_fila9::
	.ds 512
_fila10::
	.ds 512
_fila11::
	.ds 512
_fila12::
	.ds 512
_array_structs_fires::
	.ds 60
_numero_disparo::
	.ds 1
_array_structs_enemigos::
	.ds 100
_numero_de_enemigo::
	.ds 1
_fire::
	.ds 2
_colisionX::
	.ds 1
_colisionY::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_sprite_nave_derecha1::
	.ds 32
_sprite_nave_derecha2::
	.ds 32
_sprite_nave_arriba1::
	.ds 32
_sprite_nave_arriba2::
	.ds 32
_sprite_nave_abajo1::
	.ds 32
_sprite_nave_abajo2::
	.ds 32
_sprite_enemigo1::
	.ds 32
_sprite_enemigo2_derecha::
	.ds 32
_sprite_enemigo2_izquierda::
	.ds 32
_sprite_bloque_negro::
	.ds 32
_sprite_disparo::
	.ds 32
_color_sprite_nave_derecha1::
	.ds 16
_color_sprite_nave_derecha2::
	.ds 16
_color_sprite_nave_arriba1::
	.ds 16
_color_sprite_nave_arriba2::
	.ds 16
_color_sprite_nave_abajo1::
	.ds 16
_color_sprite_nave_abajo2::
	.ds 16
_color_sprite_enemigo1::
	.ds 16
_color_sprite_enemigo2_derecha::
	.ds 16
_color_sprite_enemigo2_izquierda::
	.ds 16
_color_sprite_bloque_vacio::
	.ds 16
_color_sprite_disparo::
	.ds 16
_fileNameTilseSet::
	.ds 12
_fileNameTileMap::
	.ds 10
_i::
	.ds 2
_modulo16::
	.ds 2
_player::
	.ds 7
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/sprites.c:141: void cargar_sprites_en_VRAM(){
;	---------------------------------
; Function cargar_sprites_en_VRAM
; ---------------------------------
_cargar_sprites_en_VRAM::
;src/sprites.c:147: SetSpritePattern( 0, sprite_nave_derecha1, 32);
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #_sprite_nave_derecha1
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:148: SetSpritePattern( 4, sprite_nave_derecha2, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_nave_derecha2
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:149: SetSpritePattern( 4*2, sprite_nave_arriba1, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_nave_arriba1
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:150: SetSpritePattern( 4*3, sprite_nave_arriba2, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_nave_arriba2
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:151: SetSpritePattern( 4*4, sprite_nave_abajo1, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_nave_abajo1
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:152: SetSpritePattern( 4*5, sprite_nave_abajo2, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_nave_abajo2
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:157: SC5SpriteColors(0, color_sprite_nave_derecha1);
	ld	hl, #_color_sprite_nave_derecha1
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	call	_SC5SpriteColors
	pop	af
;src/sprites.c:158: SC5SpriteColors(2*1, color_sprite_nave_derecha2);
	ld	hl, #_color_sprite_nave_derecha2
	ex	(sp),hl
	ld	hl, #0x0002
	push	hl
	call	_SC5SpriteColors
	pop	af
;src/sprites.c:172: SetSpritePattern( 4*6, sprite_enemigo1, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_enemigo1
	push	hl
	ld	a, #0x18
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:174: SetSpritePattern( 4*7, sprite_enemigo2_izquierda, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_enemigo2_izquierda
	push	hl
	ld	a, #0x1c
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:176: SetSpritePattern( 4*8, sprite_enemigo2_derecha, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_enemigo2_derecha
	push	hl
	ld	a, #0x20
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:178: SC5SpriteColors(2*2, color_sprite_enemigo1);
	ld	hl, #_color_sprite_enemigo1
	ex	(sp),hl
	ld	hl, #0x0004
	push	hl
	call	_SC5SpriteColors
	pop	af
;src/sprites.c:179: SC5SpriteColors(2*3, color_sprite_enemigo2_izquierda);
	ld	hl, #_color_sprite_enemigo2_izquierda
	ex	(sp),hl
	ld	hl, #0x0006
	push	hl
	call	_SC5SpriteColors
	pop	af
;src/sprites.c:180: SC5SpriteColors(2*4, color_sprite_enemigo2_derecha);
	ld	hl, #_color_sprite_enemigo2_derecha
	ex	(sp),hl
	ld	hl, #0x0008
	push	hl
	call	_SC5SpriteColors
	pop	af
;src/sprites.c:183: SetSpritePattern( 4*9, sprite_bloque_negro, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_bloque_negro
	push	hl
	ld	a, #0x24
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;src/sprites.c:184: SC5SpriteColors(9, color_sprite_bloque_vacio);
	ld	hl, #_color_sprite_bloque_vacio
	ex	(sp),hl
	ld	hl, #0x0009
	push	hl
	call	_SC5SpriteColors
	pop	af
;src/sprites.c:186: SetSpritePattern( 4*10, sprite_disparo, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_disparo
	push	hl
	ld	a, #0x28
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
	pop	af
;src/sprites.c:188: }
	ret
_Done_Version:
	.ascii "Made with FUSION-C 1.2 (ebsoft)"
	.db 0x00
;src/entities/pantalla.c:48: void cargarTileSetEnRAM(){
;	---------------------------------
; Function cargarTileSetEnRAM
; ---------------------------------
_cargarTileSetEnRAM::
;src/entities/pantalla.c:50: FT_SetName( &TFileTileSet, &fileNameTilseSet[0] );
	ld	hl, #_fileNameTilseSet
	push	hl
	ld	hl, #_TFileTileSet
	push	hl
	call	_FT_SetName
	pop	af
;src/entities/pantalla.c:51: fcb_open( &TFileTileSet );
	ld	hl, #_TFileTileSet
	ex	(sp),hl
	call	_fcb_open
;src/entities/pantalla.c:53: fcb_read( &TFileTileSet, &bufferTileSet[0], 7 ); 
	ld	hl, #0x0007
	ex	(sp),hl
	ld	hl, #_bufferTileSet
	push	hl
	ld	hl, #_TFileTileSet
	push	hl
	call	_fcb_read
	pop	af
	pop	af
;src/entities/pantalla.c:55: fcb_read( &TFileTileSet, &bufferTileSet[0], tamanobufferTileSet );  
	ld	hl, #0x6a00
	ex	(sp),hl
	ld	hl, #_bufferTileSet
	push	hl
	ld	hl, #_TFileTileSet
	push	hl
	call	_fcb_read
	pop	af
	pop	af
;src/entities/pantalla.c:56: fcb_close( &TFileTileSet );
	ld	hl, #_TFileTileSet
	ex	(sp),hl
	call	_fcb_close
	pop	af
;src/entities/pantalla.c:57: }
	ret
;src/entities/pantalla.c:59: void cargarTileMapEnRAM(){
;	---------------------------------
; Function cargarTileMapEnRAM
; ---------------------------------
_cargarTileMapEnRAM::
;src/entities/pantalla.c:60: FT_SetName( &TFileTileMap, &fileNameTileMap[0] );
	ld	hl, #_fileNameTileMap
	push	hl
	ld	hl, #_TFileTileMap
	push	hl
	call	_FT_SetName
	pop	af
;src/entities/pantalla.c:61: fcb_open( &TFileTileMap );
	ld	hl, #_TFileTileMap
	ex	(sp),hl
	call	_fcb_open
;src/entities/pantalla.c:63: fcb_read( &TFileTileMap, &bufferTileMap[0], 8 );  // Skip 7 first bytes of the file  
	ld	hl, #0x0008
	ex	(sp),hl
	ld	hl, #_bufferTileMap
	push	hl
	ld	hl, #_TFileTileMap
	push	hl
	call	_fcb_read
	pop	af
	pop	af
;src/entities/pantalla.c:64: fcb_read( &TFileTileMap, &bufferTileMap[0], tamanoBufferTileMap );  // Read 20 lines of image data (128bytes per line in screen5)
	ld	hl, #0x0d00
	ex	(sp),hl
	ld	hl, #_bufferTileMap
	push	hl
	ld	hl, #_TFileTileMap
	push	hl
	call	_fcb_read
	pop	af
	pop	af
;src/entities/pantalla.c:65: fcb_close( &TFileTileMap);
	ld	hl, #_TFileTileMap
	ex	(sp),hl
	call	_fcb_close
	pop	af
;src/entities/pantalla.c:66: }
	ret
;src/entities/pantalla.c:68: void deRamAVramPage1(void){
;	---------------------------------
; Function deRamAVramPage1
; ---------------------------------
_deRamAVramPage1::
;src/entities/pantalla.c:71: HMMC(&bufferTileSet[0], 0,256,256,212 ); 
	ld	hl, #0x00d4
	push	hl
	ld	hl, #0x0100
	push	hl
	ld	l, #0x00
	push	hl
	ld	h, #0x00
	push	hl
	ld	hl, #_bufferTileSet
	push	hl
	call	_HMMC
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:72: }
	ret
;src/entities/pantalla.c:76: void FT_SetName( FCB *p_fcb, const char *p_name )  // Routine servant à vérifier le format du nom de fichier
;	---------------------------------
; Function FT_SetName
; ---------------------------------
_FT_SetName::
	call	___sdcc_enter_ix
	push	af
	push	af
	dec	sp
;src/entities/pantalla.c:79: memset( p_fcb, 0, sizeof(FCB) );
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	b, #0x25
00178$:
	ld	(hl), #0x00
	inc	hl
	djnz	00178$
;src/entities/pantalla.c:80: for( i = 0; i < 11; i++ ) {
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	hl, #0x0001
	add	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	c, #0x00
00106$:
;src/entities/pantalla.c:81: p_fcb->name[i] = ' ';
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x20
;src/entities/pantalla.c:80: for( i = 0; i < 11; i++ ) {
	inc	c
	ld	a, c
	sub	a, #0x0b
	jr	C,00106$
;src/entities/pantalla.c:83: for( i = 0; (i < 8) && (p_name[i] != 0) && (p_name[i] != '.'); i++ ) {
	xor	a, a
	ld	-2 (ix), a
00111$:
	ld	a, 6 (ix)
	add	a, -2 (ix)
	ld	l, a
	ld	a, 7 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -2 (ix)
	inc	a
	ld	-1 (ix), a
	ld	c, (hl)
	ld	a, c
	sub	a, #0x2e
	ld	a, #0x01
	jr	Z,00181$
	xor	a, a
00181$:
	ld	l, a
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	NC,00102$
	ld	a, c
	or	a, a
	jr	Z,00102$
	bit	0, l
	jr	NZ,00102$
;src/entities/pantalla.c:84: p_fcb->name[i] =  p_name[i];
	ld	a, -4 (ix)
	add	a, -2 (ix)
	ld	l, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), c
;src/entities/pantalla.c:83: for( i = 0; (i < 8) && (p_name[i] != 0) && (p_name[i] != '.'); i++ ) {
	ld	a, -1 (ix)
	ld	-2 (ix), a
	jr	00111$
00102$:
;src/entities/pantalla.c:86: if( p_name[i] == '.' ) {
	ld	a, l
	or	a, a
	jr	Z,00118$
;src/entities/pantalla.c:87: i++;
	ld	a, -1 (ix)
	ld	-5 (ix), a
;src/entities/pantalla.c:88: for( j = 0; (j < 3) && (p_name[i + j] != 0) && (p_name[i + j] != '.'); j++ ) {
	ld	hl, #0x0009
	add	hl, de
	ex	de, hl
	ld	c, #0x00
00116$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00118$
	ld	l, -5 (ix)
	ld	h, #0x00
	ld	-4 (ix), c
	xor	a, a
	ld	-3 (ix), a
	ld	a, l
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, h
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, 6 (ix)
	add	a, -2 (ix)
	ld	l, a
	ld	a, 7 (ix)
	adc	a, -1 (ix)
	ld	h, a
	ld	b, (hl)
	ld	a, b
	or	a, a
	jr	Z,00118$
	ld	a, b
	sub	a, #0x2e
	jr	Z,00118$
;src/entities/pantalla.c:89: p_fcb->ext[j] =  p_name[i + j] ;
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	(hl), b
;src/entities/pantalla.c:88: for( j = 0; (j < 3) && (p_name[i + j] != 0) && (p_name[i + j] != '.'); j++ ) {
	inc	c
	jr	00116$
00118$:
;src/entities/pantalla.c:92: }
	ld	sp, ix
	pop	ix
	ret
;src/entities/pantalla.c:95: void cargarArrayFilasTileMap(){
;	---------------------------------
; Function cargarArrayFilasTileMap
; ---------------------------------
_cargarArrayFilasTileMap::
	call	___sdcc_enter_ix
	push	af
	push	af
	push	af
;src/entities/pantalla.c:98: for (int i=0; i<256;i++){
	ld	bc, #_fila1+0
	ld	de, #0x0000
00110$:
	ld	a, d
	xor	a, #0x80
	sub	a, #0x81
	jr	NC,00101$
;src/entities/pantalla.c:99: fila1[i]=bufferTileMap[i];
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	hl, #_bufferTileMap
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	xor	a, a
	ld	-1 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;src/entities/pantalla.c:98: for (int i=0; i<256;i++){
	inc	de
	jr	00110$
00101$:
;src/entities/pantalla.c:101: for (int i=256; i<512;i++){
	ld	bc, #0x0000
	ld	de, #0x0100
00113$:
	ld	a, d
	xor	a, #0x80
	sub	a, #0x82
	jr	NC,00102$
;src/entities/pantalla.c:102: contador_fila2++;
	inc	bc
;src/entities/pantalla.c:103: fila2[contador_fila2]=bufferTileMap[i];
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	a, #<(_fila2)
	add	a, l
	ld	-4 (ix), a
	ld	a, #>(_fila2)
	adc	a, h
	ld	-3 (ix), a
	ld	hl, #_bufferTileMap
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	xor	a, a
	ld	-1 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;src/entities/pantalla.c:101: for (int i=256; i<512;i++){
	inc	de
	jr	00113$
00102$:
;src/entities/pantalla.c:105: for (int i=512; i<768;i++){
	ld	bc, #0x0000
	ld	de, #0x0200
00116$:
	ld	a, d
	xor	a, #0x80
	sub	a, #0x83
	jr	NC,00103$
;src/entities/pantalla.c:106: contador_fila3++;
	inc	bc
;src/entities/pantalla.c:107: fila3[contador_fila3]=bufferTileMap[i];
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	a, #<(_fila3)
	add	a, l
	ld	-4 (ix), a
	ld	a, #>(_fila3)
	adc	a, h
	ld	-3 (ix), a
	ld	hl, #_bufferTileMap
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	xor	a, a
	ld	-1 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;src/entities/pantalla.c:105: for (int i=512; i<768;i++){
	inc	de
	jr	00116$
00103$:
;src/entities/pantalla.c:109: for (int i=256*3; i<256*4;i++){
	sla	c
	rl	b
	ld	de, #0x0300
00119$:
	ld	a, d
	xor	a, #0x80
	sub	a, #0x84
	jr	NC,00104$
;src/entities/pantalla.c:111: fila3[contador_fila3]=bufferTileMap[i];
	ld	hl, #_fila3
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	hl, #_bufferTileMap
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	xor	a, a
	ld	-1 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;src/entities/pantalla.c:109: for (int i=256*3; i<256*4;i++){
	inc	de
	jr	00119$
00104$:
;src/entities/pantalla.c:118: for (int i=256*9; i<256*10;i++){
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x09
00122$:
	ld	a, -1 (ix)
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC,00105$
;src/entities/pantalla.c:119: contador_fila9++;
	inc	-4 (ix)
	jr	NZ,00225$
	inc	-3 (ix)
00225$:
;src/entities/pantalla.c:120: fila9[contador_fila9]=bufferTileMap[i];
	pop	bc
	pop	hl
	push	hl
	push	bc
	add	hl, hl
	ld	a, #<(_fila9)
	add	a, l
	ld	c, a
	ld	a, #>(_fila9)
	adc	a, h
	ld	b, a
	ld	a, #<(_bufferTileMap)
	add	a, -2 (ix)
	ld	l, a
	ld	a, #>(_bufferTileMap)
	adc	a, -1 (ix)
	ld	h, a
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;src/entities/pantalla.c:118: for (int i=256*9; i<256*10;i++){
	inc	-2 (ix)
	jr	NZ,00122$
	inc	-1 (ix)
	jr	00122$
00105$:
;src/entities/pantalla.c:122: for (int i=256*10; i<256*11;i++){
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x0a
00125$:
	ld	a, -1 (ix)
	xor	a, #0x80
	sub	a, #0x8b
	jr	NC,00106$
;src/entities/pantalla.c:123: contador_fila10++;
	inc	-4 (ix)
	jr	NZ,00227$
	inc	-3 (ix)
00227$:
;src/entities/pantalla.c:124: fila10[contador_fila10]=bufferTileMap[i];
	pop	bc
	pop	hl
	push	hl
	push	bc
	add	hl, hl
	ld	a, #<(_fila10)
	add	a, l
	ld	c, a
	ld	a, #>(_fila10)
	adc	a, h
	ld	b, a
	ld	a, #<(_bufferTileMap)
	add	a, -2 (ix)
	ld	l, a
	ld	a, #>(_bufferTileMap)
	adc	a, -1 (ix)
	ld	h, a
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;src/entities/pantalla.c:122: for (int i=256*10; i<256*11;i++){
	inc	-2 (ix)
	jr	NZ,00125$
	inc	-1 (ix)
	jr	00125$
00106$:
;src/entities/pantalla.c:126: for (int i=256*11; i<256*12;i++){
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x0b
00128$:
	ld	a, -1 (ix)
	xor	a, #0x80
	sub	a, #0x8c
	jr	NC,00107$
;src/entities/pantalla.c:127: contador_fila11++;
	inc	-4 (ix)
	jr	NZ,00229$
	inc	-3 (ix)
00229$:
;src/entities/pantalla.c:128: fila11[contador_fila11]=bufferTileMap[i];
	pop	bc
	pop	hl
	push	hl
	push	bc
	add	hl, hl
	ld	a, #<(_fila11)
	add	a, l
	ld	c, a
	ld	a, #>(_fila11)
	adc	a, h
	ld	b, a
	ld	a, #<(_bufferTileMap)
	add	a, -2 (ix)
	ld	l, a
	ld	a, #>(_bufferTileMap)
	adc	a, -1 (ix)
	ld	h, a
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;src/entities/pantalla.c:126: for (int i=256*11; i<256*12;i++){
	inc	-2 (ix)
	jr	NZ,00128$
	inc	-1 (ix)
	jr	00128$
00107$:
;src/entities/pantalla.c:130: for (int i=256*12; i<256*13;i++){
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x0c
00131$:
	ld	a, -1 (ix)
	xor	a, #0x80
	sub	a, #0x8d
	jr	NC,00133$
;src/entities/pantalla.c:131: contador_fila12++;
	inc	-4 (ix)
	jr	NZ,00231$
	inc	-3 (ix)
00231$:
;src/entities/pantalla.c:132: fila12[contador_fila12]=bufferTileMap[i];
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	sla	-6 (ix)
	rl	-5 (ix)
	ld	a, #<(_fila12)
	add	a, -6 (ix)
	ld	c, a
	ld	a, #>(_fila12)
	adc	a, -5 (ix)
	ld	b, a
	ld	a, #<(_bufferTileMap)
	add	a, -2 (ix)
	ld	l, a
	ld	a, #>(_bufferTileMap)
	adc	a, -1 (ix)
	ld	h, a
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;src/entities/pantalla.c:130: for (int i=256*12; i<256*13;i++){
	inc	-2 (ix)
	jr	NZ,00131$
	inc	-1 (ix)
	jr	00131$
00133$:
;src/entities/pantalla.c:134: }
	ld	sp, ix
	pop	ix
	ret
;src/entities/pantalla.c:137: void recorrerBufferTileMapYPintarPage1EnPage0(){
;	---------------------------------
; Function recorrerBufferTileMapYPintarPage1EnPage0
; ---------------------------------
_recorrerBufferTileMapYPintarPage1EnPage0::
;src/entities/pantalla.c:140: modulo16+=2;
	ld	hl, (_modulo16)
	inc	hl
	inc	hl
	ld	(_modulo16), hl
;src/entities/pantalla.c:141: if (modulo16>256) modulo16=0;
	xor	a, a
	ld	iy, #_modulo16
	cp	a, 0 (iy)
	ld	a, #0x01
	sbc	a, 1 (iy)
	jr	NC,00102$
	ld	hl, #0x0000
	ld	(_modulo16), hl
00102$:
;src/entities/pantalla.c:142: if(modulo16 % 16==0){
	ld	a,(#_modulo16 + 0)
	and	a, #0x0f
	jp	NZ,00104$
;src/entities/pantalla.c:143: i++;
	ld	hl, (_i)
	inc	hl
	ld	(_i), hl
;src/entities/pantalla.c:145: HMMM(fila1[i]*16,256,256-16,16*1,16,16);
	ld	bc, #_fila1+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:148: HMMM(fila2[i]*16,256, 256-16,16*2,16,16);
	ld	bc, #_fila2+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0020
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:151: HMMM(fila3[i]*16,256, 256-16,16*3,16,16);
	ld	bc, #_fila3+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0030
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:154: HMMM(fila4[i]*16,256, 256-16,16*4,16,16);
	ld	bc, #_fila4+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0040
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:157: HMMM(fila9[i]*16,256, 256-16,16*9,16,16);
	ld	bc, #_fila9+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0090
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:159: HMMM(fila10[i]*16,256, 256-16,16*10,16,16);
	ld	bc, #_fila10+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x00a0
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:161: HMMM(fila11[i]*16,256, 256-16,16*11,16,16);
	ld	bc, #_fila11+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x00b0
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:163: HMMM(fila12[i]*16,256, 256-16,16*12,16,16);
	ld	bc, #_fila12+0
	ld	hl, (_i)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x0010
	push	bc
	ld	bc, #0x00c0
	push	bc
	ld	bc, #0x00f0
	push	bc
	ld	bc, #0x0100
	push	bc
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
00104$:
;src/entities/pantalla.c:167: HMMM(2,16, 0,16,256,64);
	ld	hl, #0x0040
	push	hl
	ld	hl, #0x0100
	push	hl
	ld	hl, #0x0010
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x10
	push	hl
	ld	l, #0x02
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:168: HMMM(2,212-64, 0,212-64,256,64);
	ld	hl, #0x0040
	push	hl
	ld	hl, #0x0100
	push	hl
	ld	hl, #0x0094
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x94
	push	hl
	ld	l, #0x02
	push	hl
	call	_HMMM
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/entities/pantalla.c:169: }
	ret
;src/entities/pantalla.c:171: void SetAdjust(signed char x, signed char y) // x and y must be between -7 and +6
;	---------------------------------
; Function SetAdjust
; ---------------------------------
_SetAdjust::
;src/entities/pantalla.c:174: vx=x;
	ld	iy, #2
	add	iy, sp
	ld	c, 0 (iy)
;src/entities/pantalla.c:175: if (x<0)
	bit	7,0 (iy)
	jr	Z,00102$
;src/entities/pantalla.c:176: vx=16+x;
	ld	a, c
	add	a, #0x10
	ld	c, a
00102$:
;src/entities/pantalla.c:177: vy=y;
	ld	iy, #3
	add	iy, sp
	ld	b, 0 (iy)
;src/entities/pantalla.c:178: if (y<0)
	bit	7,0 (iy)
	jr	Z,00104$
;src/entities/pantalla.c:179: vy=16+y;
	ld	a, b
	add	a, #0x10
	ld	b, a
00104$:
;src/entities/pantalla.c:180: value = (vy<<4) | vx ;
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, c
;src/entities/pantalla.c:181: Poke(0xFFF1,value);     // Reg 18 Save
	ld	(#0xfff1),a
;src/entities/pantalla.c:182: VDPwrite(18,value);
	ld	d,a
	ld	e,#0x12
	push	de
	call	_VDPwrite
	pop	af
;src/entities/pantalla.c:183: }
	ret
;src/entities/pantalla.c:185: void poner_columna_negra(){
;	---------------------------------
; Function poner_columna_negra
; ---------------------------------
_poner_columna_negra::
;src/entities/pantalla.c:191: }
	ret
;src/entities/player.c:36: void inicializar_player(){
;	---------------------------------
; Function inicializar_player
; ---------------------------------
_inicializar_player::
;src/entities/player.c:40: }
	ret
;src/entities/player.c:41: void actualizar_personaje(){
;	---------------------------------
; Function actualizar_personaje
; ---------------------------------
_actualizar_personaje::
;src/entities/player.c:45: PutSprite( player.plano, player.sprite, player.x,player.y, 0 );
	ld	hl, #(_player + 0x0001) + 0
	ld	c, (hl)
	ld	hl, #_player + 0
	ld	b, (hl)
	ld	hl, #(_player + 0x0003) + 0
	ld	e, (hl)
	ld	hl, #(_player + 0x0002) + 0
	ld	d, (hl)
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
;src/entities/player.c:46: PutSprite( player.plano+1, player.sprite+4, player.x,player.y, 0 );
	ld	hl, #(_player + 0x0001) + 0
	ld	c, (hl)
	ld	hl, #_player + 0
	ld	b, (hl)
	ld	a, (#(_player + 0x0003) + 0)
	add	a, #0x04
	ld	e, a
	ld	a, (#(_player + 0x0002) + 0)
	ld	d, a
	inc	d
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
;src/entities/player.c:47: }
	ret
;src/entities/fire.c:29: void inicializar_disparos(){
;	---------------------------------
; Function inicializar_disparos
; ---------------------------------
_inicializar_disparos::
;src/entities/fire.c:30: numero_disparo=0;
	ld	hl,#_numero_disparo + 0
	ld	(hl), #0x00
;src/entities/fire.c:31: }
	ret
;src/entities/fire.c:32: TFire* crear_disparos(){
;	---------------------------------
; Function crear_disparos
; ---------------------------------
_crear_disparos::
;src/entities/fire.c:33: TFire* fire=&array_structs_fires[numero_disparo];
	ld	bc, #_array_structs_fires+0
	ld	de, (_numero_disparo)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	de, hl
;src/entities/fire.c:34: ++numero_disparo;
	ld	hl, #_numero_disparo+0
	inc	(hl)
;src/entities/fire.c:35: return fire;
	ex	de,hl
;src/entities/fire.c:36: }
	ret
;src/entities/fire.c:37: void actualizar_disparos(){
;	---------------------------------
; Function actualizar_disparos
; ---------------------------------
_actualizar_disparos::
	call	___sdcc_enter_ix
	push	af
	dec	sp
;src/entities/fire.c:40: for (int i=0; i<numero_disparo; i++){
	ld	bc, #0x0000
00105$:
	ld	hl,#_numero_disparo + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P, 00107$
;src/entities/fire.c:41: array_structs_fires[i].x+=4;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, #_array_structs_fires
	add	hl, de
	ex	de, hl
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	add	a, #0x04
	ld	-2 (ix), a
	ld	a, h
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;src/entities/fire.c:42: if(array_structs_fires[i].x>256+2) eliminar_disparos(i);
	ld	a, #0x02
	cp	a, -2 (ix)
	ld	a, #0x01
	sbc	a, -1 (ix)
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	jp	P, 00102$
	push	bc
	push	de
	push	bc
	call	_eliminar_disparos
	pop	af
	pop	de
	pop	bc
00102$:
;src/entities/fire.c:43: PutSprite( array_structs_fires[i].plano, array_structs_fires[i].sprite, array_structs_fires[i].x,array_structs_fires[i].y, 15 );
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, (de)
	ld	-2 (ix), a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ex	de,hl
	ld	de, #0x0004
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x0f
	push	af
	inc	sp
	ld	h, -3 (ix)
	ld	l, -2 (ix)
	push	hl
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/entities/fire.c:40: for (int i=0; i<numero_disparo; i++){
	inc	bc
	jp	00105$
00107$:
;src/entities/fire.c:45: }
	ld	sp, ix
	pop	ix
	ret
;src/entities/fire.c:46: void eliminar_disparos(int i){
;	---------------------------------
; Function eliminar_disparos
; ---------------------------------
_eliminar_disparos::
	call	___sdcc_enter_ix
;src/entities/fire.c:47: --numero_disparo;
	ld	hl, #_numero_disparo+0
	dec	(hl)
;src/entities/fire.c:48: array_structs_fires[i]=array_structs_fires[numero_disparo];
	ld	bc, #_array_structs_fires+0
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	push	hl
	ld	de, (_numero_disparo)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	add	hl, bc
	ld	bc, #0x0006
	ldir
;src/entities/fire.c:50: }
	pop	ix
	ret
;src/entities/enemies.c:36: void inicilizar_enemigos(){
;	---------------------------------
; Function inicilizar_enemigos
; ---------------------------------
_inicilizar_enemigos::
;src/entities/enemies.c:38: numero_de_enemigo=0;
	ld	hl,#_numero_de_enemigo + 0
	ld	(hl), #0x00
;src/entities/enemies.c:41: }
	ret
;src/entities/enemies.c:42: TEnemy* crear_enemigos(){
;	---------------------------------
; Function crear_enemigos
; ---------------------------------
_crear_enemigos::
;src/entities/enemies.c:43: TEnemy* enemy=&array_structs_enemigos[numero_de_enemigo];
	ld	bc, #_array_structs_enemigos+0
	ld	de, (_numero_de_enemigo)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	de, hl
;src/entities/enemies.c:44: ++numero_de_enemigo;
	ld	hl, #_numero_de_enemigo+0
	inc	(hl)
;src/entities/enemies.c:45: return enemy;
	ex	de,hl
;src/entities/enemies.c:46: }
	ret
;src/entities/enemies.c:47: void actualizar_enemigos(){
;	---------------------------------
; Function actualizar_enemigos
; ---------------------------------
_actualizar_enemigos::
	call	___sdcc_enter_ix
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
;src/entities/enemies.c:49: for (int i=0; i<=numero_de_enemigo;i++){
	ld	bc, #0x0000
00119$:
	ld	hl,#_numero_de_enemigo + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00174$
	xor	a, #0x80
00174$:
	jp	M, 00121$
;src/entities/enemies.c:51: if(array_structs_enemigos[i].tipo==0){
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, #_array_structs_enemigos
	add	hl, de
	ex	de, hl
	ld	hl, #0x0009
	add	hl, de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-1 (ix), a
;src/entities/enemies.c:53: if (array_structs_enemigos[i].direccion==7){
	ld	hl, #0x0005
	add	hl, de
	ld	-10 (ix), l
	ld	-9 (ix), h
;src/entities/enemies.c:54: array_structs_enemigos[i].x-=array_structs_enemigos[i].velocidad;
	ld	hl, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
;src/entities/enemies.c:58: array_structs_enemigos[i].y=rand()%(148-64)+64;
	ld	hl, #0x0002
	add	hl, de
	ld	-6 (ix), l
	ld	-5 (ix), h
;src/entities/enemies.c:51: if(array_structs_enemigos[i].tipo==0){
	ld	a, -1 (ix)
	or	a, a
	jp	NZ, 00110$
;src/entities/enemies.c:53: if (array_structs_enemigos[i].direccion==7){
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	sub	a, #0x07
	jr	NZ,00104$
;src/entities/enemies.c:54: array_structs_enemigos[i].x-=array_structs_enemigos[i].velocidad;
	ld	a, (de)
	ld	-4 (ix), a
	inc	de
	ld	a, (de)
	ld	-3 (ix), a
	dec	de
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	l, (hl)
	ld	h, #0x00
	ld	a, -4 (ix)
	sub	a, l
	ld	-2 (ix), a
	ld	a, -3 (ix)
	sbc	a, h
	ld	-1 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;src/entities/enemies.c:56: if (array_structs_enemigos[i].x<=0){
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00177$
	xor	a, #0x80
00177$:
	jp	M, 00104$
;src/entities/enemies.c:57: array_structs_enemigos[i].x=255;    
	ld	l, e
	ld	h, d
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0x00
;src/entities/enemies.c:58: array_structs_enemigos[i].y=rand()%(148-64)+64;
	push	bc
	push	de
	call	_rand
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	hl, #0x0054
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, l
	add	a, #0x40
	ld	-2 (ix), a
	ld	a, h
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
00104$:
;src/entities/enemies.c:64: if (array_structs_enemigos[i].direccion==3){
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ,00110$
;src/entities/enemies.c:65: array_structs_enemigos[i].x+=array_structs_enemigos[i].velocidad;
	ld	a, (de)
	ld	-4 (ix), a
	inc	de
	ld	a, (de)
	ld	-3 (ix), a
	dec	de
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	l, (hl)
	ld	h, #0x00
	ld	a, l
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, h
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;src/entities/enemies.c:67: if (array_structs_enemigos[i].x>=256-16){
	ld	a, -2 (ix)
	sub	a, #0xf0
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00110$
;src/entities/enemies.c:68: array_structs_enemigos[i].x=1;
	ld	l, e
	ld	h, d
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;src/entities/enemies.c:69: array_structs_enemigos[i].y=rand()%(148-64)+64;
	push	bc
	push	de
	call	_rand
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	hl, #0x0054
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, l
	add	a, #0x40
	ld	-2 (ix), a
	ld	a, h
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
00110$:
;src/entities/enemies.c:75: if(array_structs_enemigos[i].tipo==1){
	pop	hl
	push	hl
	ld	a, (hl)
	dec	a
	jr	NZ,00116$
;src/entities/enemies.c:76: if (array_structs_enemigos[i].direccion==7){
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	sub	a, #0x07
	jr	NZ,00116$
;src/entities/enemies.c:77: array_structs_enemigos[i].x-=array_structs_enemigos[i].velocidad;
	ld	a, (de)
	ld	-2 (ix), a
	inc	de
	ld	a, (de)
	ld	-1 (ix), a
	dec	de
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	l, (hl)
	ld	h, #0x00
	ld	a, -2 (ix)
	sub	a, l
	ld	-4 (ix), a
	ld	a, -1 (ix)
	sbc	a, h
	ld	-3 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;src/entities/enemies.c:79: if (array_structs_enemigos[i].x<=0){
	xor	a, a
	cp	a, -4 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00184$
	xor	a, #0x80
00184$:
	jp	M, 00116$
;src/entities/enemies.c:80: array_structs_enemigos[i].x=255;                        
	ld	l, e
	ld	h, d
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0x00
00116$:
;src/entities/enemies.c:84: PutSprite(array_structs_enemigos[i].plano,array_structs_enemigos[i].sprite,array_structs_enemigos[i].x,array_structs_enemigos[i].y,array_structs_enemigos[i].color);
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0008
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	-2 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, (de)
	ld	-4 (ix), a
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0007
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	-3 (ix), a
	ex	de,hl
	ld	de, #0x0006
	add	hl, de
	ld	e, (hl)
	push	bc
	ld	h, -2 (ix)
	ld	l, -1 (ix)
	push	hl
	ld	a, -4 (ix)
	push	af
	inc	sp
	ld	d, -3 (ix)
	push	de
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/entities/enemies.c:49: for (int i=0; i<=numero_de_enemigo;i++){
	inc	bc
	jp	00119$
00121$:
;src/entities/enemies.c:86: }
	ld	sp, ix
	pop	ix
	ret
;src/entities/enemies.c:87: void eliminar_enemigos(){
;	---------------------------------
; Function eliminar_enemigos
; ---------------------------------
_eliminar_enemigos::
;src/entities/enemies.c:89: }
	ret
;main.c:53: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	call	___sdcc_enter_ix
	push	af
;main.c:55: FillVram(0,0,65535); 
	ld	hl, #0xffff
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x0000
	push	hl
	call	_FillVram
	pop	af
	pop	af
	inc	sp
;main.c:56: SetColors(15,1,1);
	ld	de, #0x0101
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_SetColors
	pop	af
	inc	sp
;main.c:57: Screen(5);   
	ld	a, #0x05
	push	af
	inc	sp
	call	_Screen
	inc	sp
;main.c:58: SetColors(15,1,1);
	ld	de, #0x0101
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_SetColors
	pop	af
	inc	sp
;main.c:60: cargarTileSetEnRAM();
	call	_cargarTileSetEnRAM
;main.c:61: deRamAVramPage1();
	call	_deRamAVramPage1
;main.c:62: cargarTileMapEnRAM();
	call	_cargarTileMapEnRAM
;main.c:63: cargarArrayFilasTileMap();
	call	_cargarArrayFilasTileMap
;main.c:66: inicializar_sprites();
	call	_inicializar_sprites
;main.c:68: cargar_sprites_en_VRAM();
	call	_cargar_sprites_en_VRAM
;main.c:70: SpriteOn();
	call	_SpriteOn
;main.c:71: colisionX=0;
	ld	hl,#_colisionX + 0
	ld	(hl), #0x00
;main.c:72: colisionY=0;
	ld	hl,#_colisionY + 0
	ld	(hl), #0x00
;main.c:76: PutText(0,100,"Space 2, pulse una tecla para jugar",8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	hl, #___str_1
	push	hl
	ld	hl, #0x0064
	push	hl
	ld	l, #0x00
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;main.c:77: WaitKey();
	call	_WaitKey
;main.c:78: Cls();
	call	_Cls
;main.c:85: repetir:
00101$:
;main.c:87: inicializar_player(); 
	call	_inicializar_player
;main.c:88: inicializar_disparos();
	call	_inicializar_disparos
;main.c:89: inicilizar_enemigos();
	call	_inicilizar_enemigos
;main.c:95: TEnemy* enemy1=crear_enemigos();
	call	_crear_enemigos
;main.c:96: enemy1->x=255;
	ld	c,l
	ld	b,h
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0x00
;main.c:97: enemy1->y=160;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0x00
;main.c:98: enemy1->velocidad=4;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x04
;main.c:101: enemy1->direccion=7;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x07
;main.c:102: enemy1->plano=8;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x08
;main.c:103: enemy1->sprite=7*4;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x1c
;main.c:104: enemy1->color=6;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x06
;main.c:106: enemy1->tipo=0;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x00
;main.c:109: TEnemy* enemy2=crear_enemigos();
	call	_crear_enemigos
;main.c:110: enemy2->x=255;
	ld	c,l
	ld	b,h
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0x00
;main.c:111: enemy2->y=90;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;main.c:112: enemy2->velocidad=10;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x0a
;main.c:114: enemy2->direccion=7;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x07
;main.c:115: enemy2->plano=9;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x09
;main.c:116: enemy2->sprite=7*4;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x1c
;main.c:117: enemy2->color=6;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x06
;main.c:118: enemy2->tipo=0;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x00
;main.c:122: TEnemy* enemy3=crear_enemigos();
	call	_crear_enemigos
;main.c:123: enemy3->x=0;
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;main.c:124: enemy3->y=70;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x46
	inc	hl
	ld	(hl), #0x00
;main.c:125: enemy3->velocidad=5;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x05
;main.c:127: enemy3->direccion=3;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x03
;main.c:128: enemy3->plano=10;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x0a
;main.c:130: enemy3->sprite=8*4;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x20
;main.c:131: enemy3->color=6;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x06
;main.c:133: enemy3->tipo=0;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x00
;main.c:136: TEnemy* enemy4=crear_enemigos();
	call	_crear_enemigos
;main.c:137: enemy4->x=255;
	ld	c,l
	ld	b,h
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0x00
;main.c:138: enemy4->y=180;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0xb4
	inc	hl
	ld	(hl), #0x00
;main.c:140: enemy4->velocidad=2;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x02
;main.c:142: enemy4->direccion=7;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x07
;main.c:143: enemy4->plano=11;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x0b
;main.c:145: enemy4->sprite=6*4;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x18
;main.c:146: enemy4->color=6;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x06
;main.c:148: enemy4->tipo=1;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x01
;main.c:151: for ( int i = 0; i < 200; ++i)
	ld	bc, #0x0000
00110$:
	ld	a, c
	sub	a, #0xc8
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
;main.c:154: Pset(generar_numero_aleatorio(0,256),generar_numero_aleatorio(0,212),15,0);
	push	bc
	ld	a, #0xd4
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_generar_numero_aleatorio
	pop	af
	pop	bc
	ld	-2 (ix), l
	xor	a, a
	ld	-1 (ix), a
	push	bc
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_generar_numero_aleatorio
	pop	af
	pop	bc
	ld	h, #0x00
	push	bc
	ld	de, #0x0000
	push	de
	ld	de, #0x000f
	push	de
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	push	de
	push	hl
	call	_Pset
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
;main.c:151: for ( int i = 0; i < 200; ++i)
	inc	bc
	jr	00110$
00102$:
;main.c:156: gui();
	call	_gui
;main.c:157: poner_columna_negra();
	call	_poner_columna_negra
;main.c:159: while(i<256 && Inkey()!=27){
00104$:
	ld	a,(#_i + 1)
	sub	a, #0x01
	jr	NC,00106$
	call	_Inkey
	ld	a, l
	sub	a, #0x1b
	jr	Z,00106$
;main.c:160: recorrerBufferTileMapYPintarPage1EnPage0();
	call	_recorrerBufferTileMapYPintarPage1EnPage0
;main.c:161: procesar_entrada();
	call	_procesar_entrada
;main.c:162: actualizar_personaje();
	call	_actualizar_personaje
;main.c:163: actualizar_disparos();
	call	_actualizar_disparos
;main.c:164: actualizar_enemigos();
	call	_actualizar_enemigos
;main.c:165: check_colision();
	call	_check_colision
	jr	00104$
00106$:
;main.c:169: PutText(100,100,"Mision cumplida, desea repetir",8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	hl, #___str_2
	push	hl
	ld	hl, #0x0064
	push	hl
	ld	l, #0x64
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;main.c:170: char c=InputChar();
	call	_InputChar
;main.c:172: Cls();
	call	_Cls
;main.c:173: i=0;
	ld	hl, #0x0000
	ld	(_i), hl
;main.c:174: goto repetir;
	jp	00101$
;main.c:182: }
	pop	af
	pop	ix
	ret
___str_1:
	.ascii "Space 2, pulse una tecla para jugar"
	.db 0x00
___str_2:
	.ascii "Mision cumplida, desea repetir"
	.db 0x00
;main.c:188: void inicializar_sprites(){
;	---------------------------------
; Function inicializar_sprites
; ---------------------------------
_inicializar_sprites::
;main.c:190: SpriteReset(); 
	call	_SpriteReset
;main.c:192: Sprite16(); 
	call	_Sprite16
;main.c:194: SpriteSmall(); 
;main.c:196: }
	jp	_SpriteSmall
;main.c:200: void procesar_entrada(){
;	---------------------------------
; Function procesar_entrada
; ---------------------------------
_procesar_entrada::
	call	___sdcc_enter_ix
	push	af
;main.c:204: char joy = JoystickRead(0);
	xor	a, a
	push	af
	inc	sp
	call	_JoystickRead
	inc	sp
	ld	c, l
;main.c:205: switch (joy)
	ld	a, c
	dec	a
	jr	Z,00101$
	ld	a,c
	cp	a,#0x03
	jr	Z,00102$
	cp	a,#0x05
	jr	Z,00103$
	sub	a, #0x07
	jr	Z,00104$
	jr	00106$
;main.c:207: case 1:
00101$:
;main.c:209: player.y-=player.velocidad;
	ld	bc, #_player + 1
	ld	a, (bc)
	ld	e, a
	ld	hl, #_player + 5
	ld	l, (hl)
	ld	a, e
	sub	a, l
	ld	(bc), a
;main.c:212: player.sprite=2*4;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x08
;main.c:213: break;
	jr	00106$
;main.c:214: case 3:
00102$:
;main.c:216: player.x+=player.velocidad;
	ld	hl, #_player + 0
	ld	c, (hl)
	ld	a, (#_player + 5)
	add	a, c
	ld	(#_player),a
;main.c:218: player.sprite=0;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x00
;main.c:219: break;
	jr	00106$
;main.c:220: case 5:
00103$:
;main.c:222: player.y+=player.velocidad;
	ld	bc, #_player + 1
	ld	a, (bc)
	ld	e, a
	ld	a, (#_player + 5)
	add	a, e
	ld	(bc), a
;main.c:224: player.sprite=4*4;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x10
;main.c:225: break;
	jr	00106$
;main.c:226: case 7:
00104$:
;main.c:228: player.x-=player.velocidad;
	ld	bc, #_player+0
	ld	a, (bc)
	ld	e, a
	ld	hl, #_player + 5
	ld	l, (hl)
	ld	a, e
	sub	a, l
	ld	(bc), a
;main.c:230: player.sprite=0;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x00
;main.c:234: }
00106$:
;main.c:236: char trigger = TriggerRead(0);
	xor	a, a
	push	af
	inc	sp
	call	_TriggerRead
	inc	sp
	ld	a, l
;main.c:237: if (trigger!=0) {
	or	a, a
	jr	Z,00111$
;main.c:238: if (numero_disparo<6){
	ld	a,(#_numero_disparo + 0)
	sub	a, #0x06
	jr	NC,00111$
;main.c:239: Beep();
	call	_Beep
;main.c:240: TEnemy* enemy1=crear_enemigos();
	call	_crear_enemigos
;main.c:241: TFire* fire=crear_disparos();
	call	_crear_disparos
	ld	c, l
	ld	b, h
;main.c:242: fire->x=player.x+20;
	ld	a, (#_player + 0)
	ld	e, a
	ld	d, #0x00
	ld	hl, #0x0014
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;main.c:243: fire->y=player.y+8;
	ld	hl, #0x0002
	add	hl, bc
	ex	(sp), hl
	ld	a, (#(_player + 0x0001) + 0)
	ld	e, a
	ld	d, #0x00
	ld	hl, #0x0008
	add	hl, de
	ex	de, hl
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;main.c:244: fire->plano=10+numero_disparo;
	ld	hl, #0x0004
	add	hl, bc
	ex	de, hl
	ld	a,(#_numero_disparo + 0)
	add	a, #0x0a
	ld	(de), a
;main.c:245: fire->sprite=10*4;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x28
;main.c:246: gui();
	call	_gui
00111$:
;main.c:250: }
	pop	af
	pop	ix
	ret
;main.c:253: void check_colision(){
;	---------------------------------
; Function check_colision
; ---------------------------------
_check_colision::
;main.c:258: color=Point(player.x, player.y);
	ld	a, (#(_player + 0x0001) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, (#_player + 0)
	ld	e, a
	ld	d, #0x00
	push	bc
	push	de
	call	_Point
	pop	af
	pop	af
	ld	a, l
;main.c:260: if (color!=1 && color!=0){
	cp	a, #0x01
	jr	Z,00102$
	or	a, a
	jr	Z,00102$
;main.c:261: Beep();
	call	_Beep
00102$:
;main.c:264: color=Point(player.x, player.y+16);
	ld	a, (#(_player + 0x0001) + 0)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0010
	add	hl, bc
	ex	de, hl
	ld	a, (#_player + 0)
	ld	c, a
	ld	b, #0x00
	push	de
	push	bc
	call	_Point
	pop	af
	pop	af
	ld	a, l
;main.c:265: if (color!=1 && color!=0){
	cp	a, #0x01
	jr	Z,00105$
	or	a, a
	jr	Z,00105$
;main.c:266: Beep();
	call	_Beep
00105$:
;main.c:271: char colision=SpriteCollision();
	call	_SpriteCollision
;main.c:272: if(colision==1){
	dec	l
	ret	NZ
;main.c:273: Beep();
	call	_Beep
;main.c:274: colisionX=SpriteCollisionX();
	call	_SpriteCollisionX
	ld	a, l
	ld	(_colisionX+0), a
;main.c:275: colisionY=SpriteCollisionY();
	call	_SpriteCollisionY
	ld	a, l
	ld	(_colisionY+0), a
;main.c:276: gui();
;main.c:280: }
	jp	_gui
;main.c:284: void gui(){
;	---------------------------------
; Function gui
; ---------------------------------
_gui::
;main.c:285: BoxLine(0,0,255,16,6,8);
	ld	de, #0x0806
	push	de
	ld	hl, #0x0010
	push	hl
	ld	l, #0xff
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	_BoxLine
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;main.c:289: PutText(2,2,Itoa(ReadSP(),"   ",10),8);
	call	_ReadSP
	ld	bc, #0x000a
	push	bc
	ld	bc, #___str_3
	push	bc
	push	hl
	call	_Itoa
	pop	af
	pop	af
	pop	af
	ld	a, #0x08
	push	af
	inc	sp
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	l, #0x02
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;main.c:290: PutText(60,2,"x: ",8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	hl, #___str_4
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	l, #0x3c
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;main.c:291: PutText(80,2,Itoa(colisionX,"   ",10),8);
	ld	de, #___str_3
	ld	hl,#_colisionX + 0
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000a
	push	hl
	push	de
	push	bc
	call	_Itoa
	pop	af
	pop	af
	pop	af
	ld	a, #0x08
	push	af
	inc	sp
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	l, #0x50
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;main.c:292: PutText(120,2,"y: ",8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	hl, #___str_5
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	l, #0x78
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;main.c:293: PutText(160,2,Itoa(colisionY,"   ",10),8);
	ld	de, #___str_3
	ld	hl,#_colisionY + 0
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000a
	push	hl
	push	de
	push	bc
	call	_Itoa
	pop	af
	pop	af
	pop	af
	ld	a, #0x08
	push	af
	inc	sp
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	l, #0xa0
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;main.c:295: }
	ret
___str_3:
	.ascii "   "
	.db 0x00
___str_4:
	.ascii "x: "
	.db 0x00
___str_5:
	.ascii "y: "
	.db 0x00
;main.c:298: char generar_numero_aleatorio (char a, char b){
;	---------------------------------
; Function generar_numero_aleatorio
; ---------------------------------
_generar_numero_aleatorio::
	call	___sdcc_enter_ix
;main.c:307: random = rand()%(b-a)+a;  
	call	_rand
	ld	c, 5 (ix)
	ld	b, #0x00
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, 4 (ix)
	add	hl, bc
;main.c:308: return(random);
;main.c:309: }
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__sprite_nave_derecha1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0xe3	; 227
	.db #0x80	; 128
	.db #0xe1	; 225
	.db #0x3c	; 60
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_nave_derecha2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_nave_arriba1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xf3	; 243
	.db #0x12	; 18
	.db #0x3e	; 62
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0xf3	; 243
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
__xinit__sprite_nave_arriba2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_nave_abajo1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_nave_abajo2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_enemigo1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x3c	; 60
	.db #0x3c	; 60
__xinit__sprite_enemigo2_derecha:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0x7c	; 124
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_enemigo2_izquierda:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x3e	; 62
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_bloque_negro:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
__xinit__sprite_disparo:
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__color_sprite_nave_derecha1:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
__xinit__color_sprite_nave_derecha2:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
__xinit__color_sprite_nave_arriba1:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0f	; 15
__xinit__color_sprite_nave_arriba2:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0f	; 15
__xinit__color_sprite_nave_abajo1:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x0f	; 15
__xinit__color_sprite_nave_abajo2:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x0f	; 15
__xinit__color_sprite_enemigo1:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x06	; 6
__xinit__color_sprite_enemigo2_derecha:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
__xinit__color_sprite_enemigo2_izquierda:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
__xinit__color_sprite_bloque_vacio:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
__xinit__color_sprite_disparo:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
__xinit__fileNameTilseSet:
	.ascii "tileset.sc5"
	.db 0x00
__xinit__fileNameTileMap:
	.ascii "word0.bin"
	.db 0x00
__xinit__i:
	.dw #0x0000
__xinit__modulo16:
	.dw #0x0000
__xinit__player:
	.db #0x0a	; 10
	.db #0x6a	; 106	'j'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x64	; 100	'd'
	.area _CABS (ABS)
