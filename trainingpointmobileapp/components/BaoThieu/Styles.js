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
    }, row: {
        flexDirection: "row"
    }, wrap: {
        flexWrap: "wrap"
    }, margin: {
        margin: 5
    }, anh_minh_chung: {
        width: '100%',
        height: 300,
        borderRadius: 20
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
    }, margin_bottom_40: {
        marginBottom: 40
    }, margin_bottom_20: {
        marginBottom: 20
    }, align_item_center: {
        alignItems: "center"
    }, justify_content_center: {
        justifyContent: "center"
    }, m_20: {
        margin: 20
    }, mt_50: {
        marginTop: 50
    }
});