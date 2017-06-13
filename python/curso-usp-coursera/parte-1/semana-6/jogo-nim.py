#!/usr/bin/python

def computador_escolhe_jogada(n,m):
  print("Vez do computador!")
  if n <= m:
    return n
  else:
    quantia = n % (m+1)
    if quantia > 0:
      return quantia
    return m
    
def usuario_escolhe_jogada(n,m):
  print("Sua vez")
  jogada=0
  while jogada == 0:
    jogada=int(input("Quantas peças irá tirar: "))
    if jogada > n or jogada < 1 or jogada > m:
      jogada = 0
  
  return jogada

def partida():
  n=int(input("Quantas peças:"))
  m=int(input("Limite de peças por jogada:"))
  
  computador_comeca= True
  
  if n % (m+1) == 0:
    computador_comeca = False
    
  while n > 0:
    if computador_comeca:
      jogada=computador_escolhe_jogada(n, m)
      computador_comeca = False
      print("Computador retirou {} peças".format(jogada))
    else:
      jogada = usuario_escolhe_jogada(n,m)
      computador_comeca = True
      print("Você retirou {} peças.".format(jogada))
    n = n -jogada
    print("Restam {} peças em jogo".format(n))
  
  if computador_comeca:
    print("Você ganhou")
    return 1
  else:
    print("Computador ganhou")
    return 0
    
def campeonato():
  usuario = 0
  computador = 0
  for _ in range(3):
    vencedor = partida()
    
    if vencedor == 1:
      usuario = usuario + 1
    else:
      computador = computador + 1
  print ("Placar final: você {} x {} Computador".format(usuario, computador))
  
tipo_jogo = 0

while tipo_jogo == 0:
  print("Escolha a opção")
  print("1 - Jogar partida")
  print("2 - Jogar campeonato")
  tipo_jogo=int(input("Sua opção: "))
  
  if tipo_jogo == 1:
    print("Partida isolada")
    partida()
    break
  elif tipo_jogo == 2:
    print("Campeonato")
    campeonato()
  else:
    print("Opçao invalida")
    tipo_jogo = 0
