# secure-modbus-rtu

Реализация защищенного соединения протокола Modbus RTU

## Сборка hardware части
```
cd hardware
make CONF=Release clean
make CONF=Release
```

## Загрузка на плату
```
sudo mstn-m100-client -d /home/maria/NetBeansProjects/MSTN_Project/hardware/dist/Release/GNU-Linux/hardware.bin
```

## Тестовое соединение
```
cd software/master
./master.py
```

## Сбор трафика со стороны злоумышленика
```
cd software/spy
./spy.py <serial port>
./parse.py
```
