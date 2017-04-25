numero=int(input("Digite um valor inteiro: "))
contador=1
contador_primos=1

while (contador_primos <= numero):
  if (contador%2) == 1: 
    print(contador)
    contador_primos=contador_primos+1
    #print(contador_primos)
  contador=contador+1
