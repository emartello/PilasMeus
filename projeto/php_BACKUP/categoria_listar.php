<?php

	require "conexao.php";

	$sql = "select * from categoria order by nome";
	$query = $banco->prepare($sql);
	$query->execute();
	$dados = $query->fetchAll(PDO::FETCH_OBJ);
	echo json_encode($dados);

?>

