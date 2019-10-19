# coding: utf-8

from rest_framework import serializers

from .models import User, Token, Post, Favorite


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'password', 'create_time')

class TokenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Token
        fields = ('id', 'user_id', 'token', 'create_time')

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ('id', 'user_id', 'date', 'text', 'img_url', 'like_cnt')
        
class FavoriteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Favorite
        fields = ('id', 'user_id', 'post_id', 'create_time')
        
class RecommendationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ('id', 'user_id', 'date', 'text', 'img_url', 'like_cnt')
