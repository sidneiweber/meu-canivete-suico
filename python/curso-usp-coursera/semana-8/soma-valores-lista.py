def soma_elementos(lista):
    soma = 0
    for i in lista:
        soma=soma+i
    return soma


lista=[20,3,7,5,11,5,1]

lista = soma_elementos(lista)
print (lista)
