from user.models import Relation


# 粉丝数量
def count_a(b):
    relations = Relation.objects.filter(b=b)
    a_num = len(relations)
    return a_num


# 关注数量
def count_b(a):
    relations = Relation.objects.filter(a=a)
    b_num = len(relations)
    return b_num
