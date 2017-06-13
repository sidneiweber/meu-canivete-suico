def maior_elemento(lista):
  maior=0  
  for i in lista:
    if maior == 0:
      maior=i
    if i > maior:
      maior=i
  return maior


lista=[-10,-50]

lista = maior_elemento(lista)
print (lista)
