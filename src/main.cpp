#include "main.h"
#include "AES.h"
#include <stdlib.h>
#include <stdio.h>
#include "mstn_usb.h"
#include "Serial.h"

AES aes ;

byte key[] = "0123456789010123";

byte plain[80] = "masha <3 roma masha <3 roma masha <3 roma masha <3 roma masha <3 roma";
//int plainLength = sizeof(plain)-1;  // don't count the trailing /0 of the string !
//int padedLength = (plainLength + N_BLOCK) - (plainLength % N_BLOCK);

//real iv = iv x2 ex: 01234567 = 0123456701234567
unsigned long long int my_iv = 36753562;


void prekey (int bits)
{
    byte cipher[100];
    byte check[100];
    int plainLength = sizeof(plain)-1;  // don't count the trailing /0 of the string !
    int padedLength = plainLength + N_BLOCK - plainLength % N_BLOCK;
    aes.iv_inc();
    byte iv [N_BLOCK] ;
    aes.set_IV(my_iv);
    aes.get_IV(iv);
    aes.do_aes_encrypt(plain,plainLength,cipher,key,bits,iv);
    aes.set_IV(my_iv);
    aes.get_IV(iv);
    aes.do_aes_decrypt(cipher,padedLength,check,key,bits,iv);
    while(1){
        printf("NBLOCK %d\n", N_BLOCK);
        printf("plain length %d\n", plainLength);
        printf("paded length: %d\n", padedLength);
        printf("\n\nPLAIN: %s\n", plain);
        aes.printArray(plain, 79);
        printf("\nCIPHER:");
        aes.printArray(cipher, padedLength);
        check[70] = 0;
        printf("\nCHECK: %s\n", check);
        aes.printArray(check, 79);
        printf("\n");
        printf("\n============================================================\n");
  }
}

int main(int argc, char *argv[])
{
    //prekey(128);
    while (USB_GetStatus() != PERMITTED);
    //pinMode(2, OUTPUT);
    Serial1.init(SERIAL1);
    Serial1.begin(115200);
    
    char buffer[1024];
    int i = 0;

    
    while(1) {
        i = 0;
       while( Serial1.available() ){ 
         buffer[i++] = Serial1.read(); // считываем данные и записываем их в буфер
         printf("suka %d\n", Serial1.available());
         buffer[i] = 0;
         printf("%s\n", buffer);
        }
        //Serial1.print("ping romalox");
    }
}
