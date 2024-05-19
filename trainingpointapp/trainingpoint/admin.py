from django.contrib import admin
from django.db.models import Count, When, Case, Value, CharField
from django.template.response import TemplateResponse
from django.utils.html import mark_safe

from trainingpoint.models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.urls import path


# Register your models here.

class MyAdminSite(admin.AdminSite):
    site_header = 'iTrainingPoint'

    def get_urls(self):
        return [path('diemrenluyen-stats/', self.stats_view, name='stats_view'),
                path('sinhvien-info/', self.sinhvien_info_view, name='sinhvien_info_view'), ] + super().get_urls()

    def sinhvien_info_view(self, request):
        hockynamhocs = HocKy_NamHoc.objects.all()
        listDieu = Dieu.objects.all()

        if request.POST.get('mssv'):
            mssv = request.POST.get('mssv')
        else:
            mssv = ""

        if request.POST.get('hocky'):
            hocky = int(request.POST.get('hocky'))
        else:
            hocky = 0

        if request.POST.get('namhoc'):
            namhoc = request.POST.get('namhoc')
        else:
            namhoc = ""

        hk_nh = HocKy_NamHoc.objects.get(hoc_ky=hocky, nam_hoc=namhoc)

        listThamGia = (ThamGia.objects.select_related('sinh_vien', 'hoat_dong_ngoai_khoa')
                       .filter(state=1, sinh_vien__mssv=mssv, hoat_dong_ngoai_khoa__hk_nh=hk_nh))



        return TemplateResponse(request, 'admin/sinhvien-info.html', {
            'listDieu': listDieu,
            'hockynamhocs': hockynamhocs,
            'listThamGia': listThamGia,
        })

    def stats_view(self, request):
        lops = Lop.objects.all()
        hockynamhocs = HocKy_NamHoc.objects.all()

        if request.POST.get('malop'):
            malop = request.POST.get('malop')
        else:
            malop = ""

        if request.POST.get('hocky'):
            hocky = int(request.POST.get('hocky'))
        else:
            hocky = 0

        if request.POST.get('namhoc'):
            namhoc = request.POST.get('namhoc')
        else:
            namhoc = ""
        statsDiemrenluyen = (DiemRenLuyen.objects.select_related('sinh_vien', 'hk_nh')
                             .filter(sinh_vien__lop__ma_lop__icontains=malop, hk_nh__hoc_ky=hocky,
                                     hk_nh__nam_hoc=namhoc))

        statsThanhtich = (statsDiemrenluyen
                          .annotate(thanh_tich=Case(
            When(diem_tong__gte=90, then=Value("Xuất sắc")),
            When(diem_tong__gte=80, then=Value("Giỏi")),
            When(diem_tong__gte=70, then=Value("Khá")),
            When(diem_tong__gte=60, then=Value("Trung bình")),
            When(diem_tong__gte=50, then=Value("Yếu")),
            default=Value("Kém"),
            output_field=CharField(max_length=50)
        )).values('thanh_tich').annotate(count=Count('thanh_tich')))

        statsThamgia = (ThamGia.objects.select_related('sinh_vien', 'hoat_dong_ngoai_khoa')
                        .filter(state=1))

        return TemplateResponse(request, 'admin/stats.html', {
            'statsDiemrenluyen': statsDiemrenluyen,
            'statsThanhTich': statsThanhtich,
            'statsThamgia': statsThamgia,
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
    actions = ['confirm_missing', 'unconfirm_missing']
    list_display = ['id', 'tham_gia', 'active']

    def my_image(self, minhchung):
        if minhchung.anh_minh_chung:
            return mark_safe(f"<img width='200' src='{minhchung.anh_minh_chung.url}' />")

    # Tạo custom action xác nhận báo thiếu
    def confirm_missing(self, request, queryset):
        for minhchung in queryset:
            tham_gia = minhchung.tham_gia
            if tham_gia:
                tham_gia.state = 1
                tham_gia.save()
            minhchung.delete()

    confirm_missing.short_description = "Xác nhận báo thiếu"  # Tên của action trong giao diện admin

    # Tạo custom action hủy xác nhận báo thiếu
    def unconfirm_missing(self, request, queryset):
        for minhchung in queryset:
            tham_gia = minhchung.tham_gia
            if tham_gia:
                tham_gia.delete()
            minhchung.delete()

    unconfirm_missing.short_description = "Hủy xác nhận báo thiếu"


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
