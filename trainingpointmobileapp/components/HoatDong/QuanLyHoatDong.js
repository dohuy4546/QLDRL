import { useContext, useEffect, useState } from "react";
import { Image, ScrollView, Text, TouchableOpacity, View } from "react-native";
import APIs, { authAPI, endpoints } from "../../configs/APIs";
import Styles from "./Styles";
import { ActivityIndicator, Checkbox, List, Chip, Title, TextInput, Searchbar } from "react-native-paper";
import MyContext from "../../configs/MyContext";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Picker } from "@react-native-picker/picker";
import ItemHoatDong from "./ItemHoatDong";

const QuanLyHoatDong = ({ navigation }) => {
    const [user, dispatch, role, setRole] = useContext(MyContext);
    const [hoatDong, setHoatDong] = useState([]);
    const [loading, setLoading] = useState(false);
    const [screenId, setScreenId] = useState(1);
    const [listDieu, setListDieu] = useState([]);
    const [expandedDieu, setExpandedDieu] = useState(null);
    const [hocky_namhoc, setHocKy_NamHoc] = useState([]);
    const [selectedHocKy, setSelectedHocKy] = useState();
    const [selectedNamHoc, setSelectedNamHoc] = useState();
    const [mssv, setMssv] = useState("");
    const [tongDiemDieu, setTongDiemDieu] = useState([]);
    const [tongDiem, setTongDiem] = useState();

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

    const screenAdmin = [{
        "id": 1,
        "label": "Đang hoạt động",
        "icon": "account",
        "name": "dangHoatDong"
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
                url = `${endpoints['hoat_dong']}`;
            } else if (role != 1 && screenId == 2) {
                url = `${endpoints['tham_gia']}?mssv=${q}&hoc_ky=${selectedHocKy}&nam_hoc=${selectedNamHoc}&state=1`;
            }
            else {
                url = `${endpoints['tham_gia']}?email=${q}&hoc_ky=${selectedHocKy}&nam_hoc=${selectedNamHoc}&state=${screenId == 1 ? 1 : 0}`;
            }
            let token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(url);
            setHoatDong(res.data);
        } catch (error) {
            console.info("hello");
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
        if (selectedHocKy == null && selectedNamHoc == null) {
            setSelectedHocKy(res.data[0].hoc_ky);
            setSelectedNamHoc(res.data[0].nam_hoc);
        }
    }

    const toggleDieu = (id) => {
        if (expandedDieu === id) {
            setExpandedDieu(null);
        } else {
            setExpandedDieu(id);
        }
    };

    useEffect(() => {
        if ((screenId == 1 && role == 1) || (screenId == 2 && role != 1)) {
            loadDieu();
            loadHocKyNamHoc();
        }
        if (role == 1 && selectedHocKy != null && selectedNamHoc != null) {
            loadHoatDong(user.email);
        } else if (role != 1) {
            loadHoatDong(mssv);
        }
    }, [screenId, selectedHocKy, selectedNamHoc, mssv]);

    useEffect(() => {
        console.log(hoatDong);
    }, [screenId])


    const loadTongDiem = async () => {
        setTongDiem(0);
        const token = await AsyncStorage.getItem("access-token");
        let url = "";
        if (role == 1) {
            url = `${endpoints['tong_diem']}?email=${user.email}&hk=${selectedHocKy}&nh=${selectedNamHoc}`;
        } else {
            url = `${endpoints['tong_diem']}?mssv=${mssv}&hk=${selectedHocKy}&nh=${selectedNamHoc}`;
        }
        let res = await authAPI(token).get(url);
        setTongDiem(res.data[0]?.diem_tong);
    }

    const loadDiemTheoDieu = () => {
        let sinhvien = "";
        if (role == 1) {
            sinhvien = user.email;
        } else {
            sinhvien = mssv;
        }
        if (listDieu.length != 0 && hoatDong.length == 0 && sinhvien) {
            for (dieu of listDieu) {
                tongDiemDieu[dieu.id] = 0;
            }
        }
        if (listDieu.length != 0 && hoatDong.length != 0 && sinhvien) {
            for (dieu of listDieu) {
                tongDiemDieu[dieu.id] = 0;
                for (hd of hoatDong) {
                    if (role == 1) {
                        if (hd.sinh_vien.email == sinhvien && hd.state == 1 && hd.hoat_dong_ngoai_khoa.dieu == dieu.id) {
                            tongDiemDieu[dieu.id] += hd.hoat_dong_ngoai_khoa.diem_ren_luyen;
                        }
                    }
                    else if (hd.sinh_vien.mssv == sinhvien && hd.state == 1 && hd.hoat_dong_ngoai_khoa.dieu == dieu.id) {
                        tongDiemDieu[dieu.id] += hd.hoat_dong_ngoai_khoa.diem_ren_luyen;
                    }
                }
                if (tongDiemDieu[dieu.id] > dieu.diem_toi_da) {
                    tongDiemDieu[dieu.id] = dieu.diem_toi_da;
                }
            }
        }
    }

    useEffect(() => {
        loadTongDiem();
        loadDiemTheoDieu();
    }, [listDieu, hoatDong, mssv])


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
                        <Title>Tổng điểm: {tongDiem}</Title>
                        {listDieu.map(ld =>
                            <>
                                <View style={[Styles.background_primary, { borderRadius: 20, margin: 5 }]} key={`dieu${ld.id}`}>
                                    <TouchableOpacity onPress={() => toggleDieu(ld.id)}>
                                        <List.Item
                                            style={[Styles.subject, Styles.background_primary, Styles.bd_radius_20]}
                                            title={() => <Text style={[Styles.title, Styles.color_onPrimary]}>{ld.ma_dieu}</Text>}
                                            description={() => <Text style={[Styles.color_outline]}>{ld.ten_dieu}</Text>}
                                            right={() => (
                                                <>
                                                    <Text style={[Styles.color_onPrimary, { margin: 10 }]}>Tổng điểm: {tongDiemDieu[ld.id]}</Text>
                                                    <View style={{ margin: 10 }}>
                                                        <TextInput.Icon icon="arrow-down" onPress={() => toggleDieu(ld.id)} />
                                                    </View>
                                                </>
                                            )}
                                        />
                                    </TouchableOpacity>
                                    {expandedDieu == ld.id && hoatDong.map(hd => {
                                        if (user.email === hd.sinh_vien.email && hd.state == 1 && hd.hoat_dong_ngoai_khoa.dieu == ld.id) {
                                            return (
                                                <ItemHoatDong hd={hd} description="Đã tham gia" key={`hd${hd.id}`} />
                                            );
                                        } else {
                                            return null;
                                        }
                                    })}
                                </View>
                            </>)}
                    </>
                }
                {!loading && role == 1 && screenId == 2 &&
                    <>
                        {hoatDong.map(hd => {
                            return (
                                <ItemHoatDong hd={hd} description="Đã đăng ký" key={`hd${hd.id}`} />
                            )
                        }
                        )}
                    </>
                }
                {!loading && role != 1 && screenId == 1 &&
                    <>
                        {hoatDong.map(hd =>
                            <ItemHoatDong hd={hd} description="Đang hoạt động" xuatExcel={true} key={`hd${hd.id}`} />
                        )}
                    </>
                }
                {role != 1 && screenId == 2 &&
                    <>
                        <Searchbar placeholder="Nhập từ khóa..." onChangeText={setMssv} value={mssv} />
                        <View style={{ flexDirection: 'row' }}>
                            <Picker
                                style={{ flex: 1 }}
                                selectedValue={selectedHocKy}
                                onValueChange={(itemValue, itemIndex) => setSelectedHocKy(itemValue)}
                                prompt="Học kỳ">
                                {hocky_namhoc.map(hk_nh => (
                                    <Picker.Item label={hk_nh.hoc_ky} value={hk_nh.hoc_ky} key={`hocky${hk_nh.hoc_ky}`} />
                                ))}
                                <Picker.Item label={2} value={2} key={'hocky2'} />
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
                        {loading && <ActivityIndicator />}
                        {hoatDong.length != 0 && mssv != "" && <Title style={{ margin: 10 }}>Tổng điểm: {tongDiem}</Title>}
                        {hoatDong.length != 0 && mssv != "" && listDieu.map(ld =>
                            <>
                                <View style={[Styles.background_primary, { borderRadius: 20, margin: 5 }]} key={`dieu${ld.id}`}>
                                    <TouchableOpacity onPress={() => toggleDieu(ld.id)}>
                                        <List.Item
                                            style={[Styles.subject, Styles.background_primary, Styles.bd_radius_20]}
                                            title={() => <Text style={[Styles.title, Styles.color_onPrimary]}>{ld.ma_dieu}</Text>}
                                            description={() => <Text style={[Styles.color_outline]}>{ld.ten_dieu}</Text>}
                                            right={() => (
                                                <>
                                                    <Text style={[Styles.color_onPrimary, { margin: 10 }]}>Tổng điểm: {tongDiemDieu[ld.id]}</Text>
                                                    <View style={{ margin: 10 }}>
                                                        <TextInput.Icon icon="arrow-down" onPress={() => toggleDieu(ld.id)} />
                                                    </View>
                                                </>
                                            )}
                                        />
                                    </TouchableOpacity>
                                    {expandedDieu == ld.id && hoatDong != null && hoatDong.map(hd => {
                                        if (hd.hoat_dong_ngoai_khoa?.dieu == ld.id) {
                                            return (
                                                <ItemHoatDong hd={hd} description="Đã tham gia" key={`hd${hd.id}`} />
                                            );
                                        } else {
                                            return null;
                                        }
                                    })}
                                </View>
                            </>)}
                    </>
                }
            </ScrollView>
        </View>
    )
}

export default QuanLyHoatDong;