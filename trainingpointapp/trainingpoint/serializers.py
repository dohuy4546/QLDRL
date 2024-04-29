from pexpect import searcher_re
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
    class Meta:
        model = ThamGia
        fields = '__all__'


class HockyNamhocSerializer(serializers.ModelSerializer):
    class Meta:
        model = HocKy_NamHoc
        fields = '__all__'


class TaiKhoanSerializer(ItemSerializer):
    class Meta:
        model = TaiKhoan
        fields = '__all__'
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }

    def create(self, validated_data):
        data = validated_data.copy()

        taikhoan = TaiKhoan(**data)
        taikhoan.set_password(data["password"])
        taikhoan.save()

        return taikhoan


class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Like
        fields = '__all__'


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = '__all__'


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'


class BaiVietSerializer(ItemSerializer):
    class Meta:
        model = BaiViet
        fields = ['title', 'image', 'created_date', 'updated_date']


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
        fields = ['diem_tong']


class DiemRenLuyenDetails(DiemRenLuyenSerializer):
    sinh_vien = SinhVienSerializer(many=True)
    hk_nh = HockyNamhocSerializer(many=True)
    class Meta:
        model = DiemRenLuyenSerializer.Meta.model
        fields = DiemRenLuyenSerializer.Meta.fields + ['sinh_vien', 'hk_nh']

