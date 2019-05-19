#include "main.h"
#include "AES.h"
#include <stdlib.h>
#include <stdio.h>
#include "mstn_usb.h"
#include "mstn_gpio.h"
#include "mstn_clk.h"
#include "Serial.h"

int main(int argc, char *argv[])
{
    while (USB_GetStatus() != PERMITTED);
    GPIO_PinMode(2, DIGITAL_OUTPUT);
    GPIO_DigitalWrite(2, LOW);
    Serial1.init(SERIAL1);
    Serial1.begin(9600);
    
    char buffer[1024];
    int i = 0;
    int flag = 0;
    while(1) {
       i = 0;
        while( Serial1.available() ) {
            int wait = 100;
            while (wait) {
                wait--;
                continue;
            }
            flag = 1;
            buffer[i++] = Serial1.read(); // считываем данные и записываем их в буфер
            printf("suka %d\n", Serial1.available());
        }
        if (flag) {
            buffer[i] = 0;
            printf("buffer %s\n", buffer);
            flag = 0;
        }
        Serial1.println("ping romalox");
        Delay(5000);
        printf("send\n");
    }
}
