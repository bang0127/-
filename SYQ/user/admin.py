from django.contrib import admin

from . import models


# Register your models here.
class userAdmin(admin.ModelAdmin):
    list_display = ['username', 'nickname', 'password',
                    'email', 'created_time', 'updated_time', 'sign'
        , 'info', 'login_time', 'is_active']


class relationAdmin(admin.ModelAdmin):
    list_display = ['a', 'b']


class weibouserAdmin(admin.ModelAdmin):
    list_display = ['wuid', 'access_token', 'user']


admin.site.register(models.User, userAdmin)
admin.site.register(models.Relation, relationAdmin)
admin.site.register(models.WeiboUser, weibouserAdmin)
