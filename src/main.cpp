#include "main.h"
#include "AES.h"
#include <stdlib.h>
#include <stdio.h>
#include "mstn_usb.h"
#include "mstn_gpio.h"
#include "mstn_clk.h"
#include "Serial.h"
#include "ModBusRtu.h"

int main(int argc, char *argv[])
{
    while (USB_GetStatus() != PERMITTED);
    int8_t state = 0;
    // массив данных modbus
    uint16_t au16data[250];
    Modbus slave(1, 1, 2);
    slave.begin( 9600 ); 
    printf("slave begin\n");
    
    while (1) {
        state = slave.poll(au16data, 250);  
        // если получили пакет без ошибок - зажигаем светодиод на 50 мс 
        if (state > 4) {
            printf("recieve packet %d \n", state);
        }
       // ProgramDelay(2000);
    }
}
