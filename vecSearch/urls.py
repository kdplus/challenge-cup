from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'similar$', views.similar, name='similar'),
    url(r'query$', views.query, name='query'),
    url(r'display', views.display, name='display'),
    url(r'label', views.label, name='label'),
]