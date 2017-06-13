<?php
$server = "localhost";
    $user = "root";
    $senha = "bolacha";
    $base = "catalogo";
    $conexao = mysql_connect($server, $user, $senha) or die("Erro na conexão!");
    mysql_select_db($base);




//$t=cabo;
//$palavra = explode(" ", $t);
$c=count($palavra);

for($i=0; $i<=$c; $i++) {

$q= mysql_query("SELECT * FROM tabela WHERE coluna LIKE '%$palavra[$i]%'");
}

while($m=mysql_fetch_array($q)) {
echo $m['objeto'];
}

