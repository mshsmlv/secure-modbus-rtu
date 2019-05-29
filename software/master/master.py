#!/usr/bin/env python3
import fcntl
import struct
import time
from serial import Serial, PARITY_NONE

from umodbus.client.serial import rtu


def get_serial_port():
    """ Return serial.Serial instance, ready to use for RS485."""
    port = Serial(port="/dev/ttyUSB0", baudrate=9600, parity=PARITY_NONE,
                  stopbits=1, bytesize=8, timeout=1)

    return port

raw_message = "sensitive_data_sensitive_data_sensitive_data"

array_message = []

for i in range(0, len(raw_message), 2):
    array_message.append((ord(raw_message[i]) << 8) | ord(raw_message[i+1]))

for e in array_message:
    print(hex(e))
serial_port = get_serial_port()

message = rtu.write_multiple_registers(slave_id=1, starting_address=1, values=array_message)
print(message)

response = rtu.send_message(message, serial_port)
print("response", response)

time.sleep(1)
message = rtu.read_holding_registers(slave_id=1, starting_address=1, quantity=26)

response = rtu.send_message(message, serial_port)
print("response", response)

serial_port.close()
