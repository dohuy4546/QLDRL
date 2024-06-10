import AsyncStorage from "@react-native-async-storage/async-storage";
import React from "react";
import { useContext, useState } from "react";
import { Text, View, TextInput, TouchableOpacity, Alert } from "react-native"
import { TextInput as PaperTextInput, Title, Button as PaperButton } from "react-native-paper";
import APIs, { endpoints, authAPI } from "../../configs/APIs";
import MyContext from "../../configs/MyContext";
import Styles from "./Styles";


const QuenMatKhau = ({ route, navigation }) => {
    const [email, setEmail] = useState();
    const [verify, setVerify] = useState(false);
    const [password, setPassword] = useState();

    const validateEmail = (email) => {
        const re = /\S+@\S+\.\S+/;
        return re.test(email);
    };

    const sendVerify = async () => {
        if (validateEmail(email)) {
            let check = await APIs.get(`${endpoints['tai_khoan_is_valid']}?email=${email}`);
            if (check.data.is_valid) {
                navigation.navigate('OTP', { email: email, quen_mat_khau: true });
            }
        }
    }

    const doiMatKhau = async () => {
        if (verify) {
            console.log("ok");
            let res = await APIs.patch(endpoints['quen_mat_khau'], {
                'email': email,
                'new_password': password,
                'secret_key': "japsdnfkoansokdfnaoksndfoaasojdbfiabwijebfjoansdkmfnlmabsdjonfojabsdnfjonok2n3o4h1oi2n4kobijwnk12oj3no124on12o41"
            })
            console.log(res.data);
            setVerify(false);
            Alert.alert("Đổi mật khẩu thành công");
            navigation.replace("DangNhap");
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
                    <PaperTextInput value={email} label="Email" mode="outlined" onChangeText={t => setEmail(t)} placeholder="Email..." style={Styles.margin_bottom_20} />

                    <PaperButton onPress={sendVerify} mode="contained" style={Styles.margin_bottom_20}>Gửi mail xác nhận</PaperButton>
                    <PaperButton onPress={() => navigation.replace("DangNhap")} mode="elevated">Quay lại đăng nhập</PaperButton>
                </>}
            {verify == true &&
                <>
                    <Text style={[Styles.subject, Styles.margin_bottom_20]}>ĐẶT LẠI MẬT KHẨU</Text>

                    <Text style={{ fontSize: 20, marginBottom: 10 }}>Nhập mật khẩu tài khoản: </Text>
                    <PaperTextInput value={password} secureTextEntry label="Password" mode="outlined" onChangeText={t => setPassword(t)} placeholder="Password..." style={Styles.margin_bottom_20} />

                    <PaperButton onPress={doiMatKhau} mode="contained" style={Styles.margin_bottom_20}>Đổi mật khẩu</PaperButton>
                </>}
        </View>
    )
}

export default QuenMatKhau