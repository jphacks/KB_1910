from django.db import models

# ユーザーテーブル(ユーザIDは自動追加)
class User(models.Model):
    # ユーザ名(16文字以内)
    username = models.CharField(max_length=16)
    # パスワード(32文字以内)
    password = models.CharField(max_length=32)
    # タイムスタンプ
    create_time = models.DateTimeField(auto_now_add=True)
    
# トークンテーブル（トークン認証で使用）
class Token(models.Model):
    # ユーザID(Userが削除されるとこのレコードも削除される)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    # トークン
    token = models.CharField(max_length=45, db_index=True)
    # タイムスタンプ
    create_time = models.DateTimeField(auto_now_add=True)
    
# 投稿された内容を管理するテーブル
class Post(models.Model):
    # ユーザID(Userが削除されるとこのレコードも削除される)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    # 投稿した日時
    date = models.DateTimeField(auto_now_add=True)
    # 投稿するテキスト
    text = models.CharField(
        max_length=300,
        blank=True,
        null=True,
        )
    # 投稿する画像(１つの投稿につき１画像)
    img_url = models.ImageField(upload_to="media/images")
    # いいねの数
    like_cnt = models.IntegerField()
    

# どのユーザがどの投稿にいいねしたかを管理するテーブル
class Favorite(models.Model):
    # ユーザID(Userが削除されるとこのレコードも削除される)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    # 投稿ID（Postが削除されるとこのレコードも削除される）
    post_id = models.ForeignKey(Post, on_delete=models.CASCADE)
    # タイムスタンプ
    create_time = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        unique_together=(("user_id","post_id"))

