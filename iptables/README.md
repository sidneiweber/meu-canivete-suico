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

-A cadeia – anexa a regra ao final da cadeia<br>
-L [cadeia] lista as regras da cadeia, ou todas caso a cadeia nao seja especificada<br>
-F [cadeia] apaga todas as regras na cadeia<br>
-N cadeia – Lista todas as regras na cadeia<br>
-P cadeia politica – configura a regra padrão da cadeia<br>
-D cadeia linha – apaga uma regra em um posição na cadeia<br>
-X [cadeia] excluiu uma cadeia vazia<br>
-I cadeia linha – insere uma regra em uma posição na cadeia<br>
-Z zera os contadores para todas as cadeias<br>
Parametros, alguns:

-t tabela (filter é a padrao)<br>
-j ação<br>
-p protocolo (especifica o protocolo, icmp, tcp, udp, all)<br>
-s IP (IP de origem do pacote)<br>
-d IP (IP de destino do pacte)<br>
-i interface (nome da interface de rede de entrada do pacote)<br>
-o interface (nome da interface de rede de saida do pacote)<br>
–sport portas (Portas de origem)<br>
–dport portas (Portas de destino)<br>
–syn (identifica nova requisição de conexao)<br>
–icmp-type (tipo de mensagem icmp)<br>
Checagem de estado dos pacotes (state match):

-m state –state OPCAO<br>
NEW cria uma nova conexao<br>
ESTABLISHED pacote que pertence a uma conexao existente<br>
RELATED pacote relacionado mas que nao faz parte de uma conexao existente<br>
INVALID pacote nao pode ser identificado (ex. falta memoria, erro ICMP de conexao nao conhecida)<br>
Extensões:

Extensao TCP<br>
–tcp-flags (ALL, SYN, ACK, FIN, etc)<br>
–source-port ou –sport<br>
–destination-port ou –dport<br>

Extensao UDP<br>
Mesmas opções do TCP

Extensao ICMP<br>
–icmp-type

Outras extensoes<br>
-m limit quando usado em LOG serve para limitar o numero de pacotes escritos durante um certo ponto<br>
–limit valor<br>
Arquivos de logs criados pelo iptables:

Todo tráfego que for registrado pelo iptables é registrado por padrão no arquivo /var/log/kern.log.
