import { Button, List, Text } from "react-native-paper"
import APIs, { authAPI, endpoints } from "../../configs/APIs"
import { useContext, useEffect, useState } from "react";
import { ScrollView, TouchableOpacity } from "react-native";
import MyContext from "../../configs/MyContext";
import Styles from "./Styles";
import AsyncStorage from "@react-native-async-storage/async-storage";

const BaoThieuHoatDong = () => {
    const [user, role] = useContext(MyContext);
    const [hoatDong, setHoatDong] = useState([]);
    const [namHoc, setNamHoc] = useState("");
    const [hocKy, setHocKy] = useState("");
    const [trangThai, setTrangThai] = useState("");

    const loadHoatDong = async () => {
        try {
            let url = `${endpoints['tham_gia']}`;
            let res = await APIs.get(url);
            console.log(res.data);
            setHoatDong(res.data)
            hoatDong.map(hd => console.info((user.id === hd.sinh_vien.tai_khoan && hd.state == 0)))

        } catch (error) {
            console.info(error)
        }

    }

    const baoThieu = async (id) => {
        setTrangThai(2)

        const token = await AsyncStorage.getItem('access-token');
        try {
            let res = await authAPI(token).patch(`${endpoints['tham_gia']}${id}/`, {
                'state': trangThai,
            });


        } catch (ex) {
            console.error(ex);
        }
    }

    useEffect(() => {
        loadHoatDong();
    }, []);

    return (
        <ScrollView>
            {hoatDong.map(hd =>
                user.id === hd.sinh_vien.tai_khoan && hd.state == 0 ? (
                    <TouchableOpacity key={hd.id}>
                        <List.Item
                            style={[Styles.subject, Styles.margin]}
                            title={() => <Text style={Styles.title}>{hd.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text>}
                            description={() => <Text style={{ color: "red" }}>Đã đăng kí - chưa điểm danh </Text>}
                            right={() => <Button buttonColor="green" mode="contained" style={{ height: 50 }}
                                onPress={() => {
                                    baoThieu(hd.id);
                                }
                                }>Báo thiếu</Button>}
                        />
                    </TouchableOpacity>
                ) : null
            )}
        </ScrollView>
    )
}

export default BaoThieuHoatDong;