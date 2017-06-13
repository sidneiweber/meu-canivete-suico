#!/bin/python

valor=1
while valor != 0:
  valor=int(input("Digite um valor para calcular o fatorial ou digite '0' para sair: "))
  contador=1
  soma=1
  while contador <= valor:
    soma=soma*contador
    contador=contador+1
  print("Vetorial de", valor, "é", soma)
