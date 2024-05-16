import { useContext, useEffect, useState } from "react";
import { Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import APIs, { authAPI, endpoints } from "../../configs/APIs";
import Styles from "./Styles";
import { ActivityIndicator, Checkbox, List } from "react-native-paper";
import MyContext from "../../configs/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";

const QuanLyHoatDong = ({ navigation }) => {
    const [user, dispatch, isAuthenticated, setIsAuthenticated, role, setRole] = useContext(MyContext);
    const [hoatDong, setHoatDong] = useState([]);
    const [loading, setLoading] = useState(false);


    const loadHoatDong = async () => {
        setLoading(true)
        try {
            let url;
            if (role == 1)
                url = `${endpoints['tham_gia']}`;
            else
                url = `${endpoints['hoat_dong']}`;
            let res = await APIs.get(url);
            setHoatDong(res.data)
        } catch (error) {
            console.info(error);
        } finally {
            setLoading(false);
        }
    }



    useEffect(() => {
        loadHoatDong();
    }, []);


    const stateDisplay = (state) => {
        switch (state) {
            case 0:
                return "Đã đăng kí";
                break;
            case 1:
                return "Đã điểm danh";
                break;
            case 2:
                return "Đang báo thiếu";
                break;
            default:
                break;
        }
    }

    return (
        <View style={[Styles.container, Styles.margin]}>
            <ScrollView>
                {loading && <ActivityIndicator />}
                {role == 1 ? <>
                    {hoatDong.map(hd =>
                        user.id === hd.sinh_vien.tai_khoan ? (
                            <TouchableOpacity key={hd.id}>
                                <List.Item
                                    style={[Styles.subject, Styles.margin]}
                                    title={() => <Text style={Styles.title}>{hd.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text>}
                                    description={() => <Text>{stateDisplay(hd.state)}</Text>}
                                    onPress={() => {
                                        navigation.navigate('ChiTietHoatDong', { 'hoat_dong_id': hd.hoat_dong_ngoai_khoa.id });
                                    }}
                                />
                            </TouchableOpacity>
                        ) : null
                    )}</> : <>
                    {hoatDong.map(hd =>
                        hd.active == true ? (
                            <TouchableOpacity key={hd.id} >
                            <List.Item style={[Styles.subject, Styles.margin]} title={() => <Text style={Styles.title}>{hd.ten_hoat_dong}</Text>}
                                description={() => <Text>{hd.ma_hoat_dong}</Text>}
                                onPress={() => {
                                    navigation.navigate('ChiTietHoatDong', { 'hoat_dong_id': hd.id });
                                }}
                            />
                        </TouchableOpacity>
                        ) : null
                    )}
                </>}

            </ScrollView>
        </View>
    )
}

export default QuanLyHoatDong;