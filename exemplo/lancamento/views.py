from rest_framework import viewsets
from .models import *
from .serializers import *

class LancamentoViewSet(viewsets.ModelViewSet):
	queryset = Lancamento.objects.all()
	serializer_class = LancamentoSerializer

class CategoriaViewSet(viewsets.ModelViewSet):
	queryset = Categoria.objects.all()
	serializer_class = CategoriaSerializer