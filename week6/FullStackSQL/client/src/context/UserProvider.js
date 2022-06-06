import { useState, createContext, useEffect } from "react";
import axios from "axios";

export const UserContext = createContext()


const UserProvider = (props) => {
    const initState = {
        username: '',
        email: '',
        password: '',
        id: ''
    }

    const [userState, setUserState] = useState(initState)

    const signUp = (inputs) => {
        console.log(inputs)
        axios.post('http://localhost:9000/signup', inputs)
        .then(res => {
            const {username, email, id} = res.data[0]
            localStorage.setItem('id', id)
            localStorage.setItem('username', username)
            localStorage.setItem('email', email)

            setUserState(prevUserState => ({
                ...prevUserState,
                username,
                id,
                email
            }))
            console.log("data sent")
        })
        .catch(err => console.log(err))
    }

    const login = (inputs) => {
        console.log(inputs)
        axios.post('http://localhost:9000/login', inputs)
        .then(res => {
            console.log(res.data)
            const {username, email, id} = res.data[0]
            localStorage.setItem('id', id)
            localStorage.setItem('username', username)
            localStorage.setItem('email', email)

            const userInfo = res.data[0]
            setUserState(userInfo)
        })
    }

    const logout = () => {
        localStorage.removeItem('id')
        localStorage.removeItem('username')
        localStorage.removeItem('email')
        setUserState(initState)
    }

    useEffect(() => {
        setUserState(prevUserState => ({
            ...prevUserState,
            id: localStorage.getItem('id'),
            username: localStorage.getItem('username'),
            email: localStorage.getItem('email')
        }))
    }, [])

    return(
        <UserContext.Provider value={ {...userState, signUp, login, logout } }>
            { props.children }
        </UserContext.Provider>
    )
}

export default UserProvider;