#!/bin/python

# Função calcular fatorial
def fatorial(n):
  fat = 1
  while n>1:
    fat = fat * n
    n = n - 1
  return fat

# Função calculo binomial
def numero_binomial(n, k):
  return fatorial(n) / (fatorial(k)* fatorial(n-k))

# Função de testes da função fatorial
def testa_fatorial():
  if fatorial(1) == 1:
    print ("Funcionou com 1")
  else:
    print("Não funcionoou com 1")
  if fatorial(5) == 120:
    print ("Funcionou com 5")
  else:
    print("Não funcionoou com 5")
