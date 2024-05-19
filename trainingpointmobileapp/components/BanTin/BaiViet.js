import React, { useContext, useState } from 'react';
import { View, Text, Image, TouchableOpacity, StyleSheet, ScrollView, useWindowDimensions, Pressable, Alert } from 'react-native';
import { IconButton, Button as PaperButton } from 'react-native-paper'
import Styles from './Styles';
import CommentModal from './CommentModal';
import APIs, { authAPI, endpoints } from '../../configs/APIs';
import AsyncStorage from '@react-native-async-storage/async-storage';
import RenderHTML from 'react-native-render-html';
import moment from 'moment';
import 'moment/locale/vi'
import { useNavigation } from '@react-navigation/native';

const BaiViet = (props) => {
    const [expanded, setExpanded] = useState(false);
    const [modalVisible, setModalVisible] = useState(false);
    const [baiViet, setBaiViet] = useState(null);
    const [author, setAuthor] = useState(null);
    const [baiVietId, setBaiVietId] = useState(null);
    const [liked, setLiked] = useState(false);
    const [active, setActive] = useState(false);
    const [isDangKy, setIsDangKy] = useState(false);
    const [isDiemDanh, setIsDiemDanh] = useState(false);
    const { width } = useWindowDimensions();
    const navigation = useNavigation();

    const toggleExpand = () => {
        setExpanded(!expanded);
    };

    const handleModalVisible = () => {
        setBaiVietId(baiViet.id);
        setModalVisible(true);
    }

    const handleCloseModal = () => {
        setBaiVietId(null);
        setModalVisible(false);
    }

    const getAuthor = async (id) => {
        const token = await AsyncStorage.getItem("access-token");
        let auth = await authAPI(token).get(endpoints['tac_gia'](id));
        setAuthor(auth.data);
    }

    const handleLiked = async () => {
        const token = await AsyncStorage.getItem("access-token");
        let like = await authAPI(token).post(endpoints['liked'](baiViet.id));
        setLiked(!liked);
    }

    const getStateHoatDong = async (id) => {
        try {
            const token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(endpoints['bai_viet_hoat_dong'](id));
            let hoatdong = res.data;
            if (hoatdong.active == true) {
                setActive(true);
            }
            res = await authAPI(token).get(endpoints['current_thamgia'](hoatdong.id));
            if (res.status == '200') {
                setIsDangKy(true);
            }
        } catch (ex) {
            console.log("Lỗi lòi lz");
        }
    }

    const handleThamGia = async (hoatdong_id) => {
        try {
            const token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(endpoints['current_thamgia'](hoatdong_id));
            let isDiemDanh = res.data.state;
            if (isDiemDanh != 1 && isDiemDanh != 2) {
                let res = await authAPI(token).post(endpoints['tham_gia_hoat_dong'](hoatdong_id));
                if (isDangKy == true) {
                    Alert.alert("Hủy đăng ký thành công!");
                } else {
                    Alert.alert("Đăng ký thành công!");
                }
                setIsDangKy(!isDangKy);
            }
        } catch (ex) {
            console.log(ex);
        }
    }

    // navigation.replace("Main", {
    //     screen: 'Stack',
    //     params: {
    //         screen: 'ChiTietHoatDong',
    //         params: {
    //             hoatdong: hoatdong_id
    //         }
    //     }
    // });

    const checkIsDiemDanh = async (id) => {
        try {
            const token = await AsyncStorage.getItem("access-token");
            let h = await authAPI(token).get(endpoints['bai_viet_hoat_dong'](id));
            let hoatdong = h.data.id;
            let res = await authAPI(token).get(endpoints['current_thamgia'](hoatdong));
            let isThamGia = res.data.state;
            if (isThamGia == 1) {
                setIsDiemDanh(true);
            }
        } catch (ex) {
            console.log(ex)
        }

    }


    React.useEffect(() => {
        if (props && props.baiviet) {
            checkIsDiemDanh(props.baiviet.id);
            getAuthor(props.baiviet.id);
            getStateHoatDong(props.baiviet.id);
            setLiked(props.baiviet.liked);
            setBaiViet(props.baiviet);
        }
    }, [props]);


    return (
        <View style={[Styles.container, Styles.baiViet]}>
            {author === null ? <></> :
                <View style={Styles.header}>
                    <Image source={{ uri: author.avatar }} style={Styles.avatar} />
                    <View>
                        <Text numberOfLines={1} ellipsizeMode="tail" style={Styles.username}>
                            {author.username}
                        </Text>
                        <Text style={{ color: 'gray' }} >{moment(baiViet.created_date).fromNow()}</Text>
                    </View>
                </View>
            }
            {baiViet === null ? <></> : <>
                <Text numberOfLines={1} ellipsizeMode="tail" style={Styles.title}>{baiViet.title}</Text>
                <ScrollView style={{ maxHeight: expanded ? undefined : 50 }}>
                    <Pressable onPress={toggleExpand}>
                        <RenderHTML
                            ellipsizeMode="tail"
                            style={Styles.content}
                            onPress={toggleExpand}
                            source={{ html: baiViet.content }}
                            contentWidth={width}
                        />
                    </Pressable>
                </ScrollView>
                {!expanded && (
                    <Text>...</Text>
                )}
                {baiViet.tags.map(h => <Text key={`${baiViet.id}-${h.id}`} style={Styles.hashtag}>#{h.name}</Text>)}
                {!expanded && (
                    <PaperButton onPress={toggleExpand}>Xem thêm</PaperButton>
                )}
                <Image source={{ uri: baiViet.image }} style={Styles.image} />
                <View style={Styles.bottom}>
                    <PaperButton
                        mode={isDangKy ? 'contained' : 'elevated'}
                        style={{ marginRight: 5, borderRadius: 10 }}
                        onPress={() => handleThamGia(baiViet.hoat_dong_ngoai_khoa)}
                        disabled={isDiemDanh}
                    >
                        {!isDiemDanh ? isDangKy ? 'Hủy đăng ký' : 'Đăng ký' : 'Đã tham gia'}
                    </PaperButton>
                    <PaperButton
                        icon={liked ? 'thumb-up' : 'thumb-up-outline'}
                        size={24}
                        onPress={handleLiked}
                        style={{ marginRight: 5 }}
                        labelStyle={{
                            marginHorizontal: 0, marginVertical: 0, paddingRight: 20, paddingVertical: 10
                            , fontSize: 30
                        }}
                    />
                    <PaperButton onPress={handleModalVisible} mode='elevated'>Bình luận</PaperButton>
                    <CommentModal visible={modalVisible} onClose={handleCloseModal} baiviet={baiVietId}></CommentModal>
                </View>
            </>
            }
        </View>
    );
};


export default BaiViet;
