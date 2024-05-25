import React from 'react'
import { TouchableOpacity } from 'react-native';
import { Button, List, Text } from 'react-native-paper';
import Styles from './Styles';
import { useNavigation } from '@react-navigation/native';


const ItemHoatDong = (props) => {
    const navigation = useNavigation();
    return (
        <TouchableOpacity>
            <List.Item
                style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                title={() => <Text numberOfLines={2} ellipsizeMode="tail" style={[Styles.title, Styles.color_primary]}>{props.hd.hoat_dong_ngoai_khoa?.ten_hoat_dong || props.hd.ten_hoat_dong}</Text>}
                description={() => <Text>{props?.description}</Text>}
                onPress={() => {
                    if (props?.baoThieu == true) {
                        navigation.navigate('MinhChungBaoThieu', {
                            'tham_gia': props?.hd,
                            'da_bao_thieu': props?.daBaoThieu ? true : false
                        });
                    }
                    else {
                        navigation.navigate('ChiTietHoatDong', {
                            'hoat_dong_id': props.hd.hoat_dong_ngoai_khoa?.id || props.hd.id,
                            'xuatExcel': props?.xuatExcel ? true : null,
                        });
                    }
                }}
            />

        </TouchableOpacity>
    )
}

export default ItemHoatDong;

