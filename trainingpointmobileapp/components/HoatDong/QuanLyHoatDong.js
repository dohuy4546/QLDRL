import { useContext, useEffect, useState } from "react";
import { Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import APIs, { authAPI, endpoints } from "../../configs/APIs";
import Styles from "./Styles";
import { ActivityIndicator, Checkbox, List, Chip, Title } from "react-native-paper";
import MyContext from "../../configs/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";

const QuanLyHoatDong = ({ navigation }) => {
    const [user, dispatch, isAuthenticated, setIsAuthenticated, role, setRole] = useContext(MyContext);
    const [hoatDong, setHoatDong] = useState([]);
    const [loading, setLoading] = useState(false);
    const [screenId, setScreenId] = useState(1);
    const [listDieu, setListDieu] = useState([]);
    const screen = [{
        "id": 1,
        "label": "Đã tham gia",
        "icon": "account",
        "name": "daThamGia"
    }, {
        "id": 2,
        "label": "Đã đăng ký",
        "icon": "account",
        "name": "daDangKy"
    }];

    const loadHoatDong = async () => {
        setLoading(true)
        try {
            let url;
            if (role == 1) {
                url = `${endpoints['tham_gia']}?email=${user.email}`;
            }
            else
                url = `${endpoints['hoat_dong']}`;
            let token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(url);
            setHoatDong(res.data);
        } catch (error) {
            console.info(error);
        } finally {
            setLoading(false);
        }
    }

    const loadDieu = async () => {
        let res = await APIs.get(endpoints['dieu']);
        setListDieu(res.data);
    }


    useEffect(() => {
        if (screenId == 1) {
            loadDieu();
        }
        loadHoatDong();
    }, []);


    const stateDisplay = (state) => {
        switch (state) {
            case 0:
                return "Đã đăng kí";
            case 1:
                return "Đã điểm danh";
            case 2:
                return "Đang báo thiếu";
            default:
                break;
        }
    }

    return (
        <View style={[Styles.container, Styles.margin]}>
            <ScrollView>
                {loading && <ActivityIndicator />}
                <Title style={{ alignSelf: "center" }}>Danh sách hoạt động</Title>
                {/* {role == 1 ? <>
                    {hoatDong.map(hd =>
                        user.email === hd.sinh_vien.email && hd.state == 1 ? (
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
                </>} */}
                {role == 1 &&
                    <View style={[Styles.row, Styles.wrap, { justifyContent: "center" }]}>
                        {screen.map(s => <Chip mode={
                            s.id == screenId ? "outlined" : "flat"} key={`Tag${s.id}`} onPress={() => setScreenId(s.id)} style={Styles.margin} icon="shape-plus">{s.label}</Chip>)}
                    </View>}
                {screenId == 1 &&
                    <>
                        {listDieu.map(ld => <TouchableOpacity key={`dieu${ld.id}`}>
                            <List.Item
                                style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                                title={() => <Text style={Styles.title}>{ld.ma_dieu}</Text>}
                                description={() => <Text>{ld.ten_dieu}</Text>}
                            />
                        </TouchableOpacity>)}
                        {hoatDong.map(hd => {
                            if (user.email === hd.sinh_vien.email && hd.state == 1) {
                                return (
                                    <TouchableOpacity key={hd.id}>
                                        <List.Item
                                            style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                                            title={() => <Text style={Styles.title}>{hd.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text>}
                                            description={() => <Text>{stateDisplay(hd.state)}</Text>}
                                            onPress={() => {
                                                navigation.navigate('ChiTietHoatDong', { 'hoat_dong_id': hd.hoat_dong_ngoai_khoa.id });
                                            }}
                                        />
                                    </TouchableOpacity>
                                );
                            } else {
                                return null;
                            }
                        })}
                    </>}
                {screenId == 2 &&
                    <>
                        {hoatDong.map(hd => {
                            if (user.email === hd.sinh_vien.email && hd.state == 0) {
                                return (
                                    <TouchableOpacity key={hd.id}>
                                        <List.Item
                                            style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                                            title={() => <Text style={Styles.title}>{hd.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text>}
                                            description={() => <Text>{stateDisplay(hd.state)}</Text>}
                                            onPress={() => {
                                                navigation.navigate('ChiTietHoatDong', { 'hoat_dong_id': hd.hoat_dong_ngoai_khoa.id });
                                            }}
                                        />
                                    </TouchableOpacity>
                                );
                            } else {
                                return null;
                            }
                        }
                            // (user.email === hd.sinh_vien.email && hd.state == 0) ? (

                            //     <TouchableOpacity key={hd.id}>
                            //         <List.Item
                            //             style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                            //             title={() => <Text style={Styles.title}>{hd.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text>}
                            //             description={() => <Text>{stateDisplay(hd.state)}</Text>}
                            //             onPress={() => {
                            //                 navigation.navigate('ChiTietHoatDong', {'hoat_dong_id': hd.hoat_dong_ngoai_khoa.id });
                            //             }}
                            //         />
                            //     </TouchableOpacity>
                            // ) : null
                        )}
                    </>
                }
            </ScrollView>
        </View>
    )
}

export default QuanLyHoatDong;