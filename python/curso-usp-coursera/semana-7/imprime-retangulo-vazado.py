largura=int(input("Digite a largura:"))
altura=int(input("Digite a altura:"))
contlargura=1
contaltura=1
embranco=1

while contaltura <= altura:
  if contaltura == altura or contaltura == 1:
    print("#" * largura)
  else:
    embranco=largura-2
    print("#", end="")
    print("*" * embranco, end="")
    print("#")
  contaltura=contaltura+1
