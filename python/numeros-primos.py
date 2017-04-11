#!/bin/bash
entrada = int(input("Digite um numero positivo real qualquer: "))
if (entrada <=0):
   finalizar=input('Numero invalido, pressione qualquer tecla para continuar...')
   exit()

# i sera nosso divisor inicial
i = 1
# j sera nosso contador de ocorrências
j = 0

#Nenhum numero real vai ser divisivel por um numero maior do que sua metade
entrada1 = (entrada/2)

while (i <= entrada):

   if (entrada % i==0):
      print('-> É divisivel por',i,'<-')
      i = i+1
      j = j+1

   if (i>=entrada1):
      # damos a i, o valor da variavel entrada, pois o próximo divisor sera o próprio número
      i = entrada
      print('--> É divisivel por',i,'<--')
      i = i+1
      j = j+1

   else:
      i = i+1
if(j==2):
   print('O número requisitado é primo!')
else:
   print('Numero não é primo, possui',j,'divisores.')
