import datetime
import hashlib
import json

from django.db import transaction
from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from albums.models import Albums
from tokens.views import make_token
from tools.login_check import login_check
from tools.relation_count import count_b, count_a
from user.models import User, Relation, WeiboUser
from user.weiboapi import OAuthWeibo


def login_view(request):
    if request.method == 'GET':
        return render(request, 'user/login.html')
    elif request.method == 'POST':
        username = request.POST.get('username')
        if not username:
            pass


def regiester_view(request):
    if request.method == 'GET':
        wuid = request.GET.get('wuid')
        if wuid:
            dic = {'wuid': wuid}
            return render(request, 'user/register.html', dic)
        return render(request, 'user/register.html')
    elif request.method == 'POST':
        # 获取用户名
        username = request.POST.get('username')
        if username == '':
            dic = {'error': '请输入用户名'}
            return render(request, 'user/register.html', dic)
        # 判断用户名是否存在
        users = User.objects.filter(username=username)
        if users:
            dic = {'error': '用户名已存在！'}
            return render(request, 'user/register.html', dic)
        # 获取密码
        pwd = request.POST.get('pwd')
        rpwd = request.POST.get('rpwd')
        # 判断是否输入密码
        if not pwd:
            dic = {'error': '请输入密码！'}
            return render(request, 'user/register.html', dic)
        # 判断两次密码是否相同
        if pwd != rpwd:
            dic = {'error': '两次密码不一致！'}
            return render(request, 'user/register.html', dic)

        # md5加密
        md = hashlib.md5()
        md.update(pwd.encode())
        password = md.hexdigest()
        wuid = request.POST.get('wuid')
        # 将注册信息存入数据库
        try:
            with transaction.atomic():
                newuser = User.objects.create(username=username, password=password)
                if wuid:
                    wuser = WeiboUser.objects.get(wuid=wuid)
                    wuser.user = newuser
                    wuser.save()

        except Exception:
            dic = {'error': '注册失败！'}
            return render(request, 'user/register.html', dic)
        # 注册成功
        dic = {'success': '注册成功！'}
        return render(request, 'user/register.html', dic)


# 获取个人中心
def user_center(request, username=None):
    if request.method == 'GET':
        users = User.objects.filter(username=username)
        if users:
            user = users[0]
            dic = {}
            dic['username'] = user.username
            dic['sign'] = user.sign
            dic['avatar'] = user.avatar.url if user.avatar else None
            dic['nickname'] = user.nickname
            dic['info'] = user.info
            dic['b'] = count_b(user.username)
            dic['a'] = count_a(user.username)
            return render(request, 'user/user_center.html', dic)
        else:
            return render(request, 'index/index.html')


# 用户添加相册
@login_check('POST')
def add_album_view(request):
    if request.method == 'GET':
        return render(request, 'user/add_album.html')
    elif request.method == 'POST':
        json_str = request.body
        # todo 检查json_str 是否存在
        json_obj = json.loads(json_str)
        title = json_obj.get('title')
        content = json_obj.get('content')
        username = json_obj.get('username')
        if not title:
            res = {'code': 20101, 'error': '请输入相册标题'}
            return JsonResponse(res)
        if not content:
            res = {'code': 20102, 'error': '请输入简介'}
            return JsonResponse(res)
        user = User.objects.filter(username=username)
        if not user:
            res = {'code': 20104, 'error': '用户错误'}
            return JsonResponse(res)
        try:
            album = Albums.objects.create(title=title, content=content, owner=user[0])
        except Exception as e:
            print(e)
            res = {'code': 20103, 'error': '创建相册失败'}
            return JsonResponse(res)
        album_id = album.id
        res = {'code': 200, 'album': album_id}
        return JsonResponse(res)


# 获取关注信息
@login_check('POST')
def relation_view(requset):
    if requset.method == 'GET':
        username = requset.GET.get('username')
        ownername = requset.GET.get('ownername')
        if username == ownername:
            res = {'code': 60104}
            return JsonResponse(res)
        try:
            relation = Relation.objects.filter(a=username, b=ownername)[0]
        except Exception as e:
            res = {'code': 60102, 'error': 'relation error'}
            return JsonResponse(res)
        if not relation:
            res = {'code': 60103, 'error': 'no relation'}
            return JsonResponse(res)
        res = {'code': 200}
        return JsonResponse(res)
    elif requset.method == 'POST':
        json_str = requset.body
        json_obj = json.loads(json_str)
        username = json_obj.get('username')
        ownername = json_obj.get('ownername')
        try:
            Relation.objects.create(a=username, b=ownername)
        except Exception as e:
            print(e)
            res = {'code': 60101, 'error': '关注失败'}
            return JsonResponse(res)
        res = {'code': 200}
        return JsonResponse(res)


# 检查是否登录
@login_check('GET')
def is_login(requset):
    if requset.method != 'GET':
        return JsonResponse({'code': 20107, 'error': 'please use get'})
    res = {'code': 200}
    return JsonResponse(res)


# 微博api
def users_weibo_url(request):
    oauth = OAuthWeibo('123')
    oauth_weibo_url = oauth.get_weibo_login()
    return JsonResponse({'code': 200, 'oauth_url': oauth_weibo_url})


def users_weibo_token(request):
    code = request.GET.get('code')
    oauth = OAuthWeibo()
    # 向微博服务器提交code,成功则返回该用户的token
    res = oauth.get_access_token_uid(code)
    res_obj = json.loads(res)
    access_token = res_obj['access_token']
    uid = res_obj['uid']

    # 检查当前用户是否注册过我们的账号
    try:
        bu = WeiboUser.objects.get(wuid=uid)
    except Exception as e:
        WeiboUser.objects.create(wuid=uid, access_token=access_token)
        return JsonResponse({'code': 20111, 'wuid': uid})
    else:
        # 检查是否绑定
        user = bu.user
        if not user:
            return JsonResponse({'code': 20112, 'wuid': uid})
        now = datetime.datetime.now()
        username = user.username
        token = make_token(username, 3600 * 24, str(now))
        res = {'code': 200, 'username': username, 'data': {'token': token.decode()}}
        return JsonResponse(res)


# 我的关注
@login_check('GET')
def my_relation(request):
    if request.method == 'GET':
        username = request.GET.get('username')
        relations = Relation.objects.filter(a=username)
        data = {}
        i = 0
        for relation in relations:
            person_name = relation.b
            try:
                person = User.objects.get(username=person_name)
            except Exception as e:
                continue
            person_data = {}
            person_data['username'] = person.username
            person_data['nickname'] = person.nickname
            person_data['sign'] = person.sign
            person_data['avatar'] = person.avatar.url if person.avatar else None
            data[i] = person_data
            i += 1
        res = {'code': 200, 'data': data}
        return JsonResponse(res)
