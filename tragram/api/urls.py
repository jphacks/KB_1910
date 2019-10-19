
from rest_framework import routers
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from api import views


router = routers.DefaultRouter()
router.register(r'user', UserViewSet)
router.register(r'post', PostViewSet)
router.register(r'favorite', FavoriteViewSet)

urlpatterns = [
    path('Post/', views.Posts.as_view()),
    path('Post/<int:pk>/', views.PostDetail.as_view()),
    path('User/<int:pk>/', views.UserDetail.as_view()),
    path('User/<int:pk>/', views.UserDetail.as_view()),
    #path('Favorite/<int:pk>/',)
    #path('Recommend/<int:pk>/',)
]
urlpatterns = format_suffix_patterns(urlpatterns)