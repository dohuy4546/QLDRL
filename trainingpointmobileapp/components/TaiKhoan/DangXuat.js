import { useContext } from "react"
import { Button } from "react-native-paper"
import MyContext from "../../configs/MyContext"
import AsyncStorage from "@react-native-async-storage/async-storage";

const DangXuat = ({ navigation }) => {
    const [user, dispatch, isAuthenticated, setIsAuthenticated, role, setRole] = useContext(MyContext);

    const logout = async () => {
        dispatch({
            "type": "logout"
        })
        setRole(null);
        console.log("hello");
        if (AsyncStorage.setItem('access-token', "null")) {
            setIsAuthenticated(false);
        }

    }


    return <Button icon="logout-variant" onPress={logout} style={{ marginTop: 10 }} labelStyle={{ marginHorizontal: 0 }}></Button>
}

export default DangXuat;
