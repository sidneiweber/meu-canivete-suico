### Instalando servidor DHCP

Resumidamente, o DHCP opera da seguinte forma:

    Um cliente envia um pacote UDP em broadcast (destinado a todas as máquinas) com uma requisição DHCP (para a porta 67);
    Os servidores DHCP que capturarem este pacote irão responder (se o cliente se enquadrar numa série de critérios — ver abaixo) para a porta 68 do Host solicitante com um pacote com configurações onde constará, pelo menos, um endereço IP, uma máscara de rede e outros dados opcionais, como o gateway, servidores de DNS, etc…

Instalação:

Iremos fazer a instalação do nosso servidor no Debian. Para tal operação iremos instalar o pacote isc-dhcp-server, que substituiu o pacote dhcp-server3.
apt-get install isc-dhcp-server

Configurando:

Primeiramente editaremos o arquivo: /etc/default/isc-dhcp-server e colocaremos a placa de rede interna na configuração:
# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp0s8"

A configuração básica para o funcionamento é tão simples quanto a instalação. Editaremos o arquivo /etc/dhcp/dhcpd.conf. Acrescentaremos as opções básicas para o funcionamento.
subnet 10.0.0.0 netmask 255.255.255.0 {
        range 10.0.0.100 10.0.0.120;
        option routers 10.0.0.1;
        option domain-name-servers 8.8.8.8;
        option broadcast-address 10.0.0.255;
}

Explicando:

Subnet: Iniciaremos uma sub-rede para ceder IP’s.
Range: A faixa de IP’s que será distribuida.
Option Routers: Configura a rota padrão.
Option domain-name-servers: Configura os servidores DNS.Option broadcast-address: Indica o fim da sub-rede.

Alguns outros parâmetros básicos que já vem no arquivo por padrão:

Option domain-name: domínio.

Default-lease-time: Tempo que o servidor verifica se o IP ainda está em uso.

Max-lease-time: Tempo máximo de um IP.

Agora é só salvar o arquivo que editamos e reiniciar o serviço:
/etc/init.d/isc-dhcp-server restart