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

HardwareSerial Serial1(SERIAL1);
HardwareSerial Serial2(SERIAL2);
HardwareSerial Serial3(SERIAL3);
HardwareSerial Serial4(SERIAL4);
