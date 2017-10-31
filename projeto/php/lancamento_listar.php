<?php

	require "conexao.php";

	$sql = "select lancamento.*, categoria.nome 
	        from lancamento 
	        join categoria on lancamento.idcategoria = categoria.idcategoria
	        order by data desc";

	$query = $banco->prepare($sql);
	$query->execute();
	$dados = $query->fetchAll(PDO::FETCH_OBJ);
	echo json_encode($dados);

?>

