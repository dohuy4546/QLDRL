import axios from "axios";

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
    'tai_khoan_is_valid': '/taikhoans/is_valid/',
    'sinh_vien_is_valid': '/sinhviens/is_valid/',
    'lop': '/lops/',
    'sinh_vien': '/sinhviens/',
    'send_mail': '/send_mail/',
    'khoa': '/khoas/',
}

export default axios.create({
    baseURL: BASE_URL
});