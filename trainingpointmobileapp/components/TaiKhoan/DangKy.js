import React, { useState } from "react";
import { View, TextInput, Button, Image, Text, Alert, ActivityIndicator, ScrollView, KeyboardAvoidingView, ToastAndroid } from "react-native";
import { TextInput as PaperTextInput, Title, Dialog, Portal, PaperProvider, Button as PaperButton } from "react-native-paper";
import * as ImagePicker from 'expo-image-picker';
import axios from "axios";
import APIs, { endpoints } from "../../configs/APIs";
import { useNavigation } from "@react-navigation/native";
import { useContext } from "../../App";
import Styles from "./Styles";


const DangKy = ({ route, navigation }) => {
    const [email, setEmail] = React.useState("");
    const [password, setPassword] = React.useState("");
    const [avatar, setAvatar] = React.useState(null);
    const [loading, setLoading] = React.useState(false);
    const [success, setSuccess] = React.useState(false);
    const handleEmailChange = (text) => {
        setEmail(text);
    };

    const handlePasswordChange = (text) => {
        setPassword(text);
    };

    const handleChooseAvatar = async () => {
        let { status } =
            await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
            alert("Permissions denied!");
        } else {
            const result =
                await ImagePicker.launchImageLibraryAsync();
            if (!result.canceled)
                setAvatar(result.assets[0]);
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
        if (validateEmail(email) && validatePassword(password) && avatar) {
            let sv_valid = false; // Đã có sinh viên
            let tk_valid = false; // Đã có tài khoản
            try {
                let url = `${endpoints['sinh_vien_is_valid']}?email=${email}`;
                let check = await APIs.get(`${endpoints['sinh_vien_is_valid']}?email=${email}`);
                if (check.status == 200) {
                    sv_valid = true;
                }
            } catch (ex) {
                setLoading(false);
                ToastAndroid.show(ex.message, ToastAndroid.LONG);
            }
            try {
                let check = await APIs.get(`${endpoints['tai_khoan_is_valid']}?email=${email}`);
                if (check.status == 200) {
                    res = check.data.is_valid;
                    if (res == true) {
                        tk_valid = true;
                    }
                }
            } catch (ex) {
                setLoading(false);
                ToastAndroid.show(ex.message, ToastAndroid.LONG);
                Alert.alert('Có lỗi gì đó đã xảy ra', 'Tài khoản không hợp lệ!');
            }
            if (sv_valid == true && tk_valid == false) {
                navigation.navigate('OTP', { email: email });
            } else if (sv_valid == false) {
                setLoading(false);
                Alert.alert('Có lỗi gì đó xảy ra', 'Sinh viên không tồn tại!');
            } else if (tk_valid == true) {
                setLoading(false);
                Alert.alert('Có lỗi gì đó xảy ra', 'Tài khoản sinh viên đã tồn tại');
            }
        } else if (!avatar) {
            setLoading(false);
            Alert.alert('Có lỗi gì đó xảy ra', 'Avatar không tồn tại!');
        } else if (!validateEmail(email)) {
            setLoading(false);
            Alert.alert('Có lỗi gì đó xảy ra', 'Email nhập không hợp lệ!');
        } else if (!validatePassword(password)) {
            setLoading(false);
            Alert.alert('Pasword nhập không hợp lệ!', 'Password phải có từ 8 ký tự trở lên');
        }
        setLoading(false);
    };
    const PostTaiKhoan = async () => {
        const formData = new FormData();
        formData.append('username', email.split('@')[0]);
        formData.append('password', password);
        formData.append('email', email);
        formData.append('role', '1');
        formData.append('avatar', {
            'uri': avatar.uri,
            'name': avatar.fileName,
            'type': 'image/jpeg'
        });
        console.log(formData);
        try {
            const response = await APIs.post(endpoints['dang_ky'], formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            console.log(response.data);
            Alert.alert('Tạo tài khoản thành công!');
        } catch (ex) {
            setLoading(false);
            ToastAndroid.show(ex.message, ToastAndroid.LONG);
            Alert.alert('Có lỗi gì đó đã xảy ra');
        } finally {
            setLoading(false);
        }
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
            <View style={avatar ? Styles.container : [Styles.container, { marginTop: 40 }]}>
                <View style={Styles.margin_bottom_40}>
                    <Title numberOfLines={1} ellipsizeMode="tail" style={[Styles.subject, Styles.align_item_center]}>
                        Đăng ký
                    </Title>
                </View>
                {avatar && (
                    <View style={[Styles.align_item_center, Styles.margin_bottom_20]}>
                        <Image
                            source={{ uri: avatar.uri }}
                            style={Styles.avatar}
                        />
                    </View>
                )}
                <PaperButton mode='contained-tonal' onPress={handleChooseAvatar} style={Styles.margin_bottom_20}>Chọn ảnh đại diện</PaperButton>
                <PaperTextInput
                    label="Email"
                    value={email}
                    onChangeText={handleEmailChange}
                    keyboardType="email-address"
                    autoCapitalize="none"
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <PaperTextInput
                    label="Password"
                    value={password}
                    onChangeText={handlePasswordChange}
                    secureTextEntry
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                {loading === true ? <ActivityIndicator /> : <>
                    <PaperButton mode="elevated" onPress={validateDangKy}>Đăng ký</PaperButton>
                </>}
            </View>
        </ScrollView>
    );
};


export default DangKy;