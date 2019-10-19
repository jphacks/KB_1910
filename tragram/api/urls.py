
from rest_framework import routers
from .views import UserViewSet, TokenViewSet, PostViewSet, FavoriteViewSet


router = routers.DefaultRouter()
router.register(r'user', UserViewSet)
router.register(r'post', PostViewSet)
router.register(r'favorite', FavoriteViewSet)