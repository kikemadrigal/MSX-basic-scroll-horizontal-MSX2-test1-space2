#ifndef __FIRE_H__
#define __FIRE_H__

typedef struct {
    unsigned char x;
    unsigned char y;
    unsigned char velocidad;
    unsigned char plano;
    //Recuerda siempre multiplizar por 4, como en la línea que hay para la inicilización del struct
    unsigned char sprite;
    unsigned char color;
}t_fire;

t_fire fire={100,100,4,6,4*6,15};

unsigned char disparo[]={
    0xC0,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
};

unsigned char color_disparo[]={
    0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,
    0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F
};

#endif