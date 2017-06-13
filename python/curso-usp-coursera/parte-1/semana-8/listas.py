lista=["Objeto 1", "Objeto 2", "Objeto 3"]

# Inserir na lista
lista.append("Objeto 4")

print(lista)

# Exibe indice por indice
print(lista[0])
print(lista[1])
print(lista[2])

# Lista de tras pra frente
print(lista[-1])

# Quantos indices tem
print(len(lista))

# Dados de um filme, misturando tipos
filme = ["Nome do filme", "Diretor filme", 1.83, 1997]
print(filme)
print(type(filme[0]))
print(type(filme[3]))

# Iniciar lista vazia
cartoes=[]
cartoes.append("Jogador 1")
cartoes.append("1 minuto")
cartoes.append("Jogador 2")
cartoes.append("15 minutos")
# Atribuir local especifico
cartoes[3]="20 minutos"

print(cartoes)
