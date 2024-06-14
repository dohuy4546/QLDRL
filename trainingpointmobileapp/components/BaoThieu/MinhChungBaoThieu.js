import { Picker } from "@react-native-picker/picker";
import { ScrollView, View, Image, ActivityIndicator, Alert } from "react-native";
import { TextInput as PaperTextInput, Title, Button as PaperButton, Text } from "react-native-paper";
import React from "react";
import Styles from "./Styles";
import * as ImagePicker from 'expo-image-picker';
import APIs, { authAPI, endpoints } from "../../configs/APIs";
import AsyncStorage from "@react-native-async-storage/async-storage";
import MyContext from "../../configs/MyContext";

const MinhChungBaoThieu = ({ route, navigation }) => {
    const [, , role,] = React.useContext(MyContext);
    const [loading, setLoading] = React.useState(false);
    const [description, setDescription] = React.useState(null);
    const [anhMinhChung, setAnhMinhChung] = React.useState(false);
    const [minhChung, setMinhChung] = React.useState(null);
    const thamGia = route.params?.tham_gia;
    const daBaothieu = route.params?.da_bao_thieu;

    const handlePickImg = async () => {
        let { status } =
            await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
            alert("Permissions denied!");
        } else {
            const result =
                await ImagePicker.launchImageLibraryAsync();
            if (!result.canceled)
                setAnhMinhChung(result.assets[0]);
        }
    };

    const handleBaoThieu = async () => {
        let formData = new FormData();
        formData.append('description', description);
        formData.append('anh_minh_chung', {
            uri: anhMinhChung.uri,
            name: anhMinhChung.fileName,
            type: anhMinhChung.mimeType
        })
        formData.append('tham_gia', thamGia.id);
        try {
            const token = await AsyncStorage.getItem("access-token");
            const response = await authAPI(token).post(endpoints['minh_chung'], formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            const updateState = await authAPI(token).patch(endpoints['bao_thieu_tham_gia'](thamGia.id), {
                'state': 2
            })
            Alert.alert("Báo thiếu thành công");
            navigation.replace('BaoThieu', { baoThieu: true });
        } catch (ex) {
            console.log(ex);
        }
    }

    //Hàm gửi mail 
    const sendEmail = async (subject, message, recipient) => {
        try {
            const response = await APIs.post(endpoints['send_mail'], {
                subject: subject,
                message: message,
                recipient: thamGia.sinh_vien.email,
            });
            console.log(response.data);
        } catch (error) {
            console.error(error);
        }
    };

    const handleConfirm = async () => {
        const token = await AsyncStorage.getItem("access-token");
        const res = await authAPI(token).patch(endpoints['update_tham_gia'](thamGia.id), {
            'state': 1
        });
        sendEmail("Mail xử lí yêu cầu báo thiếu", "Minh chứng báo thiếu của bạn đã được chấp nhận");
        navigation.replace("BaoThieu", { reload: true });
    }

    const handleReject = async () => {
        const token = await AsyncStorage.getItem("access-token");
        const res = await authAPI(token).patch(endpoints['update_tham_gia'](thamGia.id), {
            'state': 0
        });
        const del = await authAPI(token).delete(endpoints['huy_minh_chung'](minhChung.id));
        sendEmail("Mail xử lí yêu cầu báo thiếu", "Minh chứng báo thiếu của bạn đã bị từ chối. Vui lòng gửi minh chứng khác!");
        navigation.replace("BaoThieu", { reload: true });
    }

    const getMinhChung = async () => {
        const token = await AsyncStorage.getItem("access-token");
        const res = await authAPI(token).get(`${endpoints['minh_chung']}?tham_gia=${thamGia.id}`);
        setMinhChung(res.data[0]);
        setAnhMinhChung(res.data[0].anh_minh_chung);
    }

    React.useEffect(() => {
        if (route.params && daBaothieu == true) {
            getMinhChung();
        }
    }, [route])

    return (
        <ScrollView automaticallyAdjustKeyboardInsets={true} >
            <View style={[Styles.container, Styles.m_20]}>
                <Title style={[Styles.subject, Styles.margin_bottom_20, { alignSelf: "center" }]}>Báo thiếu</Title>
                <Text style={[Styles.margin_bottom_20, { fontSize: 18 }]}>Mã hoạt động: <Text style={Styles.title}>{thamGia.hoat_dong_ngoai_khoa.ma_hoat_dong}</Text></Text>
                <Text style={[Styles.margin_bottom_20, { fontSize: 18 }]}>Tên hoạt động: <Text style={Styles.title}>{thamGia.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text></Text>
                <Text style={[Styles.margin_bottom_20, { fontSize: 18 }]}>Họ tên sinh viên: <Text style={Styles.title}>{thamGia.sinh_vien.ho_ten}</Text></Text>
                <Text style={[Styles.margin_bottom_20, { fontSize: 18 }]}>MSSV: <Text style={Styles.title}>{thamGia.sinh_vien.mssv}</Text></Text>
                <PaperTextInput
                    label="Ghi chú"
                    autoCapitalize="none"
                    onChangeText={setDescription}
                    value={daBaothieu ? minhChung != null ? minhChung.description : "" : description}
                    mode="outlined"
                    multiline={true}
                    numberOfLines={8}
                    disabled={daBaothieu}
                    style={Styles.margin_bottom_20}
                />
                {daBaothieu != true && <PaperButton mode='contained-tonal' onPress={handlePickImg} style={Styles.margin_bottom_20}>Chọn ảnh minh chứng</PaperButton>}
                {anhMinhChung && (
                    <View style={[Styles.align_item_center, Styles.margin_bottom_20]}>
                        <Image
                            source={{ uri: daBaothieu ? anhMinhChung : anhMinhChung.uri }}
                            style={Styles.anh_minh_chung}
                        />
                    </View>
                )}

                {loading === true ? <ActivityIndicator /> : <>
                    {daBaothieu != true && <PaperButton mode="elevated" onPress={handleBaoThieu}>Xác nhận báo thiếu</PaperButton>}
                    {daBaothieu && role != 1 &&
                        <View style={{ flex: 1, flexDirection: "row" }}>
                            <PaperButton mode="elevated" onPress={handleReject} style={{ flex: 1, margin: 5 }}>Từ chối</PaperButton>
                            <PaperButton mode="contained" onPress={handleConfirm} style={{ flex: 1, margin: 5 }}>Chấp nhận</PaperButton>
                        </View>}
                </>}
            </View>
        </ScrollView>
    )
}

export default MinhChungBaoThieu;