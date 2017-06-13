numero=1
lista=[]
while numero != 0:
  numero=int(input("Digite um numero inteiro, valor 0 termina a lista"))
  if numero != 0:
    lista.append(numero)
    
lista.reverse()

for i in lista:
  print(i)
