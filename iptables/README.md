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
