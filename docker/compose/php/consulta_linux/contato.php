<?php
// Verifica se existe a variável txtnome
if (isset($_GET["txtnome"])) {
    $nome = $_GET["txtnome"];
    $palavra = explode(" ", $nome);

    // Conexao com o banco de dados
    $server = "localhost";
    $user = "root";
    $senha = "";
    $base = "catalogo";
    $conexao = mysql_connect($server, $user, $senha) or die("Erro na conexão!");
    mysql_select_db($base);
    // Verifica se a variável está vazia
    if (empty($nome)) {
        $sql = "SELECT * FROM produtos";
    } else {
    	// Salva o que foi buscado em uma variável
	$busca = $_GET['txtnome'];
	$array=explode(" ",$busca);
//echo $teste = "+$array[0]* +$array[1]*";
	$n_palavras=count($array);
// Usa a função mysql_real_escape_string() para evitar erros no MySQL
	$busca = mysql_real_escape_string($busca);
        //$nome .= "%";
        $sql = "SELECT * FROM produtos WHERE MATCH (codigo,produto,descricao,codigo_original,codigo_paralelo) AGAINST ('+$array[0]* +$array[1]* +$array[2]* +$array[3]* +$array[4]*' IN BOOLEAN MODE) ORDER BY produto,descricao ASC";
    }

    $result = mysql_query($sql);
    $cont = mysql_affected_rows($conexao);
    // Verifica se a consulta retornou linhas
    if ($cont > 0) {
        // Atribui o código HTML para montar uma tabela
        $tabela = "<table class='table table-striped table-condensed'>
                    <thead>
                        <tr>
                            <th>NOME</th>
                            <th>TELEFONE</th>
                            <th>CELULAR</th>
                            <th>CODGO</th>
                           <th>EMAIL</th>
                        </tr>
                    </thead>
                    <tbody class=searchable>
                    <tr>";
        $return = "$tabela";
        // Captura os dados da consulta e inseri na tabela HTML
        while ($linha = mysql_fetch_array($result)) {
            $return.= "<td>" . utf8_encode($linha["id"]) . "</td>";
            $return.= "<td>" . utf8_encode($linha["produto"]) . "</td>";
            $return.= "<td>" . utf8_encode($linha["descricao"]) . "</td>";
            $return.= "<td>" . utf8_encode($linha["codigo_paralelo"]) . "</td>";
            $return.= "<td>" . utf8_encode($linha["preco"]) . "</td>";
            $return.= "</tr>";
        }
        echo $return.="</tbody></table>";
    } else {
        // Se a consulta não retornar nenhum valor, exibi mensagem para o usuário
        echo "Não foram encontrados registros!";
    }
}
?>
