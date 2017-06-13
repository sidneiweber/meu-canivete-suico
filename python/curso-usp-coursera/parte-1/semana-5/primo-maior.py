def maior_primo(x):
    contador=1
    primo_maior=1
    while (contador <= x):
        if ((contador%2) == 1) and ((contador%3) != 0): 
          primo_maior=contador
        #print(contador_primos)
        if x == 3:
          primo_maior=3
        contador=contador+1
    return(primo_maior)
