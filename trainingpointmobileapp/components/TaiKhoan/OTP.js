import React, { useRef } from "react";
import { View, Button, Text, Alert } from "react-native";
import { Title, Button as PaperButton, TextInput } from "react-native-paper";
import axios from "axios";
import APIs, { endpoints } from "../../configs/APIs";
import Styles from "./Styles";

const OTP = ({ route, navigation }) => {
    const [otp, setOtp] = React.useState(['', '', '', '']);
    const [randomOTP, setRandomOTP] = React.useState(null);
    const inputRefs = useRef(otp.map(() => React.createRef()));

    React.useEffect(() => {
        let randomNumber = Math.floor(Math.random() * 10000);
        let otpNum = randomNumber.toString().padStart(4, '0');
        setRandomOTP(otpNum);
    }, []);

    React.useEffect(() => {
        if (randomOTP) {
            console.log(randomOTP);
            if (route.params && route.params.email) {
                const email = route.params.email;
                sendEmail(email);
            }
        }
    }, [randomOTP]);

    //Hàm gửi mail 
    const sendEmail = async (email) => {
        try {
            const response = await APIs.post(endpoints['send_mail'], {
                subject: 'Xác thực mã OTP',
                message: `Mã OTP của bạn là ${randomOTP}`,
                recipient: email,
            });
            console.log(response.data); // In ra dữ liệu trả về từ Django
        } catch (error) {
            console.error(error);
        }
    };
    // Hàm xử lý thay đổi giá trị của mỗi ô nhập
    const handleChangeText = (num, index) => {
        // Đảm bảo chỉ nhập số và không vượt quá 1 ký tự
        if (/^\d*$/.test(num) && num.length <= 1) {
            const newOtp = [...otp];
            newOtp[index] = num;
            setOtp(newOtp);
            let nextIndex;

            if (num === "") {
                if (index == 0) {
                    nextIndex = 0
                } else {
                    nextIndex = index - 1;
                }
            }
            if (num !== "") {
                if (index == otp.length - 1) {
                    nextIndex = otp.length - 1;
                }
                else {
                    nextIndex = index + 1;
                }
            }
            const inputRef = inputRefs.current[nextIndex];
            inputRef.current.focus();
        }
    };

    const handleSubmit = () => {
        const otpString = otp.join('');
        if (otpString == randomOTP) {
            if (route.params?.quen_mat_khau == true) {
                navigation.navigate('QuenMatKhau', { success: true });
            } else {
                navigation.navigate('DangKy', { success: true });
            }
        } else {
            Alert.alert("Mã OTP nhập không đúng!", "Vui lòng kiểm tra lại OTP");
        }
    }
    return (
        <View style={[Styles.container, Styles.align_item_center, Styles.justify_content_center]}>
            <Title style={[Styles.margin_bottom_40, Styles.subject]}>Nhập mã OTP</Title>
            <View style={{ flexDirection: 'row', justifyContent: 'center', alignItems: 'center', marginBottom: 20 }}>
                {otp.map((value, index) => (
                    <TextInput
                        key={index}
                        style={Styles.OTP_input}
                        value={value}
                        mode="outlined"
                        onChangeText={(num) => handleChangeText(num, index)}
                        keyboardType="numeric"
                        maxLength={1}
                        ref={inputRefs.current[index]}
                    />
                ))}
            </View>
            <PaperButton mode="contained-tonal" onPress={handleSubmit} >Xác nhận</PaperButton>
        </View>
    )
}

export default OTP;