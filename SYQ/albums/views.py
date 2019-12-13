import json

from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from albums.models import Albums, Pictures, Collections
from tools.is_collected import is_collected
from tools.login_check import login_check
from tools.relation_count import count_a, count_b
from user.models import User, Relation


def album_view(request, id):
    album = Albums.objects.filter(id=id)
    if not album:
        return render(request, '404.html')
    owner = album[0].owner
    # todo 用户关注数、粉丝数
    # todo 相册点赞数、收藏数
    pictures = Pictures.objects.filter(album=album[0])
    dic = {'owner': owner, 'album': album[0], 'pictures': pictures}
    return render(request, 'albums/album.html', dic)


def albums_view(request):
    ownername = request.GET.get('ownername')
    users = User.objects.filter(username=ownername)
    if not users:
        return render(request, '404.html')
    user = users[0]

    user_data = {}
    user_data['username'] = user.username
    user_data['nickname'] = user.nickname
    user_data['sign'] = user.sign
    user_data['a'] = count_a(user.username)
    user_data['b'] = count_b(user.username)
    if user.avatar:
        user_data['avatar'] = user.avatar.url
    dic = {'ownername': ownername, 'data': user_data}
    return render(request, 'albums/user_albums.html', dic)


@login_check('POST')
def add_picture(request, album):
    if request.method != 'POST':
        result = {'code': 30101, 'error': 'Please use POST'}
        return JsonResponse(result)
    albums = Albums.objects.filter(id=album)
    if not albums:
        result = {'code': 30102, 'error': 'The album is error !'}
        return JsonResponse(result)

    album = albums[0]
    old_pictures = Pictures.objects.filter(album=album)

    try:
        picture = request.FILES['0']
    except Exception as e:
        print(e)
        res = {'code': 30103, 'error': '请添加图片'}
        if not old_pictures:
            album.delete()
        return JsonResponse(res)
    i = 0
    for picture in request.FILES.values():
        if i == 0 and not old_pictures:
            try:
                Pictures.objects.create(album=album, path=picture, cover=True)
                i += 1
            except:
                res = {'code': 30104, 'error': '上传图片失败'}
                return JsonResponse(res)
        else:
            try:
                Pictures.objects.create(album=album, path=picture)
            except Exception as e:
                res = {'code': 30104, 'error': '上传图片失败'}
                return JsonResponse(res)
    return JsonResponse({'code': 200})


def get_albums(request, username):
    if request.method == 'GET':
        collecter = request.GET.get('username')
        print(collecter)
        if collecter:
            collecter=User.objects.filter(username=collecter)[0]
        user = User.objects.filter(username=username)
        if not user:
            return render(request, '404.html')
        user = user[0]
        albums = Albums.objects.filter(owner=user, is_active=True)
        i = 0
        albums_data = {}
        for album in albums:
            album_data = {}
            cover = Pictures.objects.filter(album=album, cover=True)[0].path.url
            # todo 关注 收藏!!!
            album_data['id'] = album.id
            album_data['title'] = album.title
            album_data['content'] = album.content
            album_data['cover'] = cover
            album_data['created_time'] = album.created_time.strftime('%Y-%m-%d')
            album_data['likes'] = album.likes
            album_data['collects'] = album.collects
            album_data['is_collected'] = is_collected(collecter,album)
            albums_data[i] = album_data
            i += 1
        return JsonResponse({'code': 200, 'data': albums_data})


# 点赞
@login_check('POST', 'PUT')
def likes_view(request):
    if request.method == "POST":
        json_str = request.body
        json_obj = json.loads(json_str)
        id = json_obj.get('id')
        try:
            album = Albums.objects.get(id=id)
        except Exception as e:
            res = {'code': 40110, 'error': '出错了！'}
            return JsonResponse(res)
        album.likes += 1
        album.save()
        return JsonResponse({'code': 200})
    if request.method == 'PUT':
        json_str = request.body
        json_obj = json.loads(json_str)
        id = json_obj.get('id')
        try:
            album = Albums.objects.get(id=id)
        except Exception as e:
            res = {'code': 40110, 'error': '出错了！'}
            return JsonResponse(res)
        album.likes -= 1
        album.save()
        return JsonResponse({'code': 200})


# 收藏
@login_check('POST', 'DELETE')
def collect_view(request):
    if request.method == 'POST':
        json_str = request.body
        json_obj = json.loads(json_str)
        id = json_obj.get('id')
        username = json_obj.get('username')
        if not id:
            return JsonResponse({'code': 40112, 'error': '出错啦！'})
        if not username:
            return JsonResponse({'code': 40113, 'error': '出错啦！'})
        try:
            user = User.objects.filter(username=username)[0]
        except Exception as e:
            return JsonResponse({'code': 40114, 'error': '出错啦！'})
        try:
            album = Albums.objects.filter(id=id)[0]
        except Exception as e:
            return JsonResponse({'code': 40115, 'error': '出错啦！'})
        try:
            Collections.objects.create(collecter=user, collected_album=album)
        except Exception as e:
            return JsonResponse({'code': 40116, 'error': '出错啦！'})
        album.collects += 1
        album.save()
        return JsonResponse({'code': 200})
    if request.method == 'DELETE':
        json_str = request.body
        json_obj = json.loads(json_str)
        id = json_obj.get('id')
        username = json_obj.get('username')
        if not id:
            return JsonResponse({'code': 40112, 'error': '出错啦！'})
        if not username:
            return JsonResponse({'code': 40113, 'error': '出错啦！'})
        try:
            user = User.objects.filter(username=username)[0]
        except Exception as e:
            return JsonResponse({'code': 40114, 'error': '出错啦！'})
        try:
            album = Albums.objects.filter(id=id)[0]
        except Exception as e:
            return JsonResponse({'code': 40115, 'error': '出错啦！'})
        try:
            collection=Collections.objects.get(collecter=user, collected_album=album)
            collection.delete()
        except Exception as e:
            return JsonResponse({'code': 40116, 'error': '出错啦！'})
        album.collects -= 1
        album.save()
        return JsonResponse({'code': 200})
