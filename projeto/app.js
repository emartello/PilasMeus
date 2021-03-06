var app = angular.module('Projeto', ['ngRoute']);

app.config( function($routeProvider){

	$routeProvider
		.when('/home', {controller: 'home', templateUrl: 'views/home.html'})
		.when('/receita', {controller: 'receita', templateUrl: 'views/receita.html'})
		.when('/despesa', {controller: 'despesa', templateUrl: 'views/despesa.html'})
		.when('/categoria', {controller: 'categoria', templateUrl: 'views/categoria.html'})
		.otherwise({ redirectTo: '/home' });
} );

app.controller('home', home);
app.controller('receita', receita);
app.controller('despesa', despesa);
app.controller('categoria', categoria);

function home($scope, $http) {
	$scope.lancamentos = {};

	$scope.sumreceita=0;
	$scope.sumdespesa=0;

	$scope.listar = function(){
		$http
			.get('http://localhost:8000/api/Lancamentos/')
			.success(function(pacote){
				$scope.lancamentos = pacote;
				$scope.sumreceita=0;
				$scope.sumdespesa=0;
			
				pacote.filter(x => x.tipo == 0).map(x => $scope.sumreceita+= x.valor );
				pacote.filter(x => x.tipo == 1).map(x => $scope.sumdespesa+= x.valor );
			});
	}

	$scope.excluir = function(id){
		if (confirm('Deseja excluir o lancamento ('+ id +') agora?'))
			$http
				.delete('http://localhost:8000/api/Lancamentos/'+id)
				.success( function(retorno){
					$scope.listar();
				} );


	}	

	$scope.listar();	
}

function receita($scope, $http, $location) {
	$scope.categorias = {};
	$scope.lancamento = {
		tipo: 0,
		descricao: '',
		valor: 0,
		idcategoria: 0
	};

	$scope.salvar = function(){
		console.log($scope.lancamento);
		$http
			.post('http://localhost:8000/api/Lancamentos/', $scope.lancamento)
			.success( function(retorno){ 
				$location.path('/home'); 
			} );

	}

	$scope.listar = function(){
		$http
			.get('http://127.0.0.1:8000/api/Categorias/')
			.success(function(pacote){
				$scope.categorias = pacote;
				console.log($scope.categorias);
			});
	}


	$scope.listar();
}

function despesa($scope, $http, $location) {

	$scope.categorias = {};
	$scope.lancamento = {
		tipo: 1,
		descricao: '',
		valor: 0,
		idcategoria: 0
	};

	$scope.salvar = function(){
		console.log($scope.lancamento);
		$http
			.post('http://localhost:8000/api/Lancamentos/', $scope.lancamento)
			.success( function(retorno){ 
				$location.path('/home'); 
			} );

	}

	$scope.listar = function(){
		$http
			.get('http://127.0.0.1:8000/api/Categorias/')
			.success(function(pacote){
				$scope.categorias = pacote;
				console.log($scope.categorias);
			});
	}


	$scope.listar();
	
}

function categoria($scope, $http, $location) {

	$scope.categorias = {};
	$scope.categoria = {
		nome: ''
	};

	$scope.salvar = function(){
		console.log($scope.categoria);
		$http
			.post('http://127.0.0.1:8000/api/Categorias/', $scope.categoria)
			.success( function(retorno){ 
				$scope.categoria.nome = '';
				$scope.listar();
			} );

	}

	$scope.excluir = function(id){
		if (confirm('Deseja excluir a categoria ('+ id +') agora?'))
			$http
				.delete('http://127.0.0.1:8000/api/Categorias/'+id)
				.success( function(retorno){
					$scope.listar();
				} );


	}

	$scope.listar = function(){
		$http
			.get('http://127.0.0.1:8000/api/Categorias/')
			.success(function(pacote){
				$scope.categorias = pacote;
				console.log($scope.categorias);
			});
	}

	$scope.listar();
	
}
