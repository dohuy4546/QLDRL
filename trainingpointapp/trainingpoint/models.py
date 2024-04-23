from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField
from cloudinary.models import CloudinaryField


# Create your models here.
class TaiKhoan(AbstractUser):
    avatar = CloudinaryField(null=True)

    class RoleChoices(models.IntegerChoices):
        SinhVien = 1, 'Sinh Viên'
        TroLySinhVien = 2, 'Trợ lý sinh viên'
        CVCTSV = 3, 'Chuyên viên công tác sinh viên'

    role = models.IntegerField(choices=RoleChoices.choices, null=True)


class BaseModel(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    class Meta:
        abstract = True


class Khoa(BaseModel):
    ma_khoa = models.CharField(max_length=10, unique=True)
    ten_khoa = models.CharField(max_length=255)

    def __str__(self):
        return self.ten_khoa


class Lop(BaseModel):
    ma_lop = models.CharField(max_length=10, unique=True)
    ten_lop = models.CharField(max_length=255)
    khoa = models.ForeignKey(Khoa, on_delete=models.CASCADE)

    def __str__(self):
        return self.ten_lop


class SinhVien(BaseModel):
    mssv = models.CharField(max_length=10, unique=True)
    ho_ten = models.CharField(max_length=255)
    ngay_sinh = models.DateField()

    class GioiTinhChoices(models.IntegerChoices):
        NAM = 1, 'Nam'
        NU = 2, 'Nữ'

    gioi_tinh = models.IntegerField(choices=GioiTinhChoices)
    dia_chi = models.TextField()
    lop = models.ForeignKey(Lop, on_delete=models.CASCADE)

    def __str__(self):
        return self.ho_ten


class Dieu(BaseModel):
    ma_dieu = models.CharField(max_length=10, unique=True)
    ten_dieu = models.CharField(max_length=255)


class HocKy_NamHoc(models.Model):
    class Meta:
        unique_together = ('hoc_ky', 'nam_hoc')
    class HocKyChoices(models.IntegerChoices):
        ONE = 1, 'Một'
        TWO = 2, 'Hai'
        THREE = 3, 'Ba'

    hoc_ky = models.IntegerField(choices=HocKyChoices.choices)
    nam_hoc = models.CharField(max_length=9)


class HoatDongNgoaiKhoa(BaseModel):
    ma_hoat_dong = models.CharField(max_length=10, unique=True)
    ten_hoat_dong = models.TextField()
    ngay = models.DateTimeField()
    description = RichTextField(null=True)
    diem_ren_luyen = models.IntegerField(default=5)
    dieu = models.ForeignKey(Dieu, on_delete=models.CASCADE)
    hk_nh = models.ForeignKey(HocKy_NamHoc, on_delete=models.CASCADE)
    sinh_vien = models.ManyToManyField(SinhVien, through='ThamGia')


# Bảng trung gian giữa hoạt động ngoại khóa và sinh viên
class ThamGia(models.Model):
    sinh_vien = models.ForeignKey(SinhVien, on_delete=models.CASCADE)
    hoat_dong_ngoai_khoa = models.ForeignKey(HoatDongNgoaiKhoa, on_delete=models.CASCADE)

    class StateChoices(models.IntegerChoices):
        DiemDanh = 1, 'Điểm danh'
        BaoThieu = 2, 'Báo thiếu'

    state = models.IntegerField(choices=StateChoices, null=True)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)


class MinhChung(BaseModel):
    description = RichTextField()
    anh_minh_chung = CloudinaryField()
    tham_gia = models.ForeignKey(ThamGia, on_delete=models.CASCADE)


class Tag(BaseModel):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name


class BaiViet(BaseModel):
    title = models.CharField(max_length=255)
    content = RichTextField(null=True)
    image = CloudinaryField()
    tro_ly = models.ForeignKey(TaiKhoan, on_delete=models.CASCADE)
    hoat_dong_ngoai_khoa = models.ForeignKey(HoatDongNgoaiKhoa, on_delete=models.CASCADE)
    tags = models.ManyToManyField(Tag, blank=True, related_name='baiviets')

    def __str__(self):
        return self.title


class TuongTac(BaseModel):
    tai_khoan = models.ForeignKey(TaiKhoan, on_delete=models.CASCADE)
    bai_viet = models.ForeignKey(BaiViet, on_delete=models.CASCADE)

    class Meta:
        abstract = True


class Comment(TuongTac):
    content = models.CharField(max_length=255)


class Like(TuongTac):
    class Meta:
        unique_together = ('tai_khoan', 'bai_viet')


class DiemRenLuyen(BaseModel):
    sinh_vien = models.ForeignKey(SinhVien, on_delete=models.CASCADE)
    hk_nh = models.ForeignKey(HocKy_NamHoc, on_delete=models.CASCADE)
    diem_tong = models.IntegerField()
