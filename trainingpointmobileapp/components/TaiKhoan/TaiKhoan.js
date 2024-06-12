import { Card, Text } from "react-native-paper"
import APIs, { authAPI } from "../../configs/APIs";
import { useContext, useEffect, useState } from "react";
import { View } from "react-native";
import AsyncStorage from "@react-native-async-storage/async-storage";
import MyContext from "../../configs/MyContext";
import Styles from "./Styles";

const TaiKhoan = () => {
    const [user] = useContext(MyContext);

    return (
        <Card style={{ alignItems: "center" }}>
            <Card.Title title="Thông tin tài khoản" />
            <Card.Cover style={Styles.avatar} source={{ uri: `${user.avatar}` }} />
            <Card.Content>
                <Text variant="titleLarge">{`${user.username}`}</Text>
                <Text variant="bodyMedium">{user.email}</Text>
            </Card.Content>
        </Card>
    )
}

export default TaiKhoan;