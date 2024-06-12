import React from 'react'
import { Image, Text, View } from 'react-native';
import Styles from './Styles';
import moment from 'moment';
import 'moment/locale/vi';


const Comment = ({ comment }) => {
    return (
        <View style={[Styles.header, { alignSelf: 'flex-start' }]}>
            <Image source={{ uri: comment.tai_khoan.avatar }} style={[Styles.avatar, { alignSelf: 'flex-start' }]} />
            <View style={{ maxWidth: '85%' }}>
                <View style={{ backgroundColor: 'lightgray', borderRadius: 15, padding: 8, paddingRight: 20 }}>
                    <Text style={{ fontWeight: 'bold' }}>{comment.tai_khoan.username}</Text>
                    <Text>
                        {comment.content}
                    </Text>
                </View>
                <Text style={{ color: 'gray' }} >{moment(comment.created_date).fromNow()}</Text>
            </View>
        </View>
    )
}

export default Comment;