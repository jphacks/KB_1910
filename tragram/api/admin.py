from django.contrib import admin
from .models import User, Token, Post, Favorite
# Register your models here.

admin.site.register(User)
admin.site.register(Token)
admin.site.register(Post)
admin.site.register(Favorite)
