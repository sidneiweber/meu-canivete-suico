#!/bin/python

numero1=int(input("Digite o valor 1: "))
numero2=int(input("Digite o valor 2: "))
numero3=int(input("Digite o valor 3: "))

if numero1 < numero2 and numero2 < numero3:
    print("crescente")
else:
    print("não está em ordem")
