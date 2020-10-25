/**************DECLARACIONES************/
#ifndef __ENEMIES_H__
#define __ENEMIES_H__
//INCLUDES

//VARIABLES Y ARRAYS
typedef struct {
    //Vamos a permitir los signos para que se salga de la pantalla
    int x;
    int y;
    //char es olo 1 byte de 0 a 255 posibles valores
    unsigned char velocidad;
    unsigned char direccion;
    unsigned char plano;
    unsigned char sprite;
    unsigned char color;
    unsigned char tipo;
}TEnemy;


//FUNCIONES
void inicializar_enemigos();
//Como nostros vamos a gestionar la memoria 1 definimos el espacio y despues devolvemos un puntero a
// la posición del array donde está el struct
TEnemy* crear_enemigos();
void actualizar_enemigos();
void eliminar_enemigos();
#endif
/***********FINAL DE DECLARACIONES************/

/**************DEFINICIONES****************/
//TEnemy enemigo_prueba={256,160,4,8,8*4,3,0};
TEnemy array_structs_enemigos[10];
char numero_de_enemigo;

void inicilizar_enemigos(){
    //Las variables globales tienen que ser inicializadas dentro de un método
    numero_de_enemigo=0;


}
TEnemy* crear_enemigos(){
    TEnemy* enemy=&array_structs_enemigos[numero_de_enemigo];
    ++numero_de_enemigo;
    return enemy;
}
void actualizar_enemigos(){
    //PutSprite(enemigo_prueba.plano,enemigo_prueba.sprite,enemigo_prueba.x,enemigo_prueba.y,enemigo_prueba.color);
   for (int i=0; i<=numero_de_enemigo;i++){
        //Si es una nave espacial
        if(array_structs_enemigos[i].tipo==0){
            //Si el tipo es de los que se mueven a la izquierda
            if (array_structs_enemigos[i].direccion==7){
                array_structs_enemigos[i].x-=array_structs_enemigos[i].velocidad;
                // Si se sale de la pantalla
                if (array_structs_enemigos[i].x<=0){
                    array_structs_enemigos[i].x=255;    
                    array_structs_enemigos[i].y=rand()%(148-64)+64;
                   // array_structs_enemigos[i].color=rand()%(15-2)+2;
                    
                }
            } 
            //Si el tipo es de los que se mueven a la derecha
            if (array_structs_enemigos[i].direccion==3){
                array_structs_enemigos[i].x+=array_structs_enemigos[i].velocidad;
                //Si se sale de la pantalla
                if (array_structs_enemigos[i].x>=256-16){
                    array_structs_enemigos[i].x=1;
                    array_structs_enemigos[i].y=rand()%(148-64)+64;
                    //array_structs_enemigos[i].color=rand()%(15-2)+2;
                }
            } 
        }
        //Si es un tanque
        if(array_structs_enemigos[i].tipo==1){
            if (array_structs_enemigos[i].direccion==7){
                array_structs_enemigos[i].x-=array_structs_enemigos[i].velocidad;
                // Si se sale de la pantalla
                if (array_structs_enemigos[i].x<=0){
                    array_structs_enemigos[i].x=255;                        
                }
             } 
        }
        PutSprite(array_structs_enemigos[i].plano,array_structs_enemigos[i].sprite,array_structs_enemigos[i].x,array_structs_enemigos[i].y,array_structs_enemigos[i].color);
    }
}
void eliminar_enemigos(){

}