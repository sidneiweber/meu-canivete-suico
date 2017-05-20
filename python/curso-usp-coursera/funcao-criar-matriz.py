def criaMatriz(linhas, colunas, valor):
  matriz = [] # Lista vazia
  for i in range(linhas):
    # Cria a linha i
    linha = [] # lista vazia
    for j in range(colunas):
      linha.append(valor)
      
    # Adiciona linha a matriz
    matriz.append(linha)
  return matriz
