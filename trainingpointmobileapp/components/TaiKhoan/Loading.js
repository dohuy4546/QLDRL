import React from 'react';
import { View, ActivityIndicator, StyleSheet } from 'react-native';
import { Title } from 'react-native-paper';
import { DefaultTheme } from 'react-native-paper';

const LoadingScreen = () => {
    const myTheme = {
        ...DefaultTheme,
        colors: {
            ...DefaultTheme.colors,
        },
    };

    return (
        <View style={[styles.container, { backgroundColor: myTheme.colors.primary }]}>
            <Title style={{ fontSize: 20, color: "white" }}>Quản lí điểm rèn luyện</Title>
            <ActivityIndicator size="large" ></ActivityIndicator>
        </View>
    );
};

const styles = StyleSheet.create({

    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
});

export default LoadingScreen;