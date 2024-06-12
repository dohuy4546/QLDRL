from trainingpoint.models import *
from rest_framework import serializers


class SinhVienSerializer(serializers.ModelSerializer):
    class Meta:
        model = SinhVien
        fields = '__all__'


class ItemSerializer(serializers.ModelSerializer):  # Minh chứng, tài khoản, bài viết
    def to_representation(self, instance):
        rep = super().to_representation(instance)
        rep['image'] = instance.image.url

        return rep


class LopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lop
        fields = '__all__'


class KhoaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Khoa
        fields = '__all__'


class DieuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dieu
        fields = '__all__'


class HoatDongNgoaiKhoaSerializer(serializers.ModelSerializer):
    class Meta:
        model = HoatDongNgoaiKhoa
        fields = '__all__'


class ThamGiaSerializer(serializers.ModelSerializer):
    sinh_vien = SinhVienSerializer()
    hoat_dong_ngoai_khoa = HoatDongNgoaiKhoaSerializer()

    class Meta:
        model = ThamGia
        fields = '__all__'


class HockyNamhocSerializer(serializers.ModelSerializer):
    class Meta:
        model = HocKy_NamHoc
        fields = '__all__'


class TaiKhoanSerializer(serializers.ModelSerializer):
    def to_representation(self, instance):
        rep = super().to_representation(instance)
        print(instance)
        print(rep)
        rep['avatar'] = instance.avatar.url
        return rep

    class Meta:
        model = TaiKhoan
        fields = ['id', 'email', 'username', 'password', 'avatar', 'role', 'first_name', 'last_name']
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }

    def create(self, validated_data):
        data = validated_data.copy()

        taikhoan = TaiKhoan(**data)
        taikhoan.set_password(data['password'])
        taikhoan.save()

        return taikhoan


class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Like
        fields = '__all__'


class CommentSerializer(serializers.ModelSerializer):
    tai_khoan = TaiKhoanSerializer()
    class Meta:
        model = Comment
        fields = '__all__'


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'


class BaiVietSerializer(ItemSerializer):
    so_luot_like = serializers.SerializerMethodField()
    tro_ly = TaiKhoanSerializer()
    def get_so_luot_like(self, bai_viet):
        return Like.objects.filter(bai_viet=bai_viet).count()

    class Meta:
        model = BaiViet
        fields = ['id', 'title', 'image', 'created_date', 'updated_date', 'tro_ly', 'hoat_dong_ngoai_khoa',
                  'so_luot_like']


class BaivietTagSerializer(BaiVietSerializer):
    tags = TagSerializer(many=True)

    class Meta:
        model = BaiVietSerializer.Meta.model
        fields = BaiVietSerializer.Meta.fields + ['content', 'tags']


class AuthenticatedBaiVietTagSerializer(BaivietTagSerializer):
    liked = serializers.SerializerMethodField()

    def get_liked(self, bai_viet):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            return bai_viet.like_set.filter(tai_khoan=request.user, active=True).exists()

    class Meta:
        model = BaivietTagSerializer.Meta.model
        fields = BaivietTagSerializer.Meta.fields + ['liked']


class DiemRenLuyenSerializer(serializers.ModelSerializer):
    class Meta:
        model = DiemRenLuyen
        fields = '__all__'


class MinhChungSerializer(serializers.ModelSerializer):
    def to_representation(self, instance):
        rep = super().to_representation(instance)
        rep['anh_minh_chung'] = instance.anh_minh_chung.url
        print(rep)
        print(instance)
        return rep

    class Meta:
        model = MinhChung
        fields = '__all__'
