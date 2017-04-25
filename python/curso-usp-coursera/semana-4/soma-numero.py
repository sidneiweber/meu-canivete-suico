#/bin/python
print ("Digite uma sequencia de valores terminada por zero")
soma=0
valor=1

while valor != 0:
    valor=int(input("Digite um valor a ser somado: "))
    soma=soma + valor

print("Soma total é:",soma)
