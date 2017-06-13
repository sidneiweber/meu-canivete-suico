#!/bin/python
decrescente=True
anterior=int(input("Digite o numero da sequencia: "))
valor=1

while valor != 0 and decrescente:
    valor=int(input("Digite o numero da sequencia: "))
    if valor > anterior:
        decrescente = False
    anterior=valor

if decrescente == True:
#if decresnte: # tambem vale
    print("A sequencia esta decrescente")
else:
    print("Não esta decrescente")
