def soma_matrizes(m1, m2):
    matriz_soma = []
    # Supondo que as duas matrizes possuem o mesmo tamanho
    quant_linhas = len(m1) # Conta quantas linhas existem
    quant_colunas = len(m1[0]) # Conta quantos elementos têm em uma linha
    for i in range(quant_linhas):
        # Cria uma nova linha na matriz_soma
        matriz_soma.append([])
        for j in range(quant_colunas):
            # Somando os elementos que possuem o mesmo índice
            soma = m1[i][j] + m2[i][j]
            matriz_soma[i].append(soma)
    print(matriz_soma)
    
def soma(m1, m2):
  tamanho_m1=str(len(m1))+"X"+str(len(m1[0]))
  tamanho_m2=str(len(m2))+"X"+str(len(m2[0]))
  if tamanho_m1 == tamanho_m2:
    soma_matrizes(m1, m2)
  else:
    return False
