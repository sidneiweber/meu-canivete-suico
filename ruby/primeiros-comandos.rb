# Escrevendo uma mensagem
puts "Ola Mundo"
"Olá mundo"
"Ola mundo".reverse # inverte palavras
"ola mundo".length # Conta caracteres
"ola mundo" * 5 # Repete 5 vezes o ola mundo

poem = "TExtao ta porra mas tem a palavra toast, sim toast "
print poem # Imprime poema que estava no exercicio
poem['toast']='honeydew' # Substitui a palavra toast por honeydew dentro da variavel poem
print poem

# Fazendo contas
3.5 + 5
5 * 5
3 ** 2 # potencia
Math.sqrt(9) # Raiz quadrada, retorna numero flutuante
# Math é um módulo nativo para funções matemáticas
# sqrt é um diminutivo de raiz quadrada em ingles "square root"

# Variaveis
a = 3 ** 2
b = 4 + 2
c = a+b
puts a
puts b
puts c

#40.reverse # Não converte pois não e string
40.to_s.reverse # Converte para string e apos isso inverte
# o_s converte valor para strings.
# to_i converte valor para inteiro (numbers.)
# to_a converte valor para array.

# Array
[] # Array vazia
[12, 25, 37] # Array com numeros
[12, 25, 37].max # Retorna o valor maior
# Salvar array em uma variavel
variavel=[12, 35, 19]
puts variavel.sort # Ordena do menor pro maior


# Criar metodo
def olamundo
puts "Olá Mundo!"
end
# Exibir metodo
olamundo
olamundo()

# Metodo com implementação
def olamundo(nome)
  puts "Olá #{nome}!"
end

olamundo("Matz")
olamundo "Tinoco"

# Para implementar metodo padrao, se nao for passado nada no nome, substitui por "Mundo"
def olamundo2(nome = "Mundo")
  puts "Olá #{nome}!"
end

olamundo2("Matz")

#Evoluindo para um Anfitrião
#E se quisermos criar um verdadeiro anfitrião, um que se lembre do nosso nome, nos dê as boas vindas e nos trate com o devido respeito? Podemos usar um objeto para isso. Então vamos criar a classe “Anfitrião”.

class Anfitriao
  def initialize(nome = "Mundo")
    @nome = nome
  end
  def diz_ola
    puts "Olá #{@nome}!"
  end
  def diz_adeus
    puts "Adeus #{@nome}, volte sempre."
  end
  end
