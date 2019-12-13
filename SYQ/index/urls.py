from django.conf.urls import url

from index import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'^hotalbums$',views.hot_albums),
    url(r'^search$',views.search_view)
]
