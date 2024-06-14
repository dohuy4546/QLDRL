import { useContext } from "react"
import { Button } from "react-native-paper"
import MyContext from "../../configs/MyContext"
import AsyncStorage from "@react-native-async-storage/async-storage";

const DangXuat = ({ navigation }) => {
    const [user, dispatch, role, setRole] = useContext(MyContext);

    const logout = async () => {
        dispatch({
            "type": "logout"
        })
        setRole(null);
        AsyncStorage.setItem('access-token', "null");
        AsyncStorage.setItem('refresh-token', "null");
    }


    return <Button icon="logout-variant" onPress={logout} style={{ marginTop: 10 }} labelStyle={{ marginHorizontal: 0 }}></Button>
}

export default DangXuat;
