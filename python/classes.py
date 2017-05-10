class Carro:
    def __init__(self, m, a, c):
        self.modelo = m
        self.ano    = a
        self.cor    = c

brasilia = Carro('Brasilia', 1968, 'amarela')
fusca = Carro('Fusca', 1981, 'preto')

fusca.ano += 10   # observe que podemos acessar atributos de fusca
print(fusca.ano)
print(fusca.modelo, fusca.cor, fusca.ano)

##############################

def main():
    pri = Carro('brasilia', 1968, 'amarela', 80)
    seg = Carro('fuscao', 1981, 'preto', 95)

    Carro.acelere(pri, 40)
    Carro.acelere(seg, 50)
    Carro.acelere(pri, 80)
    Carro.pare(pri)
    Carro.acelere(seg, 100)

class Carro:
    def __init__(self, m, a, c, vm):
        self.modelo = m
        self.ano    = a
        self.cor    = c
        self.vel    = 0
        self.maxV   = vm  # velocidade maxima

    def imprima(self):
        if self.vel == 0: # parado da para ver o ano
            print( "%s %s %d"%(self.modelo, self.cor, self.ano)     )
        elif self.vel < self.maxV:
            print( "%s %s indo a %d Km/h"%(self.modelo, self.cor, self.vel) )
        else:
            print( "%s %s indo muito raaaaaapiiiiiiiidoooooo!"%(self.modelo, self.cor))

    def acelere(self, v):
        self.vel = v
        if self.vel > self.maxV:
            self.vel = self.maxV
        Carro.imprima(self)

    def pare(self):
        self.vel = 0
        Carro.imprima(self)

main()

###### MESMA CLASSE ANTERIOR MAIS ENUXTA
def main():
    pri = Carro('brasilia', 1968, 'amarela', 80)
    seg = Carro('fuscao', 1981, 'preto', 95)

    pri.acelere(40)
    seg.acelere(50)
    pri.acelere(80)
    pri.pare()
    seg.acelere(100)

class Carro:
    def __init__(self, m, a, c, vm):
        self.modelo = m
        self.ano    = a
        self.cor    = c
        self.vel    = 0
        self.maxV   = vm  # velocidade maxima

    def imprima(self):
        if self.vel == 0: # parado da para ver o ano
            print( "%s %s %d"%(self.modelo, self.cor, self.ano)     )
        elif self.vel < self.maxV:
            print( "%s %s indo a %d Km/h"%(self.modelo, self.cor, self.vel) )
        else:
            print( "%s %s indo muito raaaaaapiiiiiiiidoooooo!"%(self.modelo, self.cor))

    def acelere(self, v):
        self.vel = v
        if self.vel > self.maxV:
            self.vel = self.maxV
        self.imprima()

    def pare(self):
        self.vel = 0
        self.imprima()

main()

############## MESMA QUE ANTERIOR COM A FUNCAO __STRING__

def main():
    pri = Carro('brasilia', 1968, 'amarela', 80)
    seg = Carro('fuscao', 1981, 'preto', 95)

    print(pri)
    print(seg)

    pri.acelere(40)
    seg.acelere(50)
    pri.acelere(80)
    pri.pare()
    seg.acelere(100)

class Carro:
    def __init__(self, m, a, c, vm):
        self.modelo = m
        self.ano    = a
        self.cor    = c
        self.vel    = 0
        self.maxV   = vm  # velocidade maxima

    def __str__(self):
        if self.vel == 0: # parado da para ver o ano
            s = "%s %s %d"%(self.modelo, self.cor, self.ano)
        elif self.vel < self.maxV:
            s = "%s %s indo a %d Km/h"%(self.modelo, self.cor, self.vel)
        else:
            s = "%s %s indo muito raaaaaapiiiiiiiidoooooo!"%(self.modelo, self.cor)
        return s

    def acelere(self, v):
        self.vel = v
        if self.vel > self.maxV:
            self.vel = self.maxV
        print(self)

    def pare(self):
        self.vel = 0
        print(self)

main()
