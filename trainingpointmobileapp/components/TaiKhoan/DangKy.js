import React from "react";
import { View, TextInput, Button, Image, Text, Alert, ActivityIndicator, ScrollView, KeyboardAvoidingView, ToastAndroid } from "react-native";
import { TextInput as PaperTextInput, Title, Button as PaperButton } from "react-native-paper";
import * as ImagePicker from 'expo-image-picker';
import APIs, { endpoints } from "../../configs/APIs";
import Styles from "./Styles";


const DangKy = ({ route, navigation }) => {
    const [user, setUser] = React.useState({
        "email": "",
        "username": "",
        "password": "",
        "avatar": "",
        'role': "1"
    })
    const [loading, setLoading] = React.useState(false);
    const [success, setSuccess] = React.useState(false);

    const change = (field, value) => {
        setUser(current => {
            return { ...current, [field]: value }
        })
    }

    const handleEmailChange = (text) => {
        change('email', text);
    };

    const handlePasswordChange = (text) => {
        change('password', text);
    };

    const handleUsernameChange = (text) => {
        change('username', text);
    }

    const handleChooseAvatar = async () => {
        let { status } =
            await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
            alert("Permissions denied!");
        } else {
            const result =
                await ImagePicker.launchImageLibraryAsync();
            if (!result.canceled)
                change('avatar', result.assets[0]);
        }
    };

    const validateEmail = (email) => {
        const re = /\S+@\S+\.\S+/;
        return re.test(email);
    };

    const validatePassword = (password) => {
        return password.length >= 8; // Đủ dài ít nhất 8 ký tự
    };

    const validateDangKy = async () => {
        setLoading(true);
        if (validateEmail(user.email) && validatePassword(user.password) && user.avatar && user.username) {
            let sv_valid = false; // Đã có sinh viên
            let tk_valid = false; // Đã có tài khoản
            try {
                let url = `${endpoints['sinh_vien_is_valid']}?email=${user.email}`;
                let check = await APIs.get(`${endpoints['sinh_vien_is_valid']}?email=${user.email}`);
                if (check.status == 200) {
                    sv_valid = true;
                }
            } catch (ex) {
                setLoading(false);
                ToastAndroid.show(ex.message, ToastAndroid.LONG);
            }
            let message = "";
            try {
                let check = await APIs.get(`${endpoints['tai_khoan_is_valid']}?email=${user.email}&username=${user.username}`);
                if (check.status == 200) {
                    res = check.data.is_valid;
                    if (res == true) {
                        tk_valid = true;
                        message = check.data.message;
                    }
                }
            } catch (ex) {
                setLoading(false);
                ToastAndroid.show(ex.message, ToastAndroid.LONG);
                Alert.alert('Có lỗi gì đó đã xảy ra', 'Tài khoản không hợp lệ!');
            }
            if (sv_valid == true && tk_valid == false) {
                navigation.navigate('OTP', { email: user.email });
            } else if (sv_valid == false) {
                setLoading(false);
                Alert.alert('Có lỗi gì đó xảy ra', 'Sinh viên không tồn tại!');
            } else if (tk_valid == true) {
                setLoading(false);
                Alert.alert('Có lỗi gì đó xảy ra', message);
            }
        } else if (!user.avatar) {
            setLoading(false);
            Alert.alert('Có lỗi gì đó xảy ra', 'Avatar không tồn tại!');
        } else if (!validateEmail(user.email)) {
            setLoading(false);
            Alert.alert('Có lỗi gì đó xảy ra', 'Email nhập không hợp lệ!');
        } else if (!validatePassword(user.password)) {
            setLoading(false);
            Alert.alert('Pasword nhập không hợp lệ!', 'Password phải có từ 8 ký tự trở lên');
        }
        setLoading(false);
    };

    const PostTaiKhoan = async () => {
        if (success) {
            let formData = new FormData();
            for (let key in user) {
                if (key === 'avatar') {
                    formData.append(key, {
                        uri: user[key].uri,
                        name: user[key].fileName,
                        type: 'image/jpeg'
                    })
                } else
                    formData.append(key, user[key])
            }
            try {
                const response = await APIs.post(endpoints['dang_ky'], formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                });
                console.log(response.data);
                Alert.alert('Tạo tài khoản thành công!');
                navigation.replace("DangNhap");
            } catch (ex) {
                setLoading(false);
                ToastAndroid.show(ex.message, ToastAndroid.LONG);
                Alert.alert('Có lỗi gì đó đã xảy ra');
            } finally {
                setLoading(false);
            }
        }
    };

    const login = () => {
        navigation.replace("DangNhap");
    }

    // Kiểm tra sự thay đổi params của route dùng để check otp có nhập thành công hay không
    React.useEffect(() => {
        if (route.params && route.params.success) {
            setSuccess(route.params.success);
            PostTaiKhoan();
            setSuccess(false);
        }
    }, [route.params])

    return (
        <ScrollView automaticallyAdjustKeyboardInsets={true}>
            <View style={user.avatar ? Styles.container : [Styles.container, { marginTop: 40 }]}>
                <View style={Styles.margin_bottom_40}>
                    <Title numberOfLines={1} ellipsizeMode="tail" style={[Styles.subject, Styles.align_item_center]}>
                        Đăng ký
                    </Title>
                </View>
                {user.avatar && (
                    <View style={[Styles.align_item_center, Styles.margin_bottom_20]}>
                        <Image
                            source={{ uri: user.avatar.uri }}
                            style={Styles.avatar}
                        />
                    </View>
                )}
                <PaperButton mode='contained-tonal' onPress={handleChooseAvatar} style={Styles.margin_bottom_20}>Chọn ảnh đại diện</PaperButton>
                <PaperTextInput
                    label="Email"
                    value={user.email}
                    onChangeText={handleEmailChange}
                    keyboardType="email-address"
                    autoCapitalize="none"
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <PaperTextInput
                    label="Username"
                    value={user.username}
                    onChangeText={handleUsernameChange}
                    autoCapitalize="none"
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <PaperTextInput
                    label="Password"
                    value={user.password}
                    onChangeText={handlePasswordChange}
                    secureTextEntry
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                {loading === true ? <ActivityIndicator /> : <>
                    <PaperButton mode="contained" style={Styles.margin_bottom_20} onPress={validateDangKy}>Đăng ký</PaperButton>
                </>}
                <PaperButton mode="elevated" style={Styles.margin_bottom_20} onPress={login}>Đã có tài khoản? Đăng nhập</PaperButton>
            </View>
        </ScrollView>
    );
};


export default DangKy;