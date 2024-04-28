from rest_framework import viewsets, generics, status, parsers, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from trainingpoint.models import *
from trainingpoint import serializers, paginators, perms
from django.contrib.auth.models import AnonymousUser


# Create your views here.

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
            q = self.request.query_params.get('ten_lop')
            if q:
                queryset = queryset.filter(ten_lop__icontains=q)
            ma_lop = self.request.query_params.get('ma_lop')
            if ma_lop:
                queryset = queryset.filter(ma_lop=ma_lop)

        return queryset

    @action(methods=['get'], url_path='sinhviens', detail=True)
    def get_sinhviens(self, request, pk):
        print(self)
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
            q = self.request.query_params.get('ten_khoa')
            if q:
                queryset = queryset.filter(ten_khoa__icontains=q)
            ma_khoa = self.request.query_params.get('ma_khoa')
            if ma_khoa:
                queryset = queryset.filter(ma_khoa=ma_khoa)

        return queryset

    @action(methods=['get'], url_path='lops', detail=True)
    def get_lops(self, request, pk):
        lops = self.get_object().lop_set.filter(active=True)
        q = request.query_params.get('ten_lop')
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
            q = self.request.query_params.get('ten_dieu')
            if q:
                queryset = queryset.filter(ten_dieu__icontains=q)
            ma_dieu = self.request.query_params.get('ma_dieu')
            if ma_dieu:
                queryset = queryset.filter(ma_dieu=ma_dieu)

            return queryset

    @action(methods=['get'], url_path='hoatdongs', detail=True)
    def get_hoatdongs(self, request, pk):
        # print(self)
        # #######
        # # Ét o ét cứu
        # #######
        # dieu = self.get_object()
        # print(dieu)
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


# generics.ListCreateAPIView, generics.UpdateAPIView,generics.DestroyAPIView)

class HoatDongNgoaiKhoaViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView,
                               generics.DestroyAPIView):
    queryset = HoatDongNgoaiKhoa.objects.filter(active=True)
    serializer_class = serializers.HoatDongNgoaiKhoaSerializer

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            q = self.request.query_params.get('ten_hoat_dong')
            if q:
                queryset = queryset.filter(ten_hoat_dong__icontains=q)
            ma_hoat_dong = self.request.query_params.get('ma_hoat_dong')
            if ma_hoat_dong:
                queryset = queryset.filter(ma_hoat_dong=ma_hoat_dong)

            return queryset

    def get_permissions(self):
        print(self.action)
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            if isinstance(self.request.user, AnonymousUser):
                return [permissions.IsAuthenticated()]
            else:
                if (self.request.user.is_authenticated and \
                        (self.request.user.role not in [TaiKhoan.RoleChoices.CVCTSV,
                                                        TaiKhoan.RoleChoices.TroLySinhVien]
                         or self.request.user.is_authenticated)):
                    return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(methods=['get'], url_path='thamgias', detail=True)
    def get_thamgias(self, request, pk):
        hoatdong = HoatDongNgoaiKhoa.objects.get(id=pk)
        thamgias = ThamGia.objects.filter(hoat_dong_ngoai_khoa=hoatdong)
        return Response(serializers.ThamGiaSerializer(thamgias, many=True).data,
                        status=status.HTTP_200_OK)


class ThamGiaViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = ThamGia.objects.all()
    serializer_class = serializers.ThamGiaSerializer

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            namhoc = self.request.query_params.get('nam_hoc')
            if namhoc:
                hocky_namhoc = HocKy_NamHoc.objects.filter(nam_hoc=namhoc)
                hoatdong_ids = HoatDongNgoaiKhoa.objects.filter(hk_nh__in=hocky_namhoc).values_list('id', flat=True)
                queryset = queryset.filter(hoat_dong_ngoai_khoa_id__in=hoatdong_ids)
            hocky = self.request.query_params.get('hoc_ky')
            if hocky:
                hocky_namhoc = HocKy_NamHoc.objects.filter(hoc_ky=hocky)
                hoatdong_ids = HoatDongNgoaiKhoa.objects.filter(hk_nh__in=hocky_namhoc).values_list('id', flat=True)
                queryset = queryset.filter(hoat_dong_ngoai_khoa_id__in=hoatdong_ids)
            mssv = self.request.query_params.get('mssv')
            if mssv:
                sinhvien = SinhVien.objects.get(mssv=mssv)
                queryset = queryset.filter(sinh_vien=sinhvien)

            return queryset

    @action(methods=['get'], url_path='minhchungs', detail=True)
    def get_thamgias(self, request, pk):
        thamgia = ThamGia.objects.get(id=pk)
        print(thamgia)
        minhchung = MinhChung.objects.filter(tham_gia=thamgia)
        print(minhchung)
        return Response(serializers.MinhChungSerializer(minhchung, many=True).data,
                        status=status.HTTP_200_OK)


class MinhChungViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = MinhChung.objects.filter(active=True)
    serializer_class = serializers.MinhChungSerializer

    def get_queryset(self):
        queryset = self.queryset
        if self.action == 'list':
            mssv = self.request.query_params.get('mssv')
            hoatdong = self.request.query_params.get('hoat_dong')
            if mssv:
                sinhvien = SinhVien.objects.get(mssv=mssv)
                thamgias = ThamGia.objects.filter(sinh_vien=sinhvien)
                queryset = queryset.filter(tham_gia__in=thamgias)
            if hoatdong:
                hoatdongs = HoatDongNgoaiKhoa.objects.filter(ten_hoat_dong__icontains=hoatdong)
                thamgias = ThamGia.objects.filter(hoat_dong_ngoai_khoa__in=hoatdongs)
                queryset = queryset.filter(tham_gia__in=thamgias)

            return queryset
