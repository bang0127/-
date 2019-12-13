import datetime
import hashlib
import json
import time

import jwt
from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from user.models import User


def tokens(request):
    if request.method != 'POST':
        res = {'code': 10101, 'error': 'please use post!'}
        return JsonResponse(res)
    json_str = request.body
    # todo 检查json_str 是否存在
    json_obj = json.loads(json_str)
    username = json_obj.get('username')
    password = json_obj.get('password')

    # 查找数据库是否存在该用户
    users = User.objects.filter(username=username)
    if not users:
        res = {'code': 10102, 'error': '用户名或密码错误'}
        return JsonResponse(res)
    user = users[0]
    # 检查password
    md = hashlib.md5()
    md.update(password.encode())
    md_pass = md.hexdigest()
    if md_pass != user.password:
        res = {'code': 10103, 'error': '用户名或密码错误'}
        return JsonResponse(res)

    # 更新登录时间
    now_datetime = datetime.datetime.now()
    user.login_time = now_datetime
    user.save()
    # 生成token
    token = make_token(username, 3600 * 24, str(now_datetime))
    res = {'code': 200, 'username': username, 'data': {'token': token.decode()}}
    return JsonResponse(res)


def make_token(username, exp, login_time):
    key = 'syq123'
    now_time = time.time()
    payload = {'username': username, 'exp': int(now_time + exp), 'login_time': login_time}
    return jwt.encode(payload, key, algorithm='HS256')
