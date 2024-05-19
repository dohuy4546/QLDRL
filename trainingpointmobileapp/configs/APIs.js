import axios from "axios";

// const BASE_URL = 'http://192.168.3.154:8000/';
const BASE_URL = 'http://192.168.3.154:8000/';


export const endpoints = {
    // 'categories': '/categories/',
    // 'courses': '/courses/',
    // 'lessons': (courseId) => `/courses/${courseId}/lessons/`,
    // 'lesson-details': (lessonId) => `/lessons/${lessonId}/`,
    // 'comments': (lessonId) => `/lessons/${lessonId}/comments/`,
    // 'login': '/o/token/',
    // 'current-user': '/users/current-user/',
    // 'register': '/users/',
    // 'add-comment': (lessonId) => `/lessons/${lessonId}/comments/`
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
    'dieu': '/dieus/',
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