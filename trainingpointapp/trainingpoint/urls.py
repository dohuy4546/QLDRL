from django.contrib import admin
from django.urls import path, re_path, include
from rest_framework import routers
from trainingpoint import views
from trainingpoint import send_mail

r = routers.DefaultRouter()
r.register('sinhviens', views.SinhVienViewSet, basename='sinhviens')
r.register('lops', views.LopViewSet, basename='lops')
r.register('khoas', views.KhoaViewSet, basename='khoas')
r.register('dieus', views.DieuViewSet, basename='dieus')
r.register('hoatdongs', views.HoatDongNgoaiKhoaViewSet, basename='hoatdongs')
r.register('baiviets', views.BaiVietViewSet, basename="baiviets")
r.register('tags', views.TagViewSet, basename="tags")
r.register('taikhoans', views.TaiKhoanViewset, basename="taikhoans")
r.register('comments', views.CommentViewset, basename="comments")
r.register('thamgias', views.ThamGiaViewSet, basename='thamgias')
r.register('minhchungs', views.MinhChungViewSet, basename='minhchungs')
r.register('diemrenluyens', views.DiemRenLuyenViewset, basename='diemrenluyens')
r.register('hocky_namhoc', views.HocKyNamHocViewset, basename='hocky_namhoc')
r.register('send_mail', send_mail.SendEmailViewSet, basename='send_mail')
urlpatterns = [
    path('', include(r.urls))
]
