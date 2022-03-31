#!/bin/bash

while [ true ]
do
   clear
   df /dev/sda5 -h
   echo ''
   echo ''
   free -h
  sleep 1
done
