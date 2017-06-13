#!/bin/bash

segundos=int(input("Quantos segundos deseja calcular: "))

horas = segundos // 3600
resto_segundos = segundos % 3600
minutos = resto_segundos // 60
segundos_final = resto_segundos % 60

print(horas, "horas,", minutos, "minutos e", segundos_final, "segundos.")
