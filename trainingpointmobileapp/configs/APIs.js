import axios from "axios";

const BASE_URL = 'https://dohuy4546.pythonanywhere.com/';


export const endpoints = {
    'dang_ky': '/taikhoans/',
    'dang_nhap': '/o/token/',
    'current_taikhoan': '/taikhoans/current-taikhoans/',
    'tai_khoan_is_valid': '/taikhoans/is_valid/',
    'sinh_vien_is_valid': '/sinhviens/is_valid/',
    'lop': '/lops/',
    'sinh_vien': '/sinhviens/',
    'send_mail': '/send_mail/',
    'khoa': '/khoas/',
    'bai_viet': '/baiviets/',
    'bai_viet_hoat_dong': (bai_viet_id) => `/baiviets/${bai_viet_id}/hoatdong/`,
    'tac_gia': (bai_viet_id) => `/baiviets/${bai_viet_id}/tac_gia/`,
    'comments': (bai_viet_id) => `/baiviets/${bai_viet_id}/comments/`,
    'commentUser': (comment_id) => `/comments/${comment_id}/taikhoan/`,
    'liked': (bai_viet_id) => `/baiviets/${bai_viet_id}/likes/`,
    'current_thamgia': (hoat_dong_id) => `/hoatdongs/${hoat_dong_id}/current_thamgia/`,
    'tham_gia_hoat_dong': (hoat_dong_id) => `/hoatdongs/${hoat_dong_id}/thamgias/`,
    'hoat_dong': '/hoatdongs/',
    'hocky_namhoc_id': (hocky_namhoc_id) => `/hocky_namhoc/${hocky_namhoc_id}/`,
    'hocky_namhoc': `/hocky_namhoc/`,
    'tham_gia': '/thamgias/',
    'update_tham_gia': (tham_gia_id) => `/thamgias/${tham_gia_id}/`,
    'bao_thieu_tham_gia': (tham_gia_id) => `/thamgias/${tham_gia_id}/baothieu/`,
    'dieu': '/dieus/',
    'tong_diem': '/diemrenluyens/',
    'minh_chung': '/minhchungs/',
    'huy_minh_chung': (minh_chung_id) => `/minhchungs/${minh_chung_id}/huyminhchung/`,
    'xuat_danh_sach': (hoat_dong_id) => `/hoatdongs/${hoat_dong_id}/danhsach/`,
    'quen_mat_khau': `/taikhoans/quen_mat_khau/`,
    'tro_ly': `/taikhoans/tro_ly/`,
    'tai_khoan_info': `/taikhoans/public_info/`,
    'tai_khoan_sinh_vien': `/taikhoans/sinh_vien/`
}

export const authAPI = (accessToken) => axios.create({
    baseURL: BASE_URL,
    headers: {
        Authorization: `Bearer ${accessToken ? accessToken : AsyncStorage.getItem("access-token")}`
    }
})

export default axios.create({
    baseURL: BASE_URL
});