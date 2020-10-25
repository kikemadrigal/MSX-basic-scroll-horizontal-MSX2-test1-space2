/**************DECLARACIONES************/
#ifndef __PLAYER_H__
#define __PLAYER_H__
//INCLUDES

//FUNCIONES
void inicializar_player();
void actualizar_personaje();
//VARIABLES (los arrays y primitos deben de ser ya inicializados)
//unsigned char px=10,py=212/2,pplano=0,psprite=0,pcolor=6,pvelocidad=4,penergia=100;
typedef struct {
    unsigned char x;
    unsigned char y;
    unsigned char plano;
    unsigned char sprite;
    unsigned char color;
    unsigned char velocidad;
    unsigned char energia;
} TPlayer;

#endif
/***********FINAL DE DECLARACIONES************/



/**************DEFINICIONES************/
TPlayer player={
    10, //x
    212/2, //y
    0, //plano
    0, //sprite
    6, //color
    4, //velocidad
    100 //energia
};
void inicializar_player(){
    //py=212/2;
    // PutSprite( pplano,psprite,px,py, pcolor );
    // PutSprite( pplano+1,psprite+4,px,py, pcolor+1 );    
}
void actualizar_personaje(){
    //Plano, ptron, x, y, color
    //PutSprite( pplano, psprite, px,py, pcolor );
    //PutSprite( pplano+1, psprite+4, px,py, pcolor+1 );
    PutSprite( player.plano, player.sprite, player.x,player.y, 0 );
    PutSprite( player.plano+1, player.sprite+4, player.x,player.y, 0 );
}
