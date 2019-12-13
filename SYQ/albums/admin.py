from django.contrib import admin

# Register your models here.
from albums.models import Albums, Pictures, Collections


class albumsAdmin(admin.ModelAdmin):
    list_display = ['id', 'owner', 'title', 'content', 'created_time'
        , 'updated_time', 'likes', 'collects', 'is_active']


class picturesAdmin(admin.ModelAdmin):
    list_display = ['id', 'path', 'cover', 'album_id']
    list_editable=['cover']

class collectionAdmin(admin.ModelAdmin):
    list_display = ['id','collecter','collected_album','collected_time']


admin.site.register(Albums, albumsAdmin)
admin.site.register(Pictures, picturesAdmin)
admin.site.register(Collections,collectionAdmin)

