import { StyleSheet } from "react-native";
import { DefaultTheme } from 'react-native-paper';


const myTheme = {
    ...DefaultTheme,
    colors: {
        ...DefaultTheme.colors,
    },
};

export default StyleSheet.create({
    container: {
        flex: 1,
    }, subject: {
        fontSize: 30,
        fontWeight: "bold",
        // backgroundColor:'#A9FBC3'
    }, title: {
        fontSize: 20,
        fontWeight: "bold",
        color: myTheme.colors.primary,
    }, row: {
        flexDirection: "row"
    }, wrap: {
        flexWrap: "wrap"
    }, margin: {
        margin: 5
    }, avatar: {
        width: 80,
        height: 80,
        borderRadius: 20
    }, background_item: {
        backgroundColor: myTheme.colors.background
    }, bd_radius_20: {
        borderRadius: 20
    }
});