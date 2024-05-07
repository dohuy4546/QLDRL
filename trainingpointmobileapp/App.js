import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import DangKy from './components/TaiKhoan/DangKy';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import OTP from './components/TaiKhoan/OTP';
import MyContext from './configs/MyContext';
import ThemTroLySinhVien from './components/Home/ThemTroLySinhVien';
import MyUserReducer from './reducers/MyUserReducer';

const Stack = createNativeStackNavigator();

export default function App() {
  const [user, dispatch] = React.useReducer(MyUserReducer, null);

  return (
    <MyContext.Provider value={[user, dispatch]}>
      <NavigationContainer>
        <Stack.Navigator initialRouteName="DangKy" screenOptions={{
          headerTitle: 'Quản lý điểm rèn luyện',
        }}>
          <Stack.Screen name="DangKy" component={DangKy} />
          <Stack.Screen name="OTP" component={OTP} />
          <Stack.Screen name="ThemTaiKhoanTroLy" component={ThemTroLySinhVien} />
        </Stack.Navigator>
      </NavigationContainer>
    </MyContext.Provider>
  );
}

