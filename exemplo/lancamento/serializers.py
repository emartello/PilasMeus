import datetime
from rest_framework import serializers
from .models import *

class LancamentoSerializer(serializers.ModelSerializer):
	
	class Meta:
		model = Lancamento
		fields = ('idlancamento', 'data', 'tipo', 'descricao','valor','idcategoria')

class CategoriaSerializer(serializers.ModelSerializer):
	class Meta:
		model = Categoria
		fields = ('idcategoria', 'nome')


#Geracao dos JSON, e criacaoo dos vinculos para tal tarefa