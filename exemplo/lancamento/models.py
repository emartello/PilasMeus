from django.conf import settings
from django.db import models
from django.utils.timezone import datetime

class Lancamento(models.Model):
    idlancamento = models.AutoField(primary_key = True)
    data = models.DateTimeField(default=datetime.now, blank=False) 
    tipo = models.IntegerField(blank=False)
    descricao = models.CharField(max_length=100, blank=False)
    valor = models.FloatField(blank=False)
    idcategoria = models.ForeignKey('Categoria', on_delete= models. CASCADE, blank=False)

class Categoria(models.Model):
    idcategoria = models.AutoField(primary_key = True, null=False)
    nome = models.CharField(max_length=100)