from django.shortcuts import render


def login_callback(request):
    return render(request,'user/login_callback.html')