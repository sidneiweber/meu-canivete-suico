numero=int(input("Digite um valor inteiro: "))
auxiliar=numero%10

while numero != 0:
  numero=numero//10
  auxiliar=auxiliar+numero%10

print(auxiliar)
