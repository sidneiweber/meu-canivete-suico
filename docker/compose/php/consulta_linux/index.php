<?php
require 'ShoppingCart/ShoppingCart.php';
$shoppingCart = new \ShoppingCart\ShoppingCart();

$shoppingCart = new \ShoppingCart\ShoppingCart();

$shoppingCart->add(15);		// Item ID
$shoppingCart->add(58, 3);	// Item ID, Amount
$shoppingCart->add(15, 5);

foreach ($shoppingCart->items() as $item) {
	# $item['id']
	# $item['amount']
}

?>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<title></title>

</head>

<body>

<script type="text/javascript" src="ajax.js"></script>

<div id="Container">

<h1>Agenda de Contatos utilizando AJAX</h1>

<hr/>

<h2>Pesquisar Contato:</h2>

<div id="Pesquisar">

Infome o nome:

<input type="text"  name="txtnome" onclick="this.select()" id="txtnome" style="text-transform:uppercase;"/>
<input type="button" name="btnPesquisar" value="Pesquisar" onclick="getDados();"/>
<br>
Pesquise o comando: <input id="filter" type="text" placeholder="Pesquisa Aqui...">

</div>

<hr/>

<h2>Resultados da pesquisa:</h2>


<div id="Resultado"></div>

<hr>

</div>
<script src="jquery-1.10.2.js"></script>
<script>
$(document).ready(function () {

  (function ($) {

    $('#filter').keyup(function () {

      var rex = new RegExp($(this).val(), 'i');
      $('.searchable tr').hide();
      $('.searchable tr').filter(function () {
        return rex.test($(this).text());
      }).show();

    })

  }(jQuery));

});
</script>
</body>

</html>

