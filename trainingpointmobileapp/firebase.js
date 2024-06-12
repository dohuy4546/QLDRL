// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth, initializeAuth, getReactNativePersistence } from "firebase/auth";
import { getFirestore } from 'firebase/firestore';
import ReactNativeAsyncStorage from '@react-native-async-storage/async-storage';

const firebaseConfig = {
    apiKey: "AIzaSyAkvjJyKKl6-q-NBvIfSNlTWtfA8iTiI0c",
    authDomain: "qldrl-chat-app.firebaseapp.com",
    projectId: "qldrl-chat-app",
    storageBucket: "qldrl-chat-app.appspot.com",
    messagingSenderId: "127375729265",
    appId: "1:127375729265:web:e250d7d58e1a355d7671d0"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
export const auth = initializeAuth(app, {
    persistence: getReactNativePersistence(ReactNativeAsyncStorage)
});
