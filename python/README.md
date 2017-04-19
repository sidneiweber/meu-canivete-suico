# Um pouco sobre Python

## Tipos de dados
| Tipo          | Valores       | 
| ------------- |:-------------:|
| Numérico      | int, float,long|
| String        | str           |
| Booleanos     | bool (True, False)|
| Dicionários   | dict          |
| Arquivos      | file          |

## Operadores booleanos
### Operadores relacionais
== != > >= < <= is is not
-- Sempre retornam um bool
### Operadores lógicos
and or
not

## Entrada de dados
```python
name=input("What is your name?")
print(name)
```

## Identação
O código precisa estar identado de forma correta, se usar tab use sempre tab, caso use espaço uso sempre espaço
Errado
```python
def spam():
eggs = 12
return eggs
print(spam())
```
Correto
```python
def spam():
    eggs = 12
    return eggs

print(spam())
```

## Escrita, string
**len()**	mostra o tamanho da string

**lower()**	caixa baixa

**upper()**	caixa alta

**str()**	converte em string

**isalpha()**	retorna False se a string contiver algum caracter que não seja letras

Acessando pelo index

```python
"python"[0] # 'p'
"python"[1] # 'y'
"python"[2] # 't'
"python"[3] # 'h'
"python"[4] # 'o'
"python"[5] # 'n'
```
```python
# Até numero tal
"python"[:5] # 'pytho'
# Mesmo que:
"python"[0:5] # 'pytho'
# A partir do numero tal
"python"[2:] # 'thon'
```

## Matemática
max(5, 6, 7) # 7

min(5, 6, 7) # 5

sorted(s)	devolve uma lista com itens de s em ordem ascendente

reversed(s)	retorna um iterador para percorrer os elementos do último ao primeiro

### Operadores
+ Soma
- Subtração
* Multiplicação
/ Divisão
(*.*) Potenciação
% Resto da divisão
// Divisão inteira


## Controle de fluxo (condicionais)
```python
if expressao == True:
    print("true")
else:
    print("false")
```
```python
if answer > 5:
    return 1
elif answer < 5:
    return -1
else:
    return 0
```
## Repetição
```python
count = 0
while count <= 5:
    print(count)
    count += 1
# 0 1 2 3 4 5
```

## Variáveis
Variável tem que estar declarada para poder ser usada
```python
reais = euros * taxa
As variáveis euros e taxa devem ser inicializadas, se não o erro name 'euros' is not defined.
```

Declarar variavel como nula, None corresponde a null
```python
reais = None
```
Passar variavel dentro de uma string
```python
nome = "Sidnei"
sobrenome = "Weber"
print("Let's not go to %s. 'Tis a silly %s." % (nome, sobrenome))
# Ou
print ("Lets no to go", nome, "tis a silly", sobrenome)
```
Tipos de conversão mais comuns:
%s, %f, %d: string, float, inteiro decimal

## Função
```python
def funcao():
    return "Escrita da funcao"

print(funcao())
###
def soma (x, y):
  return x + y
  
def menos (x, y):
  return x - y
  
#print(soma(1, 5))
n1=int(input("Digite o 1 valor: "))
n2=int(input("Digite o 2 valor: "))

print("Soma dos valores: ", soma(n1, n2))
```
## Lista
```python
animais = ["pangolin", "cassowary", "sloth", "dog"];
animais[0]   # 'pangolin'
animais[1]   # 'cassowary'
animais[2]   # 'sloth'
animais[3]   # 'dog'
len(animais) # 4
