import { Text, BottomNavigation } from 'react-native-paper';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import { View, StyleSheet } from 'react-native';
import { CommonActions } from '@react-navigation/native';
import BanTin from '../BanTin/BanTin';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import OTP from '../TaiKhoan/OTP';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import React from 'react';
import MyContext from '../../configs/MyContext';
import ChiTietHoatDong from '../HoatDong/ChiTietHoatDong';
import QuanLyHoatDong from '../HoatDong/QuanLyHoatDong';
import BaoThieuHoatDong from '../BaoThieu/BaoThieuHoatDong';
import TaiKhoan from '../TaiKhoan/TaiKhoan';
import MinhChungBaoThieu from '../BaoThieu/MinhChungBaoThieu';

const Tab = createBottomTabNavigator();
const Stack = createNativeStackNavigator();

const HoatDongStackNavigator = () => (
    <Stack.Navigator >
        <Stack.Screen name="QuanLiHoatDong" component={QuanLyHoatDong} options={{ headerShown: false }} />
        <Stack.Screen name="ChiTietHoatDong" title="Chi tiết hoạt động" component={ChiTietHoatDong} options={{ title: "", headerTransparent: true }} />
    </Stack.Navigator>
);

const BaoThieuStackNavigator = () => (
    <Stack.Navigator >
        <Stack.Screen name="BaoThieu" component={BaoThieuHoatDong} options={{ headerShown: false }} />
        <Stack.Screen name="MinhChungBaoThieu" component={MinhChungBaoThieu} options={{ title: "" }} />
    </Stack.Navigator>
);

const Main = ({ navigation }) => {
    const [user, dispatch, role, setRole] = React.useContext(MyContext);
    return (
        <Tab.Navigator
            screenOptions={{
                headerShown: false,
            }}
            tabBar={({ navigation, state, descriptors, insets }) => (
                <BottomNavigation.Bar
                    navigationState={state}
                    safeAreaInsets={insets}
                    onTabPress={({ route, preventDefault }) => {
                        const event = navigation.emit({
                            type: 'tabPress',
                            target: route.key,
                            canPreventDefault: true,
                        });

                        if (event.defaultPrevented) {
                            preventDefault();
                        } else {
                            navigation.dispatch({
                                ...CommonActions.navigate(route.name, route.params),
                                target: state.key,
                            });
                        }
                    }}
                    renderIcon={({ route, focused, color }) => {
                        const { options } = descriptors[route.key];
                        if (options.tabBarIcon) {
                            return options.tabBarIcon({ focused, color, size: 24 });
                        }

                        return null;
                    }}
                    getLabelText={({ route }) => {
                        const { options } = descriptors[route.key];
                        const label =
                            options.tabBarLabel !== undefined
                                ? options.tabBarLabel
                                : options.title !== undefined
                                    ? options.title
                                    : route.title;

                        return label;
                    }}
                />
            )}
        >
            <Tab.Screen
                name="BanTin"
                component={BanTin}
                options={{
                    tabBarLabel: 'Bản tin',
                    tabBarIcon: ({ color, size }) => {
                        return <Icon name="home" size={size} color={color} />;
                    },
                }}
            />
            <Tab.Screen
                name="QuanLyHoatDong"
                component={HoatDongStackNavigator}
                options={{
                    tabBarLabel: 'Hoạt động',
                    tabBarIcon: ({ color, size }) => {
                        return <Icon name="calendar" size={size} color={color} />;
                    },
                }}
            />
            <Tab.Screen
                name="BaoThieuHoatDong"
                component={BaoThieuStackNavigator}
                options={{
                    tabBarLabel: 'Báo thiếu',
                    tabBarIcon: ({ color, size }) => {
                        return <Icon name="calendar-alert" size={size} color={color} />;
                    },
                }} />
            <Tab.Screen
                name="Profile"
                component={TaiKhoan}
                options={{
                    tabBarLabel: 'Thông tin',
                    tabBarIcon: ({ color, size }) => {
                        return <Icon name="account-circle" size={size} color={color} />;
                    },
                }} />
        </Tab.Navigator>
    )
}


export default Main;  