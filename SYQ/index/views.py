import json

from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from albums.models import Albums, Pictures
from tools.is_collected import is_collected
from user.models import User


def index(request):
    return render(request, 'index/index.html')


def hot_albums(request):
    if request.method != 'GET':
        res = {'code': 50101, 'error': 'plase use GET'}
        return JsonResponse(res)
    username = request.GET.get('username')
    user = User.objects.filter(username=username)
    if user:
        user = user[0]
    albums = Albums.objects.order_by('-likes')
    hot_albums = albums[:15]
    albums_data = albums_format(hot_albums, user)
    res = {'code': 200, 'data': albums_data}
    return JsonResponse(res)


def search_view(request):
    if request.method == 'GET':
        keyword = request.GET.get('keyword')
        if not keyword:
            res = {'code': 50102, 'error': '请输入关键字'}
            return JsonResponse(res)
        username = request.GET.get('username')
        user = User.objects.filter(username=username)
        if user:
            user = user[0]
        try:
            albums = Albums.objects.filter(Q(title__contains=keyword) | Q(content__contains=keyword))
        except Exception as e:
            res = {'code': 50103, 'error': '查询出错'}
            return JsonResponse(res)
        if not albums:
            res = {'code': 50104, 'error': '没有查询结果'}
            return JsonResponse(res)
        albums_data = albums_format(albums, user)
        res = {'code': 200, 'data': albums_data}
        return JsonResponse(res)


# 对相册对象中的数据进行处理 返回albums_data
def albums_format(albums, user):
    albums_data = {}
    i = 0
    for album in albums:
        album_data = {}
        owner = album.owner
        cover = Pictures.objects.filter(album=album, cover=True)[0].path.url

        # todo 关注 收藏!!!
        album_data['id'] = album.id
        album_data['title'] = album.title
        album_data['content'] = album.content
        album_data['likes'] = album.likes
        album_data['collects'] = album.collects
        album_data['is_collected'] = is_collected(user, album)
        album_data['cover'] = cover
        album_data['created_time'] = album.created_time.strftime('%Y-%m-%d')
        owner_date = {'ownername': owner.username,
                      'nickname': owner.nickname, }
        if owner.avatar:
            owner_date['avatar'] = owner.avatar.url
        else:
            owner_date['avatar'] = '/ststic/imgs/avatar.jpg'
        album_data['owner'] = owner_date
        albums_data[i] = album_data
        i += 1
    return albums_data
