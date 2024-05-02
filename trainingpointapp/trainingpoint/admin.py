from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.hashers import make_password
from django.utils.html import mark_safe
from trainingpoint.models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget


# Register your models here.

class MinhChungForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = MinhChung
        fields = '__all__'


class TaiKhoanAdmin(admin.ModelAdmin):
    readonly_fields = ['my_avatar']

    def my_avatar(self, taikhoan):
        if taikhoan.avatar:
            return mark_safe(f"<img width='200' src='{taikhoan.avatar.url}' />")


class MinhChungAdmin(admin.ModelAdmin):
    readonly_fields = ['my_image']  # phải có để hiện ảnh trong trang admin. Trùng tên hàm phía dưới
    form = MinhChungForm

    def my_image(self, minhchung):
        if minhchung.anh_minh_chung:
            return mark_safe(f"<img width='200' src='{minhchung.anh_minh_chung.url}' />")


admin.site.register(TaiKhoan, TaiKhoanAdmin)
admin.site.register(Khoa)
admin.site.register(Lop)
admin.site.register(SinhVien)
admin.site.register(Dieu)
admin.site.register(HocKy_NamHoc)
admin.site.register(HoatDongNgoaiKhoa)
admin.site.register(ThamGia)
admin.site.register(MinhChung, MinhChungAdmin)
admin.site.register(Tag)
admin.site.register(BaiViet)
admin.site.register(Comment)
admin.site.register(Like)
admin.site.register(DiemRenLuyen)
admin.site.register(TroLySinhVien_Khoa)
