from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'index', views.index, name='index'),
    url(r'similar$', views.similar, name='similar'),
    url(r'query/', views.query, name='query'),
    url(r'display', views.display, name='display'),
    url(r'search', views.label, name='label'),
    url(r'people', views.people, name='people'),
    url(r'introduction', views.introduction, name='introduction'),
]