#!/bin/python
alunos = int(input("Quantos alunos esta sala tem? "))
contagem = 0
total = 0

while contagem < alunos:
    contagem = contagem + 1
    print (" Notas do aluno ", contagem)
    prova1 = int(input(" Nota da primeira prova: "))
    prova2 = int(input(" Nota da segunda prova: "))
    prova3 = int(input(" Nota da terceira prova: "))
    prova4 = int(input(" Nota da quarta prova: "))
    total = total + prova1 + prova2 + prova3 + prova4

media = total / alunos / 4
print ("A média geral da sala é ", media,) 
