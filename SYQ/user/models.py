from django.db import models


# Create your models here.


class User(models.Model):
    username = models.CharField(max_length=11, verbose_name='用户名', primary_key=True)
    nickname = models.CharField(max_length=30, verbose_name='昵称', default='')
    email = models.EmailField(verbose_name='邮箱', default='')
    password = models.CharField(max_length=32, verbose_name='密码')
    sign = models.CharField(max_length=50, verbose_name='个人签名', default='')
    info = models.CharField(max_length=150, verbose_name='个人描述', default='')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updated_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    avatar = models.ImageField(upload_to='avatar', default='', verbose_name='头像')
    is_active = models.BooleanField(default=True)
    login_time = models.DateTimeField(null=True, verbose_name='登录时间')

    class Meta:
        db_table = 'user'
        verbose_name = '用户表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

class Relation(models.Model):
    a = models.CharField(max_length=11, verbose_name='关注者')
    b = models.CharField(max_length=11, verbose_name='被关注者')

    class Meta:
        db_table = 'relation'
        verbose_name = '关系表'
        verbose_name_plural = verbose_name


class WeiboUser(models.Model):
    wuid = models.CharField(max_length=50, db_index=True)
    access_token = models.CharField(max_length=200,db_index=True)
    user = models.OneToOneField(User,null=True)

    class Meta:
        db_table = 'weibo_user'
