import AsyncStorage from "@react-native-async-storage/async-storage";
import React from "react";
import { useContext, useState } from "react";
import { Text, View, TextInput, TouchableOpacity, Alert } from "react-native"
import { TextInput as PaperTextInput, Title, Button as PaperButton } from "react-native-paper";
import APIs, { endpoints, authAPI } from "../../configs/APIs";
import MyContext from "../../configs/MyContext";
import Styles from "./Styles";
import { SECRET_KEY } from "@env";

const QuenMatKhau = ({ route, navigation }) => {
    const [email, setEmail] = useState();
    const [verify, setVerify] = useState(false);
    const [password, setPassword] = useState();
    const [rePassword, setRePassword] = useState();

    const validateEmail = (email) => {
        const re = /\S+@\S+\.\S+/;
        return re.test(email);
    };

    const validatePassword = (password) => {
        return password.length >= 8 && password == rePassword;
    };

    const sendVerify = async () => {
        if (validateEmail(email)) {
            let check = await APIs.get(`${endpoints['tai_khoan_is_valid']}?email=${email}`);
            if (check.data.is_valid) {
                navigation.navigate('OTP', { email: email, quen_mat_khau: true });
            } else {
                Alert.alert("Email không tồn tại.");
            }
        }
    }

    const doiMatKhau = async () => {
        if (verify && validatePassword(password)) {
            let res = await APIs.patch(endpoints['quen_mat_khau'], {
                'email': email,
                'new_password': password,
                'secret_key': SECRET_KEY
            })
            setVerify(false);
            Alert.alert("Đổi mật khẩu thành công");
            navigation.replace("DangNhap");
        } else if (verify && !validatePassword(password)) {
            if (password == rePassword) {
                Alert.alert('Pasword nhập không hợp lệ!', 'Password phải có từ 8 ký tự trở lên');
            } else {
                Alert.alert('Pasword nhập không hợp lệ!', 'Password không trùng khớp với confirm password');
            }
        }
    }

    React.useEffect(() => {
        if (route.params && route.params.success) {
            setVerify(true);
        }
    }, [route.params])


    return (
        <View style={Styles.container}>
            {verify != true &&
                <>
                    <Text style={[Styles.subject, Styles.margin_bottom_20]}>QUÊN MẬT KHẨU</Text>

                    <Text style={{ fontSize: 20, marginBottom: 10 }}>Nhập email tài khoản: </Text>
                    <PaperTextInput value={email} keyboardType="email-address" label="Email" mode="outlined" onChangeText={t => setEmail(t)} placeholder="Email..." style={Styles.margin_bottom_20} />

                    <PaperButton onPress={sendVerify} mode="contained" style={Styles.margin_bottom_20}>Gửi mail xác nhận</PaperButton>
                    <PaperButton onPress={() => navigation.replace("DangNhap")} mode="elevated">Quay lại đăng nhập</PaperButton>
                </>}
            {verify == true &&
                <>
                    <Text style={[Styles.subject, Styles.margin_bottom_20]}>ĐẶT LẠI MẬT KHẨU</Text>

                    <Text style={{ fontSize: 20, marginBottom: 10 }}>Nhập mật khẩu tài khoản: </Text>
                    <PaperTextInput value={password} secureTextEntry label="Password" mode="outlined" onChangeText={t => setPassword(t)} placeholder="Password..." style={Styles.margin_bottom_20} />
                    <PaperTextInput value={rePassword} secureTextEntry label="Verify password" mode="outlined" onChangeText={t => setRePassword(t)} placeholder="Verify password..." style={Styles.margin_bottom_20} />

                    <PaperButton onPress={doiMatKhau} mode="contained" style={Styles.margin_bottom_20}>Đổi mật khẩu</PaperButton>
                </>}
        </View>
    )
}

export default QuenMatKhau