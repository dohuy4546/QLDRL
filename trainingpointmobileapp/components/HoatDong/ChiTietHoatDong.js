import React, { useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity, useWindowDimensions, ScrollView } from 'react-native';
import { ActivityIndicator, Button as PaperButton } from 'react-native-paper';
import MyContext from '../../configs/MyContext';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { authAPI, endpoints } from '../../configs/APIs';
import RenderHTML from 'react-native-render-html';

const ChiTietHoatDong = ({ route }) => {
    const [user, dispatch, isAuthenticated, setIsAuthenticated, role, setRole] = React.useContext(MyContext);
    const [hoatDong, setHoatDong] = React.useState();
    const [loading, setLoading] = React.useState(false);
    const { hoatdong } = route.params;
    const { width } = useWindowDimensions();
    const [date, setDate] = useState();
    const [time, setTime] = useState();
    const [hocKyNamHoc, setHocKyNamHoc] = useState();

    const handleRegisterPress = () => {
        alert('Bạn đã đăng ký tham gia hoạt động thành công!');
    };

    const getHoatDong = async () => {
        try {
            const token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(`${endpoints['hoat_dong']}?id=${hoatdong}`);
            setHoatDong(res.data[0]);
            const datetime = new Date(res.data[0].ngay);
            const year = datetime.getFullYear();
            const month = ('0' + (datetime.getMonth() + 1)).slice(-2);
            const day = ('0' + datetime.getDate()).slice(-2);
            const hours = ('0' + datetime.getHours()).slice(-2);
            const minutes = ('0' + datetime.getMinutes()).slice(-2);
            setDate(`${day}-${month}-${year}`);
            setTime(`${hours}:${minutes}`);
            const hoc_ky = await authAPI(token).get(endpoints['hocky_namhoc'](res.data[0].hk_nh));
            setHocKyNamHoc(hoc_ky.data);
        } catch (ex) {
            console.log(ex);
        }
    };

    React.useEffect(() => {
        getHoatDong();
    }, [])

    return (
        <ScrollView>
            <View style={styles.container}>
                <Text style={styles.heading}>Chi tiết hoạt động</Text>
                {hoatDong == null || hocKyNamHoc == null ? <></> :
                    <View>
                        <View style={styles.info}>
                            <Text style={styles.label}>
                                Mã hoạt động:
                            </Text>
                            <Text style={styles.fs_20}>
                                {hoatDong.ma_hoat_dong}
                            </Text>
                        </View>
                        <View style={[styles.info, { flexDirection: 'column', alignItems: 'flex-start' }]}>
                            <Text style={styles.label}>
                                Tên hoạt động:
                            </Text>
                            <Text style={styles.fs_20}>
                                {hoatDong.ten_hoat_dong}
                            </Text>
                        </View>
                        <View style={styles.info}>
                            <Text style={styles.label}>
                                Ngày:
                            </Text>
                            <Text style={styles.fs_20}>
                                {date} || {time}
                            </Text>
                        </View>
                        <View style={styles.mb_10}>
                            <Text style={styles.label}>
                                Mô tả:
                            </Text>
                            <RenderHTML
                                source={{ html: hoatDong.description }}
                                contentWidth={width}
                            />
                        </View>
                        <View style={styles.info}>
                            <Text style={styles.label}>
                                Điểm rèn luyện:
                            </Text>
                            <Text style={styles.fs_20}>
                                {hoatDong.diem_ren_luyen}
                            </Text>
                        </View>
                        <View style={styles.info}>
                            <Text style={styles.label}>
                                Điều:
                            </Text>
                            <Text style={styles.fs_20}>
                                {hoatDong.dieu}
                            </Text>
                        </View>
                        <View style={styles.info}>
                            <Text style={styles.label}>
                                Học kỳ:
                            </Text>
                            <Text style={styles.fs_20}>
                                {hocKyNamHoc.hoc_ky}
                            </Text>
                        </View>
                        <View style={styles.info}>
                            <Text style={styles.label}>
                                Năm học:
                            </Text>
                            <Text style={styles.fs_20}>
                                {hocKyNamHoc.nam_hoc}
                            </Text>
                        </View>
                    </View>}
                <PaperButton mode='contained-tonal' style={styles.alignSelf_center}>Đăng ký tham gia</PaperButton>
            </View>
        </ScrollView>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        padding: 20,
        justifyContent: 'space-evenly',
        alignItems: 'flex-start',
        overflow: 'hidden',
    },
    heading: {
        fontSize: 24,
        fontWeight: 'bold',
        marginBottom: 20,
        alignSelf: 'center',
    },
    info: {
        marginBottom: 10,
        flexDirection: 'row',
        alignItems: 'flex-end'
    },
    label: {
        fontWeight: 'bold',
        fontSize: 25,
        marginRight: 20
    },
    fs_20: {
        fontSize: 20,
    },
    mb_20: {
        marginBottom: 20,
    },
    alignSelf_center: {
        alignSelf: 'center',
    }
});

export default ChiTietHoatDong;
