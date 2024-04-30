from rest_framework import permissions
from trainingpoint.models import TaiKhoan

class TuongTacHoatDong(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, hoatdong):
        return (super().has_permission(request, view) and
                ((request.TaiKhoan.role == TaiKhoan.RoleChoices.TroLySinhVien) or
                (request.TaiKhoan.role == TaiKhoan.RoleChoices.CVCTSV)))