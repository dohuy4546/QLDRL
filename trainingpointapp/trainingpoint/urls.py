from django.urls import path, re_path, include
from rest_framework import routers
from trainingpoint import views


r = routers.DefaultRouter()
r.register('sinhviens', views.SinhVienViewSet, basename='sinhviens')
r.register('lops', views.LopViewSet, basename='lops')
r.register('khoas', views.KhoaViewSet, basename='khoas')
r.register('dieus', views.DieuViewSet, basename='dieus')
r.register('hoatdongs', views.HoatDongNgoaiKhoaViewSet, basename='hoatdongs')


urlpatterns = [
    path('', include(r.urls)),
]