from rest_framework import pagination


class SinhVienPaginator(pagination.PageNumberPagination):
    page_size = 5


class LopPaginator(pagination.PageNumberPagination):
    page_size = 5
