frutas=["Laranja", "Banana", "Maca"]

for fruta in frutas:
    print("Eu adoro " + fruta)

primos = [2,3,5,7,11,13]
for x in primos:
    print(x*x)

# Range fim
for i in range(10):
    print(i)

# Range inicio, fim
for i in range(1,10):
    print(i)

# Range inicio. fim. passo
for i in range(1,10, 2):
    print(i)

# Calcular primos elevado ao cubo e substituir
for i in range(len(primos)):
    primos[i] = primos[i]**3
    print(primos[i])
