from django.conf.urls import url

from albums import views

urlpatterns = [
    # 相册内容
    url(r'^album(?P<id>\d+)$', views.album_view),
    # 添加图片
    url(r'^album(?P<album>\w{1,11})/add_picture$', views.add_picture),
    # 相册主页
    url(r'^$', views.albums_view),
    # 获取相册
    url(r'^(?P<username>\w{1,11})$', views.get_albums),
    # 点赞
    url(r'^album/likes$', views.likes_view),
    # 收藏
    url(r'^album/collect',views.collect_view),
]
