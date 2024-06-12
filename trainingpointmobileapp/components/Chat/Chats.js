import React from 'react'
import { ScrollView, View, RefreshControl, TouchableOpacity, Image } from 'react-native';
import { Button as PaperButton, Text, Searchbar, ActivityIndicator, List, TextInput, Title } from 'react-native-paper';
import { db } from '../../firebase';
import { collection, addDoc, query, orderBy, onSnapshot, getDocs, where, Timestamp } from 'firebase/firestore';
import MyContext from '../../configs/MyContext';
import Styles from './Styles';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { list } from 'firebase/storage';
import { authAPI, endpoints } from '../../configs/APIs';
import moment from 'moment';
import 'moment/locale/vi';

const Chats = ({ route, navigation }) => {
    const [user] = React.useContext(MyContext);
    const [q, setQ] = React.useState('');
    const [loading, setLoading] = React.useState(false);
    const [chats, setChats] = React.useState([]);
    const [message, setMessage] = React.useState();
    const [height, setHeight] = React.useState(45);
    const scrollViewRef = React.useRef();
    const u = route.params.user;

    const loadChats = async () => {
        const q = query(collection(db, "UserChats", u.docId, "Chats"), orderBy("created_date"));
        try {
            const unsubscribe = onSnapshot(q, (snapshot) => {
                let listChat = [];
                snapshot.forEach((doc) => {
                    listChat.push(doc.data());
                });

                setChats(listChat);
            });
            // Remember to unsubscribe when the component unmounts
            return () => unsubscribe();
        } catch (error) {
            console.error("Error loading user chats: ", error);
        }
    }


    const sendMessage = async () => {
        const currentDate = Timestamp.now();
        await addDoc(collection(db, `UserChats/${u.docId}/Chats`), {
            from: user.email,
            created_date: currentDate,
            message: message
        });
        setMessage("");
    }


    React.useEffect(() => {
        navigation.setOptions({
            title: `${u.first_name} ${u.last_name}`,
        })
        loadChats();
    }, []);


    return (
        <View style={loading ? [Styles.container, { justifyContent: 'center' }] : [Styles.container, { marginTop: 50, margin: 10 }]}>
            {loading ? <ActivityIndicator></ActivityIndicator> :
                <ScrollView style={{ width: '100%', marginBottom: 50 }} ref={scrollViewRef}
                    onContentSizeChange={() => scrollViewRef.current.scrollToEnd({ animated: true })}>
                    {chats.map((chat) => {
                        return (
                            <View key={chat.created_date.nanoseconds} style={{ flex: 1, flexDirection: "row", justifyContent: chat.from != user.email ? 'flex-start' : 'flex-end', marginBottom: 10 }}>
                                {chat.from != user.email && <Image source={{ uri: u.avatar }} style={{ alignSelf: 'flex-start', width: 40, height: 40, borderRadius: 40 }} />}
                                <View style={{ maxWidth: '85%', marginLeft: 10 }}>
                                    <View style={{ backgroundColor: 'lightgray', borderRadius: 15, padding: 8, paddingRight: 20 }}>
                                        <Text>
                                            {chat.message}
                                        </Text>
                                    </View>
                                    <Text style={{ color: 'gray', marginLeft: 5 }} >{moment.unix(chat.created_date.seconds).fromNow()}</Text>
                                </View>
                            </View>
                        );
                    })}
                </ScrollView>
            }
            <View style={{
                position: 'absolute', bottom: 10,
                flex: 1, flexDirection: 'row', width: '100%', justifyContent: 'center', alignItems: 'flex-end', paddingHorizontal: 10
            }}>
                < TextInput
                    placeholder="Nhắn tin...."
                    value={message}
                    multiline={true}
                    autoCapitalize="none"
                    mode="outlined"
                    dense={true}
                    onChangeText={text => {
                        setMessage(text);
                    }}
                    onContentSizeChange={event => {
                        setHeight(event.nativeEvent.contentSize.height);
                    }}
                    style={{ maxWidth: '85%', width: '85%', height: height }}
                />
                <PaperButton mode='contained-tonal' onPress={sendMessage}>Gửi</PaperButton>
            </View>
        </View >
    )
}

export default Chats;
