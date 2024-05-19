import { useContext, useEffect, useState } from "react";
import { Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import APIs, { authAPI, endpoints } from "../../configs/APIs";
import Styles from "./Styles";
import { ActivityIndicator, Checkbox, List, Chip, Title, TextInput } from "react-native-paper";
import MyContext from "../../configs/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Picker } from "@react-native-picker/picker";

const QuanLyHoatDong = ({ navigation }) => {
    const [user, dispatch, isAuthenticated, setIsAuthenticated, role, setRole] = useContext(MyContext);
    const [hoatDong, setHoatDong] = useState([]);
    const [loading, setLoading] = useState(false);
    const [screenId, setScreenId] = useState(1);
    const [listDieu, setListDieu] = useState([]);
    const [expandedDieu, setExpandedDieu] = useState(null);
    const [hocky_namhoc, setHocKy_NamHoc] = useState([]);
    const [selectedHocKy, setSelectedHocKy] = useState();
    const [selectedNamHoc, setSelectedNamHoc] = useState();

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
                url = `${endpoints['tham_gia']}?email=${user.email}&hoc_ky=${selectedHocKy}&nam_hoc=${selectedNamHoc}`;
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

    const loadHocKyNamHoc = async () => {
        let res = await APIs.get(endpoints['hocky_namhoc']);
        setHocKy_NamHoc(res.data);
        setSelectedHocKy(res.data[0].hoc_ky);
        setSelectedNamHoc(res.data[0].nam_hoc);
    }

    const toggleDieu = (id) => {
        if (expandedDieu === id) {
            setExpandedDieu(null);
        } else {
            setExpandedDieu(id);
        }
    };


    useEffect(() => {
        if (screenId == 1) {
            loadDieu();
            loadHocKyNamHoc();
        }
        loadHoatDong();
    }, [screenId, selectedHocKy, selectedNamHoc]);


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
                {role == 1 &&
                    <View style={[Styles.row, Styles.wrap, { justifyContent: "center" }]}>
                        {screen.map(s => <Chip mode={
                            s.id == screenId ? "outlined" : "flat"} key={`Tag${s.id}`} onPress={() => setScreenId(s.id)} style={Styles.margin} icon="shape-plus">{s.label}</Chip>)}
                    </View>
                }
                {role == 1 && screenId == 1 &&
                    <>
                        <View style={{ flexDirection: 'row' }}>
                            <Picker
                                style={{ flex: 1 }}
                                selectedValue={selectedHocKy}
                                onValueChange={(itemValue, itemIndex) => setSelectedHocKy(itemValue)}
                                prompt="Học kỳ">
                                {hocky_namhoc.map(hk_nh => (
                                    <Picker.Item label={hk_nh.hoc_ky} value={hk_nh.hoc_ky} key={`hocky${hk_nh.hoc_ky}`} />
                                ))}
                            </Picker>
                            <Picker
                                style={{ flex: 1 }}
                                selectedValue={selectedNamHoc}
                                onValueChange={(itemValue, itemIndex) => setSelectedNamHoc(itemValue)}
                                prompt="Năm học">
                                {hocky_namhoc.map(hk_nh => (
                                    <Picker.Item label={hk_nh.nam_hoc} value={hk_nh.nam_hoc} key={`namhoc${hk_nh.nam_hoc}`} />
                                ))}
                            </Picker>
                        </View>
                        {listDieu.map(ld =>
                            <>
                                <View style={[Styles.background_primary, { borderRadius: 20, margin: 5 }]} key={`dieu${ld.id}`}>
                                    <TouchableOpacity onPress={() => toggleDieu(ld.id)}>
                                        <List.Item
                                            style={[Styles.subject, Styles.background_primary, Styles.bd_radius_20]}
                                            title={() => <Text style={[Styles.title, Styles.color_onPrimary]}>{ld.ma_dieu}</Text>}
                                            description={() => <Text style={[Styles.color_outline]}>{ld.ten_dieu}</Text>}
                                            right={() => (
                                                <View style={{ margin: 10 }}>
                                                    <TextInput.Icon icon="arrow-down" onPress={() => toggleDieu(ld.id)} />
                                                </View>
                                            )}
                                        />
                                    </TouchableOpacity>
                                    {expandedDieu == ld.id && hoatDong.map(hd => {
                                        if (user.email === hd.sinh_vien.email && hd.state == 1 && hd.hoat_dong_ngoai_khoa.dieu == ld.id) {
                                            return (
                                                <TouchableOpacity key={hd.id}>
                                                    <List.Item
                                                        style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                                                        title={() => <Text numberOfLines={2} ellipsizeMode="tail" style={[Styles.title, Styles.color_primary]}>{hd.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text>}
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
                                </View>
                            </>)}
                    </>
                }
                {role == 1 && screenId == 2 &&
                    <>
                        {hoatDong.map(hd => {
                            if (user.email === hd.sinh_vien.email && hd.state == 0) {
                                return (
                                    <TouchableOpacity key={hd.id}>
                                        <List.Item
                                            style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                                            title={() => <Text numberOfLines={2} ellipsizeMode="tail" style={[Styles.title, Styles.color_primary]}>{hd.hoat_dong_ngoai_khoa.ten_hoat_dong}</Text>}
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
                        )}
                    </>
                }
            </ScrollView>
        </View>
    )
}

export default QuanLyHoatDong;