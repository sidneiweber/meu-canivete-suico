#!/bin/python
numero=int(input("Digite um valor inteiro: "))
contador=1
resultado=1

while contador <= numero:
  resultado=resultado*contador
  contador=contador+1
  
print(resultado)
