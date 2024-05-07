import { Picker } from "@react-native-picker/picker";
import { ScrollView, View, Image, ActivityIndicator, Alert } from "react-native";
import { TextInput as PaperTextInput, Title, Button as PaperButton } from "react-native-paper";
import React from "react";
import Styles from "./Styles";
import * as ImagePicker from 'expo-image-picker';
import APIs, { endpoints } from "../../configs/APIs";

const ThemTroLySinhVien = () => {
    const [selectedKhoa, setSelectedKhoa] = React.useState();
    const [avatar, setAvatar] = React.useState(null);
    const [loading, setLoading] = React.useState(false);
    const [khoa, setKhoa] = React.useState([]);
    const handleChooseAvatar = async () => {
        let { status } =
            await ImagePicker.requestMediaLibraryPermissionsAsync();
        if (status !== 'granted') {
            alert("Permissions denied!");
        } else {
            const result =
                await ImagePicker.launchImageLibraryAsync();
            if (!result.canceled)
                setAvatar(result.assets[0]);
        }
    };

    const getKhoas = async () => {
        try {
            const khoas = await APIs.get(endpoints['khoa']);
            setKhoa(khoas.data);
        } catch (ex) {
            Alert.alert("hello");
        }
    };

    React.useEffect(() => {
        getKhoas();
    }, []);

    return (
        <ScrollView automaticallyAdjustKeyboardInsets={true} >
            <View style={Styles.container}>
                {avatar && (
                    <View style={[Styles.align_item_center, Styles.margin_bottom_20]}>
                        <Image
                            source={{ uri: avatar.uri }}
                            style={Styles.avatar}
                        />
                    </View>
                )}
                <PaperButton mode='contained-tonal' onPress={handleChooseAvatar} style={Styles.margin_bottom_20}>Chọn ảnh đại diện</PaperButton>
                <PaperTextInput
                    label="Email"
                    keyboardType="email-address"
                    autoCapitalize="none"
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <PaperTextInput
                    label="Username"
                    autoCapitalize="none"
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <PaperTextInput
                    label="Firstname"
                    autoCapitalize="none"
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <PaperTextInput
                    label="Lastname"
                    autoCapitalize="none"
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <PaperTextInput
                    label="Password"
                    secureTextEntry
                    mode="outlined"
                    style={Styles.margin_bottom_20}
                />
                <View style={[Styles.margin_bottom_20, { borderColor: 'purple', borderWidth: 1, borderRadius: 25 }]}>
                    <Picker
                        selectedValue={selectedKhoa}
                        onValueChange={(itemValue, itemIndex) =>
                            setSelectedKhoa(itemValue)
                        }>
                        {khoa.map(k => (
                            <Picker.Item label={k.ten_khoa} value={k.id} />
                        ))}
                    </Picker>
                </View>

                {loading === true ? <ActivityIndicator /> : <>
                    <PaperButton mode="elevated" >Thêm trợ lý sinh viên</PaperButton>
                </>}
            </View>
        </ScrollView>
    )
}

export default ThemTroLySinhVien;