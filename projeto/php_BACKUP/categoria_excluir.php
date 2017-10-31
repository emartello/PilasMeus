<?php

	$id = $_GET['id'];

	require "conexao.php";

	$sql = "delete from categoria where idcategoria = :id";
	$query = $banco->prepare($sql);
	$query->bindParam(':id', $id, PDO::PARAM_STR);
	$query->execute();

	echo $query->rowCount();
	
?>


