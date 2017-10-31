from rest_framework.routers import DefaultRouter
from . import views
from django.conf.urls import url, include

Router = DefaultRouter()
Router.register(r'Lancamentos', views.LancamentoViewSet)
Router.register(r'Categorias', views.CategoriaViewSet)

