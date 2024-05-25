import React from 'react';
import DangKy from './components/TaiKhoan/DangKy';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import OTP from './components/TaiKhoan/OTP';
import MyContext from './configs/MyContext';
import ThemTroLySinhVien from './components/Home/ThemTroLySinhVien';
import MyUserReducer from './reducers/MyUserReducer';
import AsyncStorage from '@react-native-async-storage/async-storage';
import DangNhap from './components/TaiKhoan/DangNhap';
import Main from './components/Home/Main';
import { authAPI, endpoints } from './configs/APIs';
import Logout from './components/TaiKhoan/DangXuat';
import BaiViet from './components/BanTin/BaiViet';
import DangXuat from './components/TaiKhoan/DangXuat';
import QuanLyHoatDong from './components/HoatDong/QuanLyHoatDong';
import ChiTietHoatDong from './components/HoatDong/ChiTietHoatDong';



const Stack = createNativeStackNavigator();


export default function App({ navigation }) {
  const [user, dispatch] = React.useReducer(MyUserReducer, null);
  const [isAuthenticated, setIsAuthenticated] = React.useState(false);
  const [role, setRole] = React.useState();

  const getAccessToken = async () => {
    try {
      const token = await AsyncStorage.getItem('access-token');
      if (token !== null) {
        console.log('Token:', token);
        let user = await authAPI(token).get(endpoints['current_taikhoan']);
        console.log(user.data);
        dispatch({
          "type": "login",
          "payload": user.data
        });
        setRole(user.data.role);
      } else {
        console.log('Không tìm thấy token trong AsyncStorage');
      }
    } catch (ex) {
      console.log(ex)
    }
  };

  React.useEffect(() => {
    getAccessToken();
    console.log(isAuthenticated);
  }, []);

  return (
    <MyContext.Provider value={[user, dispatch, role, setRole]}>
      <NavigationContainer>
        <Stack.Navigator screenOptions={{
          headerTitle: 'Quản lý điểm rèn luyện'
        }}>
          {user != null && <Stack.Screen name="Main" component={Main} options={{ headerRight: DangXuat }} />}
          {user == null && <Stack.Screen name="DangNhap" component={DangNhap} />}
          <Stack.Screen name="BaiViet" component={BaiViet} />
          <Stack.Screen name="DangKy" component={DangKy} />
          <Stack.Screen name="OTP" component={OTP} />
          <Stack.Screen name="ThemTaiKhoanTroLy" component={ThemTroLySinhVien} />


        </Stack.Navigator>
      </NavigationContainer>
    </MyContext.Provider>
  );
}

