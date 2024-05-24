from django.contrib import admin
from django.db.models import Count, When, Case, Value, CharField
from django.template.response import TemplateResponse
from django.utils.html import mark_safe
from rest_framework import permissions

from trainingpoint.models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.urls import path


# Register your models here.

class MyAdminSite(admin.AdminSite):
    site_header = 'iTrainingPoint'

    def get_urls(self):
        return [path('diemrenluyen-stats/', self.stats_view, name='stats_view')] + super().get_urls()

    def stats_view(self, request):
        lops = Lop.objects.all()
        hockynamhocs = HocKy_NamHoc.objects.all()

        if request.POST.get('malop') and request.POST.get('malop') != "Lớp":
            malop = request.POST.get('malop')
        else:
            malop = ""

        if request.POST.get('hocky') and request.POST.get('hocky') != "Học kỳ":
            hocky = int(request.POST.get('hocky'))
        else:
            hocky = 0

        if request.POST.get('namhoc') and request.POST.get('namhoc') != "Năm học":
            namhoc = request.POST.get('namhoc')
        else:
            namhoc = ""

        if request.POST.get('thanhtich') and request.POST.get('thanhtich') != "Thành tích":
            thanhtich = request.POST.get('namhoc')
        else:
            thanhtich = ""
        statsDiemrenluyen = (DiemRenLuyen.objects.select_related('sinh_vien', 'hk_nh')
                             .filter(sinh_vien__lop__ma_lop__icontains=malop, hk_nh__hoc_ky=hocky,
                                     hk_nh__nam_hoc=namhoc))

        statsCountThanhTich = (statsDiemrenluyen
                          .annotate(thanh_tich=Case(
            When(diem_tong__gte=90, then=Value("Xuất sắc")),
            When(diem_tong__gte=80, then=Value("Giỏi")),
            When(diem_tong__gte=70, then=Value("Khá")),
            When(diem_tong__gte=60, then=Value("Trung bình")),
            When(diem_tong__gte=50, then=Value("Yếu")),
            default=Value("Kém"),
            output_field=CharField(max_length=50)
        )).values('thanh_tich').annotate(count_thanhTich=Count('thanh_tich')))

        statsThamgia = (ThamGia.objects.select_related('sinh_vien', 'hoat_dong_ngoai_khoa')
                        .filter(state=1))

        statsThanhTich = (statsDiemrenluyen
                        .annotate(thanh_tich=Case(
            When(diem_tong__gte=90, then=Value("Xuất sắc")),
            When(diem_tong__gte=80, then=Value("Giỏi")),
            When(diem_tong__gte=70, then=Value("Khá")),
            When(diem_tong__gte=60, then=Value("Trung bình")),
            When(diem_tong__gte=50, then=Value("Yếu")),
            default=Value("Kém"),
            output_field=CharField(max_length=50)
        )).filter(thanh_tich__icontains=thanhtich))

        print(statsThanhTich)
        return TemplateResponse(request, 'admin/stats.html', {
            'statsDiemrenluyen': statsDiemrenluyen,
            'statsCountThanhTich': statsCountThanhTich,
            'statsThamgia': statsThamgia,
            'statsThanhTich': statsThanhTich,
            'lops': lops,
            'hockynamhocs': hockynamhocs

        })


admin_site = MyAdminSite(name='iTrainingPoint')


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


admin_site.register(TaiKhoan, TaiKhoanAdmin)
admin_site.register(Khoa)
admin_site.register(Lop)
admin_site.register(SinhVien)
admin_site.register(Dieu)
admin_site.register(HocKy_NamHoc)
admin_site.register(HoatDongNgoaiKhoa)
admin_site.register(ThamGia)
admin_site.register(MinhChung, MinhChungAdmin)
admin_site.register(Tag)
admin_site.register(BaiViet)
admin_site.register(Comment)
admin_site.register(Like)
admin_site.register(DiemRenLuyen)
admin_site.register(TroLySinhVien_Khoa)
