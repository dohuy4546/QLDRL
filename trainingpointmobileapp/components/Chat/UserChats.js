import React from 'react'
import { ScrollView, View, RefreshControl, TouchableOpacity, Image } from 'react-native';
import { Button as PaperButton, Text, Searchbar, ActivityIndicator, List } from 'react-native-paper';
import { db } from '../../firebase';
import { collection, addDoc, query, orderBy, onSnapshot, getDocs, where } from 'firebase/firestore';
import MyContext from '../../configs/MyContext';
import Styles from './Styles';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { list } from 'firebase/storage';
import { authAPI, endpoints } from '../../configs/APIs';

const UserChats = ({ route, navigation }) => {
    const [user] = React.useContext(MyContext);
    const [q, setQ] = React.useState('');
    const [loading, setLoading] = React.useState(false);
    const [userChats, setUserChats] = React.useState([]);
    const roleStr = ["Sinh viên", "Trợ lý SV", "Chuyên viên CTSV"]

    const loadUserChats = async () => {
        const q1 = query(collection(db, "UserChats"), where("users", "array-contains", user.email));

        try {
            setLoading(true);
            const querySnapshot = await getDocs(q1);
            let listUser = [];
            if (!querySnapshot.empty) {
                querySnapshot.forEach((doc) => {
                    doc.data().users.forEach((u) => {
                        if (u != user.email) {
                            listUser.push({
                                "id": doc.id,
                                "user": u
                            });
                        }
                    });
                });
                let token = await AsyncStorage.getItem("access-token");
                let listUserData = [];
                for (u of listUser) {
                    let formData = new FormData();
                    formData.append('email', u.user);
                    let res = await authAPI(token).post(endpoints['tai_khoan_info'], formData, {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    });
                    let data = res.data;
                    data.docId = u.id;
                    listUserData.push(data);
                }
                setUserChats(listUserData);
            } else {
                console.log("Query did not return any documents.");
            }

        } catch (error) {
            console.error("Error loading user chats: ", error);
        } finally {
            setLoading(false);
        }
    }


    React.useEffect(() => {
        loadUserChats();
    }, []);


    return (
        <>
            <View style={{ padding: 10, position: 'absolute', width: '100%', zIndex: 100 }}>
                <PaperButton mode='elevated' onPress={() => navigation.navigate("AddUserChat")}>Thêm cuộc trò chuyện</PaperButton>
            </View>
            <ScrollView keyboardShouldPersistTaps='handled' style={{ marginTop: 60 }}>
                {loading && <ActivityIndicator></ActivityIndicator>}
                {userChats.length != 0 && userChats.map((u) =>
                    <TouchableOpacity style={Styles.margin} key={u.id} onPress={() => navigation.navigate("Chats", {
                        'user': u
                    })}>
                        <List.Item
                            style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                            title={() => <Text numberOfLines={2} ellipsizeMode="tail" style={[Styles.title, Styles.color_primary]}>{u.first_name} {u.last_name}</Text>}
                            description={() => <Text style={{ marginTop: 8 }}>{u.username} - {roleStr[u.role - 1]}</Text>}
                            left={() => <Image source={{ uri: u.avatar }} style={[Styles.avatar, { backgroundColor: "red" }]} />}
                        />
                    </TouchableOpacity>)}
            </ScrollView>
        </>
    )
}

export default UserChats;