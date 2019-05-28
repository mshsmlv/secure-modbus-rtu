/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   Serial.cpp
 * Author: maria
 * 
 * Created on May 14, 2019, 11:38 PM
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "Serial.h"

void HardwareSerial::println(const char *str)
{
    UART_PrintStr(iNum, str);
    UART_PrintStr(iNum, "\n");
}

void HardwareSerial::print(const char c)
{
    UART_Write(iNum, c);
}

void HardwareSerial::print(const char *str)
{
    UART_PrintStr(iNum, str);
}

size_t HardwareSerial::write(uint8_t* buffer, unsigned char size) {
        //UART_WriteBuff(iNum, (char*)buffer, size);
        unsigned char i;
        char c;
        for(i = 0; i < size; i++) {
            c = (char)buffer[i];
            printf("send %x\n", c);
            UART_Write(iNum, c);
            ProgramDelay(100);
        }
        return size;
 };

HardwareSerial Serial1(SERIAL1);
HardwareSerial Serial2(SERIAL2);
HardwareSerial Serial3(SERIAL3);
HardwareSerial Serial4(SERIAL4);
