#!/bin/python
entrada = int(input("Digite um numero positivo real qualquer: "))
if (entrada <=0):
   finalizar=input('Numero invalido, pressione qualquer tecla para continuar...')
   exit()

# i sera nosso divisor inicial
i = 1
# j sera nosso contador de ocorrencias
j = 0

#Nenhum numero real vai ser divisivel por um numero maior do que sua metade
entrada1 = (entrada/2)

while (i <= entrada):

   if (entrada % i==0):
      print('-> E divisivel por',i,'<-')
      i = i+1
      j = j+1

   if (i>=entrada1):
      # damos a i, o valor da variavel entrada, pois o proximo divisor sera o proprio numero
      i = entrada
      print('--> E divisivel por',i,'<--')
      i = i+1
      j = j+1

   else:
      i = i+1
if(j==2):
   print('O numero requisitado e primo!')
else:
   print('Numero nao e primo, possui',j,'divisores.')
