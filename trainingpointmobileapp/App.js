import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import DangKy from './components/TaiKhoan/DangKy';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import OTP from './components/TaiKhoan/OTP';
import MyContext from './configs/MyContext';

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="DangKy" screenOptions={{
        headerTitle: 'Quản lý điểm rèn luyện',
      }}>
        <Stack.Screen name="DangKy" component={DangKy} />
        <Stack.Screen name="OTP" component={OTP} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

