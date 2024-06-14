import React, { useState } from 'react';
import { Modal, View, ScrollView } from 'react-native';
import { TextInput, Button, ActivityIndicator } from 'react-native-paper';
import Styles from './Styles';
import Comment from './Comment';
import APIs, { authAPI, endpoints } from '../../configs/APIs';
import AsyncStorage from '@react-native-async-storage/async-storage';



const CommentModal = ({ visible, onClose, baiviet }) => {
    const [comment, setComment] = useState('');
    const [height, setHeight] = useState(45);
    const [loading, setLoading] = useState(false);
    const [listComment, setListComment] = useState([]);
    const [page, setPage] = useState(1);

    const handlePostComment = async () => {
        if (comment != '') {
            const token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).post(endpoints['comments'](baiviet), {
                'content': comment
            });
            setComment('');
            setHeight(45);
            setPage(1);
            getComments(baiviet);
        }
    };

    const getComments = async (id) => {
        setLoading(true);
        try {
            if (page > 0) {
                const token = await AsyncStorage.getItem("access-token");
                let res = await authAPI(token).get(`${endpoints['comments'](id)}?page=${page}`);
                let comments = res.data;
                if (comments.next === null)
                    setPage(0);
                if (page === 1)
                    setListComment(comments.results);
                else
                    setListComment(current => {
                        return [...current, ...comments.results];
                    });
            }
        } catch (ex) {
            console.log("Lỗi");
        } finally {
            setLoading(false);
        }
    }

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

    React.useEffect(() => {
        if (baiviet != null) {
            getComments(baiviet);
        }
    }, [baiviet, page]);

    return (
        <Modal visible={visible} animationType="slide" >
            <View style={loading ? [Styles.container, { justifyContent: 'center' }] : Styles.container}>
                {loading && page == 1 ? <ActivityIndicator></ActivityIndicator> :
                    <ScrollView style={{ width: '100%', marginBottom: 50 }} onScroll={loadMore}>
                        {listComment.map(c => <Comment comment={c} key={c.id} />)}
                    </ScrollView>
                }
                {loading && page > 1 && <ActivityIndicator></ActivityIndicator>}
                <View style={{
                    position: 'absolute', bottom: 20,
                    flex: 1, flexDirection: 'row', width: '85%', justifyContent: 'center', alignItems: 'flex-end'
                }}>
                    < TextInput
                        placeholder="Bình luận...."
                        value={comment}
                        multiline={true}
                        autoCapitalize="none"
                        mode="outlined"
                        dense={true}
                        onChangeText={text => {
                            setComment(text);
                        }}
                        onContentSizeChange={event => {
                            setHeight(event.nativeEvent.contentSize.height);
                        }}
                        style={{ maxWidth: '80%', width: '80%', height: height }}
                    />
                    <Button mode='contained-tonal' onPress={handlePostComment}>Gửi</Button>
                    <Button mode='contained' onPress={onClose}>X</Button>
                </View>
            </View >
        </Modal >
    );
};

export default CommentModal;
