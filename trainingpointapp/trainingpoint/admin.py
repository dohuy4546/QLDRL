from django.contrib import admin
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Count, When, Case, Value, CharField
from django.template.response import TemplateResponse
from django.utils.html import mark_safe
from rest_framework import permissions

from trainingpoint.models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.urls import path

from import_export.admin import ImportExportModelAdmin, ExportActionMixin
from import_export.resources import ModelResource
from import_export.fields import Field
from import_export import resources, fields
from django.http import HttpResponse
import csv


# Register your models here.

class MyAdminSite(admin.AdminSite):
    site_header = 'iTrainingPoint'

    def get_urls(self):
        return [path('diemrenluyen-stats/', self.stats_view, name='stats_view'),
                path('sinhvien-info/', self.sinhvien_info_view, name='sinhvien_info_view'), ] + super().get_urls()

    def sinhvien_info_view(self, request):
        hockynamhocs = HocKy_NamHoc.objects.all()
        listDieu = Dieu.objects.all()

        mssv = request.POST.get('mssv', "")
        hocky = int(request.POST.get('hocky', 0))
        namhoc = request.POST.get('namhoc', "")

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
        khoa = Khoa.objects.all()

        malop = request.POST.get('malop', "")
        hocky = int(request.POST.get('hocky', 0))
        namhoc = request.POST.get('namhoc', "")
        thanhtich = request.POST.get('thanhtich', "")
        tenkhoa = request.POST.get('tenkhoa', "")

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

        filtered_hk_nh = (DiemRenLuyen.objects.select_related('sinh_vien', 'hk_nh')
        .filter(hk_nh__hoc_ky=hocky, hk_nh__nam_hoc=namhoc)
        .annotate(
            thanh_tich=Case(
                When(diem_tong__gte=90, then=Value("Xuất sắc")),
                When(diem_tong__gte=80, then=Value("Giỏi")),
                When(diem_tong__gte=70, then=Value("Khá")),
                When(diem_tong__gte=60, then=Value("Trung bình")),
                When(diem_tong__gte=50, then=Value("Yếu")),
                default=Value("Kém"),
                output_field=CharField(max_length=50)
            )
        ))

        statsThanhTich = (filtered_hk_nh.filter(
            thanh_tich__icontains=thanhtich)
                          .values('sinh_vien__lop__ma_lop')
                          .annotate(count=Count('id'))
                          .order_by('sinh_vien__lop__ma_lop'))

        # Kiểm tra quyền của người dùng
        statsKhoa = None
        if request.user.role in [3, 4]:
            try:
                khoa_temp = Khoa.objects.get(ten_khoa=tenkhoa)
                lops_temp = Lop.objects.filter(khoa=khoa_temp)

                hk_nh_temp = HocKy_NamHoc.objects.get(hoc_ky=hocky, nam_hoc=namhoc)

                # danh sách điểm rèn luyện sinh viên - lớp trong học kỳ - năm học
                statsDiemrenluyen_temp = DiemRenLuyen.objects.filter(sinh_vien__lop__in=lops_temp, hk_nh=hk_nh_temp)
                statsKhoa = statsDiemrenluyen_temp.annotate(
                    thanh_tich=Case(
                        When(diem_tong__gte=90, then=Value("Xuất sắc")),
                        When(diem_tong__gte=80, then=Value("Giỏi")),
                        When(diem_tong__gte=70, then=Value("Khá")),
                        When(diem_tong__gte=60, then=Value("Trung bình")),
                        When(diem_tong__gte=50, then=Value("Yếu")),
                        default=Value("Kém"),
                        output_field=CharField(max_length=50)
                    )
                ).values('thanh_tich').annotate(count=Count('id')).order_by(
                    'thanh_tich')
            except ObjectDoesNotExist:
                statsKhoa = None

        return TemplateResponse(request, 'admin/stats.html', {
            'statsDiemrenluyen': statsDiemrenluyen,
            'statsCountThanhTich': statsCountThanhTich,
            'statsThamgia': statsThamgia,
            'statsThanhTich': statsThanhTich,
            'statsKhoa': statsKhoa,
            'lops': lops,
            'hockynamhocs': hockynamhocs,
            'khoa': khoa,
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

    confirm_missing.short_description = "Xác nhận báo thiếu"  # Tên của action trong giao diện admin

    # Tạo custom action hủy xác nhận báo thiếu
    def unconfirm_missing(self, request, queryset):
        for minhchung in queryset:
            tham_gia = minhchung.tham_gia
            if tham_gia:
                tham_gia.delete()
            minhchung.delete()

    unconfirm_missing.short_description = "Hủy xác nhận báo thiếu"


class ThamGiaResource(ModelResource):
    sinh_vien_mssv = Field(attribute='sinh_vien__mssv', column_name='MSSV')
    sinh_vien_ho_ten = Field(attribute='sinh_vien__ho_ten', column_name='Họ Tên')
    state = Field(attribute='state', column_name='Trạng Thái')

    class Meta:
        model = ThamGia
        fields = ('id', 'sinh_vien_mssv', 'sinh_vien_ho_ten', 'state')


class HoatDongNgoaiKhoaAdmin(ExportActionMixin, admin.ModelAdmin):
    actions = ['export_tham_gia']

    def export_tham_gia(self, request, queryset):
        tham_gia_queryset = ThamGia.objects.filter(hoat_dong_ngoai_khoa__in=queryset)
        resource = ThamGiaResource()
        dataset = resource.export(tham_gia_queryset)
        response = HttpResponse(content_type='text/csv; charset=utf-8')
        response['Content-Disposition'] = 'attachment; filename="tham_gia_export.csv"'
        response.write(u'\ufeff'.encode('utf8'))
        writer = csv.writer(response)
        writer.writerow(resource.get_export_headers())

        for row in dataset:
            writer.writerow(row)
        return response




class ImportResource(resources.ModelResource):
    class Meta:
        model = ThamGia
        fields = ('id', 'sinh_vien', 'hoat_dong_ngoai_khoa', 'state')

    def before_import_row(self, row, **kwargs):
        try:
            tham_gia = ThamGia.objects.get(id=row['id'])
            if 'Trạng Thái' in row:
                tham_gia.state = row['Trạng Thái']
            tham_gia.save()
        except ThamGia.DoesNotExist:
            pass


class ThamGiaAdmin(ImportExportModelAdmin):
    resource_class = ImportResource


admin_site.register(TaiKhoan, TaiKhoanAdmin)
admin_site.register(Khoa)
admin_site.register(Lop)
admin_site.register(SinhVien)
admin_site.register(Dieu)
admin_site.register(HocKy_NamHoc)
admin_site.register(HoatDongNgoaiKhoa, HoatDongNgoaiKhoaAdmin)
admin_site.register(ThamGia, ThamGiaAdmin)
admin_site.register(MinhChung, MinhChungAdmin)
admin_site.register(Tag)
admin_site.register(BaiViet)
admin_site.register(Comment)
admin_site.register(Like)
admin_site.register(DiemRenLuyen)
admin_site.register(TroLySinhVien_Khoa)
