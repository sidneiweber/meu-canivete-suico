meuCartao=int(input("Digite o numero do cartao de credito: "))

cartaoLido=1
cartaoEncontrado=False

while cartaoLido != 0 and not cartaoEncontrado:
    cartaoLido=int(input("Digite proximo cartao: "))
    if cartaoLido == meuCartao:
        cartaoEncontrado == True

if cartaoEncontrado:
    print("Cartao encontrado")
else:
    print("Cartao perdido mesmo")
