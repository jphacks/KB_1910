from django.http import HttpResponse, JsonResponse,Http404
from django.views.decorators.csrf import csrf_exempt
# JSONパーサー&レンダラー
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
# シリアライザ (db操作用のController的な役割)
from api_v1.serializers import UserSerializer, TokenSerializer, PostSerializer, FavoriteSerializer
# パスワードhasher
from django.contrib.auth.hashers import make_password, check_password
# Json形成
from django.utils.six import BytesIO
# ハッシュ化
import hashlib
# タイムスタンプ用
from django.utils import timezone
# ファイル名取得
import os.path
# import for file upload
import os
# 別スレッドで処理する用
import threading

from .models import User, Token, Post, Favorite
from rest_framework.response import Response
from rest_framework import status

# ファイルの保存先のパス
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
UPLOADE_DIR = os.path.join(BASE_DIR, 'uploaded_files/api_v1/images')


# ユーザー登録API
@csrf_exempt # APIなので、csrf対策を無効にする
def register(request):
    # POST
    if request.method == 'POST':
        # JSONをパース
        data = JSONParser().parse(request)
        # Userモデルに当てはめる
        serializer = UserSerializer(data=data)

        # バリデーションを掛ける(パスワードはハッシュ化するので、空文字判定を先に行う)
       # パスワードが空かを確認する
        if serializer.initial_data["password"] == "":
            return HttpResponse("使用できないパスワードです。", status=403)

        # パスワードをハッシュ化
        serializer.initial_data["password"] = make_password(serializer.initial_data["password"], hasher='argon2')

        # 有効なものかを判断する
        if serializer.is_valid():
            # 保存
            try:
                serializer.save()
                # ユーザーIDを取得
                user = UserSerializer.select(user_name=serializer.initial_data["account_name"])
                # トークン生成
                token = TokenSerializer.create(user)
                # ユーザーにトークンを渡す
                data = '{"token": "' + token +'"}'
                response = HttpResponse(data, status=200)
                response['content-type'] = 'application/json; charset=utf-8'
                return response
            # account_nameがかぶったときなどのエラー処理
            except Exception as e:
                print(e)
                return HttpResponse("ユーザー名が使われています", status=409)
        # 不正なリクエストの場合
        return HttpResponse("不正なリクエスト", status=400)
    else:
        return HttpResponse("不正なリクエスト", status=400)

# ユーザーログインAPI
@csrf_exempt # APIなので、csrf対策を無効にする
def login(request):
    # POST
    if request.method == 'POST':
        # JSONをパース
        data = JSONParser().parse(request)
        # Userモデルに当てはめる
        serializer = UserSerializer(data=data)
        # 有効なものかを判断する
        if serializer.is_valid():
            try:
                # ユーザーを取得
                user = UserSerializer.select(user_name=serializer.initial_data["account_name"])
            except:
                return HttpResponse("ユーザーが存在しません", status=401)

            # ログイン成功時
            if check_password(serializer.data["password"], user.password):
                # トークン生成
                token = TokenSerializer.create(user)
                # ユーザーにトークンを渡す
                data = '{"token": "' + token +'"}'
                response = HttpResponse(data, status=200)
                response['content-type'] = 'application/json; charset=utf-8'
                return response
            # ログイン失敗時
            else:
                return HttpResponse("ログイン失敗", status=401)
        # 不正なリクエスト
        return HttpResponse("不正なリクエスト", status=400)
    else:
        return HttpResponse("不正なリクエスト", status=400)

# 投稿API
@csrf_exempt
def post(request):
    try:
        # トークンの認証
        if request.META['HTTP_AUTHORIZATION']:
            # Bearerスキームを取り除いて、tokenを認証し、userオブジェクトを得る
            user = TokenSerializer.auth(request.META['HTTP_AUTHORIZATION'].replace("Bearer ", ""))
            # トークンに紐付けられたアカウントが無かった場合
            if not user:
                response = HttpResponse("token is wrong", status=401)
                response["WWW-Authenticate"] = 'realm="The access token was expired", error="invalid_token"'
                return response
        # トークンが空の場合
        else:
            response = HttpResponse("token is empty", status=401)
            response["WWW-Authenticate"] = 'realm="token is empty", error="invalid_token"'
            return response
    except:
        response = HttpResponse("token is empty", status=401)
        response["WWW-Authenticate"] = 'realm="token is empty", error="invalid_token"'
        return response
    
    # GETメソッド
    if request.method == 'GET':
        queryset = Post.objects.all()
        serializer = PostSerializer()
        return Response(serializer.data)
    # POSTメソッド
    elif request.method == 'POST':
        serializer = PostSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)