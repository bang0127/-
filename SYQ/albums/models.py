from django.db import models

# Create your models here.
from user.models import User


class Albums(models.Model):
    title = models.CharField(max_length=50, verbose_name='相册标题')
    content = models.TextField(verbose_name='相册简介')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    updated_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    is_active = models.BooleanField(default=True, verbose_name='是否删除')
    owner = models.ForeignKey(User, verbose_name='拥有者')
    publish = models.BooleanField(default=True, verbose_name='公开')
    likes = models.IntegerField(default=0, verbose_name='点赞数')
    collects = models.IntegerField(default=0, verbose_name='收藏数')


    class Meta:
        db_table = 'albums'
        verbose_name = '相册表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

class Pictures(models.Model):
    album = models.ForeignKey(Albums)
    path = models.ImageField(upload_to='pictures', verbose_name='图片路径')
    cover = models.BooleanField(default=False, verbose_name='封面')

    class Meta:
        db_table = 'pictures'
        verbose_name = '图片表'
        verbose_name_plural = verbose_name


class Collections(models.Model):
    collecter = models.ForeignKey(User, verbose_name='收藏者')
    collected_album = models.ForeignKey(Albums, verbose_name='收藏的相册')
    collected_time = models.DateTimeField(auto_now_add=True, verbose_name='收藏时间')

    class Meta:
        db_table = 'collections'
        verbose_name = '收藏表'
        verbose_name_plural = verbose_name
