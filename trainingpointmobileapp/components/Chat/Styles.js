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
        fontSize: 17,
        fontWeight: "bold",
    }, row: {
        flexDirection: "row"
    }, wrap: {
        flexWrap: "wrap"
    }, margin: {
        margin: 5
    }, avatar: {
        width: 60,
        height: 60,
        borderRadius: 60,
        marginLeft: 5,
        marginRight: 5,
    }, background_item: {
        backgroundColor: myTheme.colors.background
    }, bd_radius_20: {
        borderRadius: 20
    },
    background_primary: {
        backgroundColor: myTheme.colors.primary
    },
    color_onPrimary: {
        color: myTheme.colors.onPrimary
    },
    color_primary: {
        color: myTheme.colors.primary
    },
    color_outline: {
        color: myTheme.colors.secondaryContainer
    }
});