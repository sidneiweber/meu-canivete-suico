### Squid autenticando no ldap
-----
Squid com autenticação no servidor LDAP e log em formato mais legível para "diretoria", caso ela queira ver o que está sendo acessado.

### Entendendo opções de configurações
Entendendo configuração:
http_port 3128: Define em qual porta o Squid vai atuar, a porta default é a 3128, mas podemos definir qualquer outra porta.
visible_hostname SERVIDOR: Define o nome do servidor, lembre-se de substituir o “KORZOS” pelo nome do seu servidor.
acl all src 0.0.0.0/0.0.0.0: Esta linha cria uma ACL, uma política de acesso com nome “all” contendo qualquer IP.
acl localhost src 127.0.0.1/255.255.255.255: Aqui criamos uma ACL de nome “localhost” contendo localhost.
acl SSL_ports port 443 563: Cria a ACL contendo as portas que são utilizadas no protocolo HTTPS.
acl Safe_ports port 21 80 443 563 70 210 280 488 59 777 901 1025-65535: Cria a ACL contendo as portas de diversos protocolos conhecidos na Internet.
acl manager proto cache_object: Cria a ACL manager do tipo proto.
acl purge method PURGE : Cria a ACL manager do tipo method.
acl CONNECT method CONNECT: Cria a ACL CONNECT também do tipo method.
http_access allow manager localhost: Libera a ACL manager e localhost.
http_access deny manager : Bloqueia a ACL manager.
http_access allow purge localhost: Libera a ACL purge e localhost
http_access deny purge: Bloqueia a ACL purge.
http_access deny !Safe_ports: Esta linha se torna bastante interessante pelo uso da “!”, pois ela bloqueia qualquer conexão que não contenha o conteúdo da ACL Safe_Ports.
http_access deny CONNECT !SSL_ports: Bloqueia qualquer conexão que não esteja no conteúdo da ACL SSL_ports.
acl redelocal src 192.168.0.0/24: Cria a ACL redelocal contendo a faixa de endereço da rede.
http_access allow localhost: Libera a ACL localhost.
http_access allow redelocal: Libera a ACL redelocal.
http_access deny all: Bloqueia a ACL all

### Códigos Squid
COD  DESCRIÇÃO

  0    Resposta não recebida

Respostas de informação:

  100  Continue
  101  Troca de protocolos

Acessos bem-sucedidos:

  200  OK
  201  Criado
  202  Aceito
  203  Informação não autorizada
  204  Sem conteúdo
  205  Conteúdo apagado
  206  Conteúdo parcial
  207  Status múltiplos

Redirecionamentos:

  300  Escolhas múltiplas
  301  Movido permanentemente
  302  Movido temporariamente
  303  Veja outros
  304  Não modificado
  305  Use o proxy
  307  Redirecionamento temporário

Erros no cliente:

  400  Resposta ruim
  401  Não autorizado
  402  Pagamento requisitado
  403  Negado
  404  Não encontrado
  405  Método não aceito
  406  Não aceito
  407  Autenticação do proxy solicitado
  408  Tempo de resposta excedido
  409  Conflito
  410  Feito
  411  Tamanho requerido
  412  Falha pré-condicional
  413  Requisição de entrada extensa
  414  URL requisitada muito extensa
  415  Tipo de mídia não suportada
  416  Faixa requisitada não satisfatória
  417  Falha na espera

Erros no servidor:

  500  Erro interno
  501  Não implantado
  502  Gateway incorreto
  503  Serviço indisponível
  504  Tempo excedido do gateway
  505  Versão HTTP não suportada
  507  Espaço em disco insuficiente
