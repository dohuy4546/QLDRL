import AsyncStorage from "@react-native-async-storage/async-storage";
import { useContext, useState } from "react";
import { Text, View, TextInput, TouchableOpacity } from "react-native"
import { TextInput as PaperTextInput, Title, Button as PaperButton } from "react-native-paper";
import APIs, { endpoints, authAPI } from "../../configs/APIs";
import MyContext from "../../configs/MyContext";
import Styles from "./Styles";


const DangNhap = ({ navigation }) => {
    const [username, setUsername] = useState();
    const [password, setPassword] = useState();
    const [user, dispatch, role, setRole] = useContext(MyContext);

    const login = async () => {
        try {
            let res = await APIs.post(endpoints['dang_nhap'], {
                'username': username,
                'password': password,
                'client_id': "gSyJ0fZ4vNY2ULgKf3QpY2iqjJbPuqbo4PvK63Yt",
                'client_secret': "FpZOpVQqwEyoH3K3bEkHkLDFNTm88M05dbPYERPY4cfzAUbGMT8hj3j1BA8JVymQsNkym4uSyI7jAExlhjA4ohb4LTgGa65EZnFPx55niUtJZVbom2NcJY1I1JgnXUMX",
                "grant_type": "password"
            }, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            console.info(res.data)

            await AsyncStorage.setItem('access-token', res.data.access_token)

            let user = await authAPI(res.data.access_token).get(endpoints['current_taikhoan']);
            let user_role = user.data.role;
            setRole(user_role);
            dispatch({
                "type": "login",
                "payload": user.data
            });
            console.log(user.data.role);
            console.log(user_role);
        } catch (ex) {
            console.error(ex);
        }
    };

    const register = () => {
        navigation.replace("DangKy");
    }

    return (
        <View style={Styles.container}>
            <Text style={[Styles.subject, Styles.margin_bottom_20]}>ĐĂNG NHẬP</Text>

            <PaperTextInput value={username} label="Username" mode="outlined" onChangeText={t => setUsername(t)} placeholder="Username..." style={Styles.margin_bottom_20} />
            <PaperTextInput value={password} label="Password" mode="outlined" onChangeText={t => setPassword(t)} secureTextEntry={true} placeholder="Password..." style={Styles.margin_bottom_20} />

            <PaperButton onPress={login} mode="contained" style={Styles.margin_bottom_20}>Đăng nhập</PaperButton>
            <PaperButton onPress={register} mode="elevated" style={Styles.margin_bottom_20}>Đăng ký</PaperButton>
            <PaperButton onPress={() => navigation.replace("QuenMatKhau")} mode="elevated">Quên mật khẩu?</PaperButton>
        </View >
    )
}

export default DangNhap