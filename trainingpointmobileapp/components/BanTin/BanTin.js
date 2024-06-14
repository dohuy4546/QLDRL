import React from 'react'
import { ScrollView, View, RefreshControl } from 'react-native';
import { Button, Text, Searchbar, ActivityIndicator } from 'react-native-paper';
import BaiViet from './BaiViet';
import APIs, { authAPI, endpoints } from '../../configs/APIs';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { getAuth } from 'firebase/auth';

const BanTin = ({ route, navigation }) => {
    const [q, setQ] = React.useState('');
    const [baiViets, setBaiViets] = React.useState([]);
    const [page, setPage] = React.useState(1);
    const [loading, setLoading] = React.useState(false);
    const loadBaiViets = async () => {
        try {
            if (page > 0) {
                setLoading(true);
                const token = await AsyncStorage.getItem('access-token');
                if (token) {
                    let baiviets = await authAPI(token).get(`${endpoints['bai_viet']}?page=${page}&q=${q}`);
                    if (baiviets.data.next === null)
                        setPage(0);
                    if (page === 1)
                        setBaiViets(baiviets.data.results);
                    else
                        setBaiViets(current => {
                            return [...current, ...baiviets.data.results];
                        });
                }
            }
        } catch (ex) {
        } finally {
            setLoading(false);
        }
    }

    React.useEffect(() => {
        loadBaiViets();
    }, [q, page]);

    const isCloseToBottom = ({ layoutMeasurement, contentOffset, contentSize }) => {
        const paddingToBottom = 20;
        return layoutMeasurement.height + contentOffset.y >=
            contentSize.height - paddingToBottom;
    };

    const loadMore = ({ nativeEvent }) => {
        if (!loading && page > 0 && isCloseToBottom(nativeEvent)) {
            setPage(page + 1);
        }
    }

    const search = (value, callback) => {
        setPage(1);
        callback(value);
    }

    return (
        <>
            <View style={{ padding: 10, position: 'absolute', width: '100%', zIndex: 100 }}>
                <Searchbar placeholder="Nhập từ khóa..." onChangeText={(t) => search(t, setQ)} value={q} />
            </View>
            <ScrollView keyboardShouldPersistTaps='handled' style={{ marginTop: 70 }} onScroll={loadMore}>
                <RefreshControl onRefresh={() => loadBaiViets()} />
                {loading && page == 1 && <ActivityIndicator></ActivityIndicator>}
                {baiViets === null && baiViets.length != 0 ? <></> :
                    <>
                        {baiViets.map(b => {
                            return (
                                <BaiViet
                                    key={`baiViet${b.id}`}
                                    baiviet={b}
                                />
                            );
                        })}
                    </>}
                {loading && page > 1 && <ActivityIndicator />}
            </ScrollView>
        </>
    )
}

export default BanTin;