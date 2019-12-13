from albums.models import Collections


def is_collected(user, album):
    if user and album:
        collection = Collections.objects.filter(collecter=user, collected_album=album)
        if collection:
            return True
        else:
            return False
    else:
        return False