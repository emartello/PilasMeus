<?php

	$dados = json_decode(file_get_contents("php://input"));

	require "conexao.php";

	$sql = "insert into categoria (nome) 
	                    values (:nome)";

	$query = $banco->prepare($sql);
	$query->bindParam(':nome', $dados->nome, PDO::PARAM_STR);
	$query->execute();

	echo $query->rowCount();
	
?>


