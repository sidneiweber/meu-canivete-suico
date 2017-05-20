def criaMatriz(qtd_linhas, qtd_colunas):
  matriz = [] # Lista vazia
  for i in range(qtd_linhas):
    # Cria a linha i
    linha = [] # lista vazia
    for j in range(qtd_colunas):
      valor = int(input("Digite o valor da matriz " + str(i) +"-"  + str(j)))
      linha.append(valor)
      
    # Adiciona linha a matriz
    matriz.append(linha)
  return matriz
  
def le_matriz():
  lin = int(input("Digite o numero de linhas: "))
  col = int(input("Digite o numero de coluna: "))
  return criaMatriz(lin, col)
