import jwt
from django.http import JsonResponse

from user.models import User

TOKEN_KEY = 'syq123'


def login_check(*methods):
    def _login_check(func):
        def wrapper(request, *args, **kwargs):

            if not methods:
                return func(request, *args, **kwargs)
            else:
                if request.method not in methods:
                    return func(request, *args, **kwargs)
            # 取出token
            token = request.META.get('HTTP_AUTHORIZATION')
            if not token:
                result = {'code': 20104, 'error': 'Please login'}
                return JsonResponse(result)

            try:
                res = jwt.decode(token, TOKEN_KEY, algorithms='HS256')
            except Exception as e:
                result = {'code': 20105, 'error': 'Please login'}
                return JsonResponse(result)

            username = res['username']
            login_time = res['login_time']
            user = User.objects.get(username=username)

            if login_time:
                if str(user.login_time) != login_time:
                    result = {'code': 20106, 'error': '已在异地登录,请重新登录'}
                    return JsonResponse(result)



            request.user = user

            return func(request, *args, **kwargs)

        return wrapper

    return _login_check
