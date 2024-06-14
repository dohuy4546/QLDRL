import React from 'react'
import { ScrollView, View, RefreshControl, TouchableOpacity, Image, Alert } from 'react-native';
import { Button as PaperButton, Text, Searchbar, ActivityIndicator, List } from 'react-native-paper';
import { db } from '../../firebase';
import { collection, addDoc, query, orderBy, onSnapshot, getDocs, where, Timestamp } from 'firebase/firestore';
import Styles from './Styles';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { authAPI, endpoints } from '../../configs/APIs';
import MyContext from '../../configs/MyContext';

const AddUserChats = ({ route, navigation }) => {
    const [q, setQ] = React.useState('');
    const [loading, setLoading] = React.useState(false);
    const [listUser, setListUser] = React.useState([]);
    const [user, , role] = React.useContext(MyContext);
    const roleStr = ["Sinh viên", "Trợ lý SV", "Chuyên viên CTSV"]

    const loadUsers = async () => {
        if (role == 1) {
            let token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(`${endpoints['tro_ly']}?q=${q}`);
            setListUser(res.data);
        } else {
            let token = await AsyncStorage.getItem("access-token");
            let res = await authAPI(token).get(`${endpoints['tai_khoan_sinh_vien']}?q=${q}`);
            setListUser(res.data);
        }
    }

    const addUserChat = async (email) => {
        const listEmail = [user.email, email];
        const currentDate = Timestamp.now();
        const q1 = query(collection(db, "UserChats"), where("users", "array-contains", user.email));
        try {
            const querySnapshot = await getDocs(q1);
            if (!querySnapshot.empty) {
                let check = false;
                querySnapshot.forEach((doc) => {
                    if (doc.data().users.includes(email)) {
                        check = true;
                        Alert.alert("Người dùng này đã có trò chuyện");
                    }
                });
                if (check == false) {
                    const userCollectionRef = collection(db, 'UserChats');
                    const newData = {
                        users: listEmail,
                        created_date: currentDate
                    };
                    const docRef = await addDoc(userCollectionRef, newData);
                    console.log("Document added with ID: ", docRef.id);
                    Alert.alert("Đã thêm thành công");
                }
            } else {
                // Trường hợp không có userchats của user hiện tại => không có userchat giữa user hiện tại và user cần thêm 
                // Thêm userchats giữa user hiện tại và user cần thêm
                console.log("Query did not return any documents.");
                const userCollectionRef = collection(db, 'UserChats');
                const newData = {
                    users: listEmail,
                    created_date: currentDate
                };
                const docRef = await addDoc(userCollectionRef, newData);
                console.log("Document added with ID: ", docRef.id);
                Alert.alert("Đã thêm thành công");
            }
        } catch (error) {
            console.error("Error loading user chats: ", error);
        }
    }


    React.useEffect(() => {
        loadUsers();
    }, [q]);


    return (
        <>
            <View style={{ padding: 10, position: 'absolute', width: '100%', zIndex: 100, top: 40 }}>
                <Searchbar placeholder="Nhập tên người dùng..." onChangeText={setQ} value={q} />
            </View>
            <ScrollView keyboardShouldPersistTaps='handled' style={{ marginTop: 110 }}>
                {listUser.length != 0 && listUser.map((u) =>
                    <TouchableOpacity style={Styles.margin} key={u.id} disabled>
                        <List.Item
                            style={[Styles.subject, Styles.margin, Styles.background_item, Styles.bd_radius_20]}
                            title={() => <Text numberOfLines={2} ellipsizeMode="tail" style={[Styles.title, Styles.color_primary]}>{u.first_name} {u.last_name}</Text>}
                            description={() => <Text style={{ marginTop: 8 }}>{u.username} - {roleStr[u.role - 1]}</Text>}
                            left={() => <Image source={{ uri: u.avatar }} style={[Styles.avatar, { backgroundColor: "red" }]} />}
                            right={() => <PaperButton mode='contained' style={{ width: "auto", margin: 'auto' }} onPress={() => addUserChat(u.email)}>+</PaperButton>}
                        />
                    </TouchableOpacity>)}

            </ScrollView>
        </>
    )
}

export default AddUserChats;