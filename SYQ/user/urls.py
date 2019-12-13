from django.conf.urls import url

from . import views

urlpatterns = [
    # url(r'^$',views.user_view),
    url(r'^login$', views.login_view),
    url(r'^register$', views.regiester_view),
    url(r'^(?P<username>\w{1,11})/$', views.user_center),
    url(r'^add_album$', views.add_album_view),
    url(r'^relation$', views.relation_view),
    url(r'^islogin$', views.is_login),
    url(r'^weibo/url$', views.users_weibo_url),
    url(r'^weibo/token$', views.users_weibo_token),
    url(r'^relation/my_relation$', views.my_relation),
]
