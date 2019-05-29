import sys
import time
import serial

def read(port):
    ser = serial.Serial(port,9600,timeout=0.1)
    while 1:
        read_data = ser.read(256)
        print(read_data)
        if len(read_data) != 0:
            with open("dump.txt", "ab") as f:
                f.write(read_data)


if __name__=="__main__":
    read(sys.argv[1])
