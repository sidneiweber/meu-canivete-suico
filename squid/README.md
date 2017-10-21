### Squid autenticando no ldap
-----
Squid com autenticação no servidor LDAP e log em formato mais legível para "diretoria", caso ela queira ver o que está sendo acessado.

### Entendendo opções de configurações
Entendendo configuração:<br>
http_port 3128: Define em qual porta o Squid vai atuar, a porta default é a 3128, mas podemos definir qualquer outra porta.<br>
visible_hostname SERVIDOR: Define o nome do servidor, lembre-se de substituir o “KORZOS” pelo nome do seu servidor.<br>
acl all src 0.0.0.0/0.0.0.0: Esta linha cria uma ACL, uma política de acesso com nome “all” contendo qualquer IP.<br>
acl localhost src 127.0.0.1/255.255.255.255: Aqui criamos uma ACL de nome “localhost” contendo localhost.<br>
acl SSL_ports port 443 563: Cria a ACL contendo as portas que são utilizadas no protocolo HTTPS.<br>
acl Safe_ports port 21 80 443 563 70 210 280 488 59 777 901 1025-65535: Cria a ACL contendo as portas de diversos protocolos conhecidos na Internet.<br>
acl manager proto cache_object: Cria a ACL manager do tipo proto.<br>
acl purge method PURGE : Cria a ACL manager do tipo method.<br>
acl CONNECT method CONNECT: Cria a ACL CONNECT também do tipo method.<br>
http_access allow manager localhost: Libera a ACL manager e localhost.<br>
http_access deny manager : Bloqueia a ACL manager.<br>
http_access allow purge localhost: Libera a ACL purge e localhost.<br>
http_access deny purge: Bloqueia a ACL purge.<br>
http_access deny !Safe_ports: Esta linha se torna bastante interessante pelo uso da “!”, pois ela bloqueia qualquer conexão que não contenha o conteúdo da ACL Safe_Ports.<br>
http_access deny CONNECT !SSL_ports: Bloqueia qualquer conexão que não esteja no conteúdo da ACL SSL_ports.<br>
acl redelocal src 192.168.0.0/24: Cria a ACL redelocal contendo a faixa de endereço da rede.<br>
http_access allow localhost: Libera a ACL localhost.<br>
http_access allow redelocal: Libera a ACL redelocal.<br>
http_access deny all: Bloqueia a ACL all.<br>

### Códigos Squid
COD  DESCRIÇÃO

  0    Resposta não recebida

Respostas de informação:

  100  Continue<br>
  101  Troca de protocolos

Acessos bem-sucedidos:

  200  OK<br>
  201  Criado<br>
  202  Aceito<br>
  203  Informação não autorizada<br>
  204  Sem conteúdo<br>
  205  Conteúdo apagado<br>
  206  Conteúdo parcial<br>
  207  Status múltiplos<br>

Redirecionamentos:

  300  Escolhas múltiplas<br>
  301  Movido permanentemente<br>
  302  Movido temporariamente<br>
  303  Veja outros<br>
  304  Não modificado<br>
  305  Use o proxy<br>
  307  Redirecionamento temporário<br>

Erros no cliente:

  400  Resposta ruim<br>
  401  Não autorizado<br>
  402  Pagamento requisitado<br>
  403  Negado<br>
  404  Não encontrado<br>
  405  Método não aceito<br>
  406  Não aceito<br>
  407  Autenticação do proxy solicitado<br>
  408  Tempo de resposta excedido<br>
  409  Conflito<br>
  410  Feito<br>
  411  Tamanho requerido<br>
  412  Falha pré-condicional<br>
  413  Requisição de entrada extensa<br>
  414  URL requisitada muito extensa<br>
  415  Tipo de mídia não suportada<br>
  416  Faixa requisitada não satisfatória<br>
  417  Falha na espera<br>

Erros no servidor:

  500  Erro interno<br>
  501  Não implantado<br>
  502  Gateway incorreto<br>
  503  Serviço indisponível<br>
  504  Tempo excedido do gateway<br>
  505  Versão HTTP não suportada<br>
  507  Espaço em disco insuficiente<br>
