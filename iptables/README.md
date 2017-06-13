### Tabelas
São os locais usados para armazenar as chais e conjunto de regras. As tabelas podem ser diferenciadas com a opção -t [tabela]

**Tabela FILTER:** possui cadeias INPUT, OUTPUT, FORWARD.

**Tabela NAT:** possui cadeias PREROUTING, OUTPUT, POSTROUTING.

**Tabela MANGLE:** possui cadeias PREROUTING, OUTPUT, POSTROUTING, INPUT, FORWARD.

**Tabela RAW:** possui cadeias PREROUTING, OUTPUT.

### Chains
Locais onde as regras são armazenadas para operação do firewall:

**INPUT**: Aplica regra aos pacotes que chegam ao servidor.

**OUTPUT**: Aplica regra aos pacotes de rede originados e que partem do servidor.

**FORWARD**: Aplica regra aos pacotes de rede roteados através do servidor (para outro servidor ou outra interface do mesmo servidor).

**PREROUTING**: Altera os pacotes de rede na hora que chegam e antes do roteamento.

**POSTROUTING**: Altera pacotes de rede após o roteamento. Usado para SNAT.

### Políticas. ações (targets)

**ACCEPT**: pacote permitido

**DROP**: descartar o pacote

**QUEUE**: enviar o pacote ao userspace (Código fora do kernel)
**RETURN**: descontinuar o processamento do pacote e aplicar a regra padrao a ele
**REJECT**: Descarta o pacote e envia feedback ao remetente
**DNAT**: Reescreve endereço de destino (NAT)
**SNAT**: Reescreve endereço de origem (NAT)
**LOG**: coloca no log informações sobre o pacte

Estrutura do comando:
Comando principal:

iptables subcomando chain parametro1 valor1 parametron valorn ação
Subcomandos:

-A cadeia – anexa a regra ao final da cadeia
-L [cadeia] lista as regras da cadeia, ou todas caso a cadeia nao seja especificada
-F [cadeia] apaga todas as regras na cadeia
-N cadeia – Lista todas as regras na cadeia
-P cadeia politica – configura a regra padrão da cadeia
-D cadeia linha – apaga uma regra em um posição na cadeia
-X [cadeia] excluiu uma cadeia vazia
-I cadeia linha – insere uma regra em uma posição na cadeia
-Z zera os contadores para todas as cadeias
Parametros, alguns:

-t tabela (filter é a padrao)
-j ação
-p protocolo (especifica o protocolo, icmp, tcp, udp, all)
-s IP (IP de origem do pacote)
-d IP (IP de destino do pacte)
-i interface (nome da interface de rede de entrada do pacote)
-o interface (nome da interface de rede de saida do pacote)
–sport portas (Portas de origem)
–dport portas (Portas de destino)
–syn (identifica nova requisição de conexao)
–icmp-type (tipo de mensagem icmp)
Checagem de estado dos pacotes (state match):

-m state –state OPCAO
NEW cria uma nova conexao
ESTABLISHED pacote que pertence a uma conexao existente
RELATED pacote relacionado mas que nao faz parte de uma conexao existente
INVALID pacote nao pode ser identificado (ex. falta memoria, erro ICMP de conexao nao conhecida)
Extensões:

Extensao TCP
–tcp-flags (ALL, SYN, ACK, FIN, etc)
–source-port ou –sport
–destination-port ou –dport

Extensao UDP
Mesmas opções do TCP

Extensao ICMP
–icmp-type

Outras extensoes
-m limit quando usado em LOG serve para limitar o numero de pacotes escritos durante um certo ponto
–limit valor
Arquivos de logs criados pelo iptables:

Todo tráfego que for registrado pelo iptables é registrado por padrão no arquivo /var/log/kern.log.
