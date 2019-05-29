#!/usr/bin/env python3

import struct
from umodbus.client.serial.redundancy_check import get_crc, validate_crc, CRCError

def get_frame(adu):
    frame = adu[:2]
    i = 2
    while 1:
        try:
            validate_crc(frame)
            break
        except (CRCError, struct.error) as e:
                frame += adu[i:i+1]
        i += 1
    return frame


def parse():
    with open("dump.txt", "rb") as f:
        dump = f.read()

    frames = []
    while len(dump) > 0:
        new_frame = get_frame(dump)
        dump = dump[len(new_frame):]
        frames.append(new_frame)

    for f in frames:
        print("----------------------")
        print(f)
        print("[slave id] ", f[0])
        print("[function code] ", f[1])
        print("[data] ", f[2: -2])
        print("[crc] ", f[-2:])

if __name__=="__main__":
    parse()
