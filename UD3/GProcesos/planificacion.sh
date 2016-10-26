#!/bin/bash

echo -e "-----------------------Planifiacion FIFO----------------"
clock=$(date +"%s")
/usr/bin/time -f "1 Total: %E" chrt -f 50 ./procesoCPU 1 $1 &
sleep 1
/usr/bin/time -f "2 Total: %E" chrt -f 50 ./procesoCPU 2 $2 &
sleep 1
/usr/bin/time -f "3 Total: %E" chrt -f 50 ./procesoCPU 3 $3 &
wait
echo "Segundos que han tardado entre todos: "$(($(date +"%s")-$clock))

echo -e "\n\n---------------------Planificacion BATCH--------------"
clock=$(date +"%s")
/usr/bin/time -f "1 Total: %E" chrt -b 0 ./procesoCPU 1 $1 &
sleep 1
/usr/bin/time -f "2 Total: %E" chrt -b 0 ./procesoCPU 2 $2 &
sleep 1
/usr/bin/time -f "3 Total: %E" chrt -b 0 ./procesoCPU 3 $3 &
wait
echo "Segundos que han tardado entre todos: "$(($(date +"%s")-$clock))

echo -e "\n\n---------------------Planificacion RR-----------------"
clock=$(date +"%s")
/usr/bin/time -f "1 Total: %E" chrt -r 50  ./procesoCPU 1 $1 &
sleep 1
/usr/bin/time -f "2 Total: %E" chrt -r 50  ./procesoCPU 2 $2 &
sleep 1
/usr/bin/time -f "3 Total: %E" chrt -r 50  ./procesoCPU 3 $3 &
wait
echo "Segundos que han tardado entre todos: "$(($(date +"%s")-$clock))

echo -e "\n\n------------------------Por defecto----------------------"
clock=$(date +"%s")
/usr/bin/time -f "1 Total: %E" ./procesoCPU 1 $1 &
sleep 1
/usr/bin/time -f "2 Total: %E" ./procesoCPU 2 $2 &
sleep 1
/usr/bin/time -f "3 Total: %E" ./procesoCPU 3 $3 &
wait
echo "Segundos que han tardado entre todos: "$(($(date +"%s")-$clock))
