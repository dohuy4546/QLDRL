import React from 'react';
import DangKy from './components/TaiKhoan/DangKy';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import OTP from './components/TaiKhoan/OTP';
import MyContext from './configs/MyContext';
import MyUserReducer from './reducers/MyUserReducer';
import AsyncStorage from '@react-native-async-storage/async-storage';
import DangNhap from './components/TaiKhoan/DangNhap';
import Main from './components/Home/Main';
import APIs, { authAPI, endpoints } from './configs/APIs';
import DangXuat from './components/TaiKhoan/DangXuat';
import QuenMatKhau from './components/TaiKhoan/QuenMatKhau';
import { CLIENT_ID, CLIENT_SECRET } from "@env";
import LoadingScreen from './components/TaiKhoan/Loading';
import { LogBox } from 'react-native';


const Stack = createNativeStackNavigator();


export default function App({ navigation }) {
  const [user, dispatch] = React.useReducer(MyUserReducer, null);
  const [role, setRole] = React.useState();
  const [loading, setLoading] = React.useState(false);
  LogBox.ignoreAllLogs();
  const getAccessToken = async () => {
    try {
      setLoading(true);
      const token = await AsyncStorage.getItem('refresh-token');
      if (token != "null") {
        let res = await APIs.post(endpoints['dang_nhap'], {
          'refresh_token': token,
          'client_id': CLIENT_ID,
          'client_secret': CLIENT_SECRET,
          "grant_type": "refresh_token"
        }, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        });
        await AsyncStorage.setItem('access-token', res.data.access_token)
        await AsyncStorage.setItem('refresh-token', res.data.refresh_token)
        let user = await authAPI(res.data.access_token).get(endpoints['current_taikhoan']);
        dispatch({
          "type": "login",
          "payload": user.data
        });
        setRole(user.data.role);
      } else {
        console.log('Không tìm thấy refresh token trong AsyncStorage');
      }
    } catch (ex) {
      console.log(ex)
    } finally {
      setLoading(false);
    }
  };

  React.useEffect(() => {
    getAccessToken();
  }, []);

  return (
    <MyContext.Provider value={[user, dispatch, role, setRole]}>
      <NavigationContainer>
        <Stack.Navigator screenOptions={{
          headerTitle: 'Quản lý điểm rèn luyện'
        }}>
          {loading == true && <Stack.Screen name="Loading" component={LoadingScreen} />}
          {loading == false && user != null && <Stack.Screen name="Main" component={Main} options={{ headerRight: DangXuat }} />}
          {loading == false && user == null && <Stack.Screen name="DangNhap" component={DangNhap} />}
          <Stack.Screen name="DangKy" component={DangKy} />
          <Stack.Screen name="OTP" component={OTP} />
          <Stack.Screen name="QuenMatKhau" component={QuenMatKhau} />
        </Stack.Navigator>
      </NavigationContainer>
    </MyContext.Provider>
  );
}

