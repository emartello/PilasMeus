<?php

	$dados = json_decode(file_get_contents("php://input"));

	require "conexao.php";

	$sql = "insert into lancamento (tipo, descricao, valor, idcategoria) 
	                    values (:tipo, :descricao, :valor, :idcategoria)";

	$query = $banco->prepare($sql);
	$query->bindParam(':tipo',        $dados->tipo,        PDO::PARAM_STR);
	$query->bindParam(':descricao',   $dados->descricao,   PDO::PARAM_STR);
	$query->bindParam(':valor',       $dados->valor,       PDO::PARAM_STR);
	$query->bindParam(':idcategoria', $dados->idcategoria, PDO::PARAM_STR);
	$query->execute();

	echo $query->rowCount();
	
?>


