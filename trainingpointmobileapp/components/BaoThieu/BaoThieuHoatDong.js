import { useContext, useEffect, useState } from "react";
import { Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import APIs, { authAPI, endpoints } from "../../configs/APIs";
import Styles from "./Styles";
import { ActivityIndicator, Checkbox, List, Chip, Title, TextInput, Searchbar } from "react-native-paper";
import MyContext from "../../configs/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Picker } from "@react-native-picker/picker";
import ItemHoatDong from "../HoatDong/ItemHoatDong";

const BaoThieuHoatDong = ({ navigation, route }) => {
    const [user, dispatch, role, setRole] = useContext(MyContext);
    const [hoatDong, setHoatDong] = useState([]);
    const [loading, setLoading] = useState(false);
    const [screenId, setScreenId] = useState(1);
    const [mssv, setMssv] = useState("");

    const screen = [{
        "id": 1,
        "label": "Đã đăng ký",
        "icon": "account",
        "name": "daDangKy"
    }, {
        "id": 2,
        "label": "Đang báo thiếu",
        "icon": "account",
        "name": "dangBaoThieu"
    }];

    const screenAdmin = [{
        "id": 1,
        "label": "Khoa",
        "icon": "account",
        "name": "khoa"
    }, {
        "id": 2,
        "label": "Sinh viên",
        "icon": "account",
        "name": "sinhVien"
    }];

    const loadHoatDong = async (q) => {
        setLoading(true)
        try {
            let url;
            if (role != 1 && screenId == 1) {
                url = `${endpoints['tham_gia']}?state=2`;
            } else if (role != 1 && screenId == 2) {
                url = `${endpoints['tham_gia']}?mssv=${q}&state=2`;
            }
            else {
                url = `${endpoints['tham_gia']}?email=${q}&state=${screenId == 1 ? 0 : 2}`;
            }
            console.log(url);
            let token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(url);
            setHoatDong(res.data);
        } catch (error) {
            console.info("hello");
        } finally {
            setLoading(false);
        }
    }

    useEffect(() => {
        if (role == 1) {
            loadHoatDong(user.email);
        } else if (role != 1) {
            loadHoatDong(mssv);
        }
    }, [screenId, mssv]);

    useEffect(() => {
        if (route.params && route?.params?.baoThieu == true) {
            setScreenId(2);
        }
        if (route.params && route?.params?.reload == true) {
            loadHoatDong("");
        }
    }, [route.params])


    return (
        <View style={[Styles.container, Styles.margin]}>
            <ScrollView>
                <Title style={{ alignSelf: "center" }}>Danh sách hoạt động</Title>
                {role == 1 &&
                    <View style={[Styles.row, Styles.wrap, { justifyContent: "center" }]}>
                        {screen.map(s => <Chip mode={
                            s.id == screenId ? "outlined" : "flat"} key={`Tag${s.id}`} onPress={() => setScreenId(s.id)} style={Styles.margin} icon="shape-plus">{s.label}</Chip>)}
                    </View>
                }
                {role == 2 &&
                    <View style={[Styles.row, Styles.wrap, { justifyContent: "center" }]}>
                        {screenAdmin.map(s => <Chip mode={
                            s.id == screenId ? "outlined" : "flat"} key={`Tag${s.id}`} onPress={() => setScreenId(s.id)} style={Styles.margin} icon="shape-plus">{s.label}</Chip>)}
                    </View>
                }
                {!loading && role == 1 && screenId == 1 &&
                    <>
                        {hoatDong.map(hd => {
                            return (
                                <ItemHoatDong hd={hd} description="Đã đăng ký" baoThieu={true} key={`thamgia${hd.id}`} />
                            )
                        }
                        )}
                    </>
                }
                {!loading && role == 1 && screenId == 2 &&
                    <>
                        {hoatDong.map(hd => {
                            return (
                                <ItemHoatDong hd={hd} description="Đang báo thiếu" baoThieu={true} daBaoThieu={true} key={`thamgia${hd.id}`} />
                            )
                        }
                        )}
                    </>
                }
                {!loading && role != 1 && screenId == 1 &&
                    <>
                        {hoatDong.map(hd => {
                            return (
                                <ItemHoatDong hd={hd} description="Đang báo thiếu" baoThieu={true} daBaoThieu={true} key={`thamgia${hd.id}`} />
                            )
                        }
                        )}
                    </>
                }
                {role != 1 && screenId == 2 &&
                    <>
                        <Searchbar placeholder="Nhập từ khóa..." onChangeText={setMssv} value={mssv} />
                        {loading && <ActivityIndicator />}
                        {hoatDong.map(hd => {
                            return (
                                <ItemHoatDong hd={hd} description="Đang báo thiếu" baoThieu={true} daBaoThieu={true} key={`thamgia${hd.id}`} />
                            )
                        }
                        )}
                    </>
                }

            </ScrollView>
        </View>
    )
}

export default BaoThieuHoatDong;