
from rest_framework import viewsets, generics, status, parsers, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from trainingpoint.models import *
from trainingpoint import serializers, paginators, perms


class SinhVienViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = SinhVien.objects.filter(active=True)
    serializer_class = serializers.SinhVienSerializer
    pagination_class = paginators.SinhVienPaginator

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            q = self.request.query_params.get('ho_ten')
            if q:
                queryset = queryset.filter(ho_ten__icontains=q)
            mssv = self.request.query_params.get('mssv')
            if mssv:
                queryset = queryset.filter(mssv=mssv)
        return queryset


class LopViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Lop.objects.filter(active=True)
    serializer_class = serializers.LopSerializer
    pagination_class = paginators.LopPaginator

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            q = self.request.query_params.get('ten')
            if q:
                queryset = queryset.filter(ten_lop__icontains=q)
            ma_lop = self.request.query_params.get('ma_lop')
            if ma_lop:
                queryset = queryset.filter(ma_lop=ma_lop)

        return queryset

    @action(methods=['get'], url_path='sinhviens', detail=True)
    def get_sinhviens(self, request, pk):
        sinhviens = self.get_object().sinhvien_set.filter(active=True)
        q = request.query_params.get('ho_ten')
        if q:
            sinhviens = sinhviens.filter(ho_ten__icontains=q)

        return Response(serializers.SinhVienSerializer(sinhviens, many=True).data,
                        status=status.HTTP_200_OK)


class KhoaViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Khoa.objects.filter(active=True)
    serializer_class = serializers.KhoaSerializer

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            q = self.request.query_params.get('ten')
            if q:
                queryset = queryset.filter(ten_khoa__icontains=q)
            ma_khoa = self.request.query_params.get('ma_khoa')
            if ma_khoa:
                queryset = queryset.filter(ma_khoa=ma_khoa)

        return queryset

    @action(methods=['get'], url_path='lops', detail=True)
    def get_lops(self, request, pk):
        lops = self.get_object().lop_set.filter(active=True)
        q = request.query_params.get('ten')
        if q:
            lops = lops.filter(ten_lop__icontains=q)

        return Response(serializers.LopSerializer(lops, many=True).data,
                        status=status.HTTP_200_OK)

    @action(methods=['get'], url_path='sinhviens', detail=True)
    def get_sinhviens(self, request, pk):
        khoa = self.get_object()
        # Lấy tất cả các lớp thuộc về khoa
        lops = khoa.lop_set.filter(active=True).prefetch_related('sinhvien_set')
        # Lấy tất cả sinh viên từ các lớp
        sinhviens = [sinhvien  # sinh viên thêm vào mảng
                     for lop in lops  # lặp qua các lớp
                     for sinhvien in lop.sinhvien_set.filter(active=True)
                     # Lặp qua các sinh viên trong lop.sinhvien_set lọc active true
                     ]
        q = request.query_params.get('ho_ten')
        if q:
            sinhviens = sinhviens.filter(ho_ten__icontains=q)
        return Response(serializers.SinhVienSerializer(sinhviens, many=True).data,
                        status=status.HTTP_200_OK)


class DieuViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = Dieu.objects.filter(active=True)
    serializer_class = serializers.DieuSerializer

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            q = self.request.query_params.get('ten')
            if q:
                queryset = queryset.filter(ten_dieu__icontains=q)
            ma_dieu = self.request.query_params.get('ma_dieu')
            if ma_dieu:
                queryset = queryset.filter(ma_dieu=ma_dieu)

            return queryset

    @action(methods=['get'], url_path='hoatdongs', detail=True)
    def get_hoatdongs(self, request, pk):
        #######
        # Ét o ét cứu
        #######
        # dieu = self.get_object()
        # hoatdongngoaikhoas = dieu.hoatdongngoaikhoa_set.all()
        # return Response(serializers.HoatDongNgoaiKhoaSerializer(hoatdongngoaikhoas, many=True).data,
        #                 status=status.HTTP_200_OK)
        dieu = Dieu.objects.prefetch_related('hoatdongngoaikhoa_set').get(id=pk)
        hoatdongngoaikhoas = dieu.hoatdongngoaikhoa_set.all()
        q = self.request.query_params.get('ten_hoat_dong')
        if q:
            hoatdongngoaikhoas = hoatdongngoaikhoas.filter(ten_hoat_dong__icontains=q)
        return Response(serializers.HoatDongNgoaiKhoaSerializer(hoatdongngoaikhoas, many=True).data,
                        status=status.HTTP_200_OK)


class HoatDongNgoaiKhoaViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView,
                               generics.DestroyAPIView):
    queryset = HoatDongNgoaiKhoa.objects.filter(active=True)
    serializer_class = serializers.HoatDongNgoaiKhoaSerializer

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            q = self.request.query_params.get('ten')
            if q:
                queryset = queryset.filter(ten_hoat_dong__icontains=q)
            ma_hoat_dong = self.request.query_params.get('ma_hoat_dong')
            if ma_hoat_dong:
                queryset = queryset.filter(ma_hoat_dong=ma_hoat_dong)

            return queryset

    @action(methods=['get'], url_path='thamgias', detail=True)
    def get_thamgias(self, request, pk):
        hoatdong = self.get_object()
        thamgias = hoatdong.thamgia_set.all()
        return Response(serializers.ThamGiaSerializer(thamgias, many=True).data,
                        status=status.HTTP_200_OK)
        # dieu = Dieu.objects.prefetch_related('hoatdongngoaikhoa_set').get(id=pk)
        # hoatdongngoaikhoas = dieu.hoatdongngoaikhoa_set.all()
        # q = self.request.query_params.get('ten_hoat_dong')
        # if q:
        #     hoatdongngoaikhoas = hoatdongngoaikhoas.filter(ten_hoat_dong__icontains=q)
        # return Response(serializers.HoatDongNgoaiKhoaSerializer(hoatdongngoaikhoas, many=True).data,
        #                 status=status.HTTP_200_OK)


class BaiVietViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = BaiViet.objects.prefetch_related('tags').filter(active=True)
    serializer_class = serializers.BaivietTagSerializer
    pagination_class = paginators.BaiVietPaginator

    def get_serializer_class(self):
        if self.request.user.is_authenticated:
            return serializers.AuthenticatedBaiVietTagSerializer

        return self.serializer_class

    def get_queryset(self):
        queries = self.queryset

        q = self.request.query_params.get("q")
        if q:
            queries = queries.filter(title__icontains=q)

        return queries

    def get_permissions(self):
        if self.action in ['add_comment', 'like']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny]

    @action(methods=['get'], url_path="comments", detail=True)
    def get_comment(self, request, pk):
        comments = self.get_object().comment_set.select_related('tai_khoan').all()
        return Response(serializers.CommentSerializer(comments, many=True).data,
                        status=status.HTTP_200_OK)

    @action(methods=['post'], url_path='comments', detail=True)
    def add_comment(self, request, pk):
        c = Comment.objects.create(tai_khoan=request.user, bai_viet=self.get_object()
                                   , content=request.data.get('content'))

        return Response(serializers.CommentSerializer(c).data, status=status.HTTP_201_CREATED)

    @action(methods=['post'], url_path='likes', detail=True)
    def like(self, request, pk):
        li, created = Like.objects.get_or_create(bai_viet=self.get_object(),
                                                tai_khoan=request.user)

        if not created:
            li.active = not li.active
            li.save()

        return Response(serializers.AuthenticatedBaiVietTagSerializer(self.get_object(), context={'request': request}).data, status=status.HTTP_201_CREATED)


class TagViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = Tag.objects.all()
    serializer_class = serializers.TagSerializer


class TaiKhoanViewset(viewsets.ViewSet, generics.CreateAPIView):
    queryset = TaiKhoan.objects.filter(is_active=True).all()
    serializer_class = serializers.TaiKhoanSerializer
    parser_classes = [parsers.MultiPartParser, ]
    def get_permissions(self):
        if self.action in ['get_current_user']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get', 'patch'], url_path='current-taikhoans', detail=False)
    def get_current_user(self, request):
        user = request.user
        if request.method.__eq__("PATCH"):
            for k, v in request.data.items():
                setattr(user, k, v) #user.k = v (user.name = v)
            user.save()

        return Response(serializers.TaiKhoanSerializer(user).data)


class CommentViewset(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Comment.objects.all()
    serializer_class = serializers.CommentSerializer
    permission_classes = [perms.CommentOwner, ]





