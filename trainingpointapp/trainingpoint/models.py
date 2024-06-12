from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField
from cloudinary.models import CloudinaryField


# Create your models here.
class TaiKhoan(AbstractUser):
    avatar = CloudinaryField('avatar', null=True)

    class RoleChoices(models.IntegerChoices):
        SinhVien = 1, 'Sinh Viên'
        TroLySinhVien = 2, 'Trợ lý sinh viên'
        CVCTSV = 3, 'Chuyên viên công tác sinh viên'
        ADMIN = 4, 'Admin'

    role = models.IntegerField(choices=RoleChoices.choices, null=True)

    class Meta:
        verbose_name_plural = "Tài Khoản"

    def __str__(self):
        return self.username

    def save(self, *args, **kwargs):
        if self.pk is None:
            super().save(*args, **kwargs)
        else:
            try:
                old_user = self.__class__.objects.get(pk=self.pk)
                if self.password != old_user.password:
                    self.set_password(self.password)
            except self.__class__.DoesNotExist:
                pass
            super().save(*args, **kwargs)


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

    class Meta:
        verbose_name_plural = "Khoa"

class TroLySinhVien_Khoa(BaseModel):
    tro_ly_sinh_vien = models.ForeignKey(TaiKhoan,
                                         on_delete=models.CASCADE,
                                         limit_choices_to={'role': TaiKhoan.RoleChoices.TroLySinhVien})
    khoa = models.ForeignKey(Khoa, on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = "Trợ lý sinh viên - Khoa"

class Lop(BaseModel):
    ma_lop = models.CharField(max_length=10, unique=True)
    ten_lop = models.CharField(max_length=255)
    khoa = models.ForeignKey(Khoa, on_delete=models.CASCADE)

    def __str__(self):
        return self.ten_lop

    class Meta:
        verbose_name_plural = "Lớp"


class SinhVien(BaseModel):
    mssv = models.CharField(max_length=10, unique=True)
    ho_ten = models.CharField(max_length=255)
    ho = models.CharField(max_length=255, null=True)
    ten = models.CharField(max_length=255, null=True)
    ngay_sinh = models.DateField()
    cccd = models.CharField(max_length=12, null=False, unique=True)
    email = models.EmailField(null=False, unique=True)

    class GioiTinhChoices(models.IntegerChoices):
        NAM = 1, 'Nam'
        NU = 2, 'Nữ'

    gioi_tinh = models.IntegerField(choices=GioiTinhChoices)
    dia_chi = models.TextField()
    lop = models.ForeignKey(Lop, on_delete=models.CASCADE)

    def __str__(self):
        return self.ho_ten

    class Meta:
        verbose_name_plural = "Sinh viên"


class Dieu(BaseModel):
    ma_dieu = models.CharField(max_length=10, unique=True)
    ten_dieu = models.CharField(max_length=255)
    diem_toi_da = models.IntegerField(default=30)
    def __str__(self):
        return self.ten_dieu

    class Meta:
        verbose_name_plural = "Điều"


class HocKy_NamHoc(models.Model):
    class Meta:
        unique_together = ('hoc_ky', 'nam_hoc')

    class HocKyChoices(models.IntegerChoices):
        ONE = 1, 'Một'
        TWO = 2, 'Hai'
        THREE = 3, 'Ba'

    hoc_ky = models.IntegerField(choices=HocKyChoices.choices)
    nam_hoc = models.CharField(max_length=9)

    def __str__(self):
        return f"{self.hoc_ky} - {self.nam_hoc}"

    class Meta:
        verbose_name_plural = "Học kỳ - Năm học"


class HoatDongNgoaiKhoa(BaseModel):
    ma_hoat_dong = models.CharField(max_length=10, unique=True)
    ten_hoat_dong = models.TextField()
    ngay = models.DateTimeField()
    description = RichTextField(null=True)
    diem_ren_luyen = models.IntegerField(default=5)
    dieu = models.ForeignKey(Dieu, on_delete=models.CASCADE)
    hk_nh = models.ForeignKey(HocKy_NamHoc, on_delete=models.CASCADE)
    sinh_vien = models.ManyToManyField(SinhVien, through='ThamGia')

    def __str__(self):
        return self.ten_hoat_dong

    class Meta:
        verbose_name_plural = "Hoạt động ngoại khóa"


# Bảng trung gian giữa hoạt động ngoại khóa và sinh viên
class ThamGia(models.Model):
    sinh_vien = models.ForeignKey(SinhVien, on_delete=models.CASCADE)
    hoat_dong_ngoai_khoa = models.ForeignKey(HoatDongNgoaiKhoa, on_delete=models.CASCADE)

    class StateChoices(models.IntegerChoices):
        DangKy = 0, 'Đăng ký'
        DiemDanh = 1, 'Điểm danh'
        BaoThieu = 2, 'Báo thiếu'

    state = models.IntegerField(choices=StateChoices, default=0)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.sinh_vien.mssv} - {self.hoat_dong_ngoai_khoa.ten_hoat_dong}"

    class Meta:
        verbose_name_plural = "Tham gia"


class MinhChung(BaseModel):
    description = RichTextField()
    anh_minh_chung = CloudinaryField()
    tham_gia = models.ForeignKey(ThamGia, on_delete=models.CASCADE,
                                 limit_choices_to={'state': ThamGia.StateChoices.BaoThieu})

    class Meta:
        verbose_name_plural = "Minh chứng (Báo thiếu)"


class Tag(BaseModel):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = "Tag"


class BaiViet(BaseModel):
    title = models.CharField(max_length=255)
    content = RichTextField(null=True)
    image = CloudinaryField()
    tro_ly = models.ForeignKey(TaiKhoan, on_delete=models.CASCADE,
                               limit_choices_to={'role__in': [TaiKhoan.RoleChoices.TroLySinhVien, TaiKhoan.RoleChoices.CVCTSV]})
    hoat_dong_ngoai_khoa = models.ForeignKey(HoatDongNgoaiKhoa, on_delete=models.CASCADE)
    tags = models.ManyToManyField(Tag, blank=True, related_name='baiviets')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name_plural = "Bài viết"


class TuongTac(BaseModel):
    tai_khoan = models.ForeignKey(TaiKhoan, on_delete=models.CASCADE)
    bai_viet = models.ForeignKey(BaiViet, on_delete=models.CASCADE)

    class Meta:
        abstract = True


class Comment(TuongTac):
    content = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = "Bình luận"


class Like(TuongTac):
    class Meta:
        unique_together = ('tai_khoan', 'bai_viet')
        verbose_name_plural = "Like"


class DiemRenLuyen(BaseModel):
    sinh_vien = models.ForeignKey(SinhVien, on_delete=models.CASCADE)
    hk_nh = models.ForeignKey(HocKy_NamHoc, on_delete=models.CASCADE)
    diem_tong = models.IntegerField()

    class Meta:
        verbose_name_plural = "Điểm rèn luyện"
