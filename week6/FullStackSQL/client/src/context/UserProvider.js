import { useState, createContext, useEffect } from "react";
import axios from "axios";

export const UserContext = createContext()


const UserProvider = (props) => {
    const initState = {
        user:" ",
        password:" ",
        id:" "
    }

    const [userState, setUserState] = useState(initState)

    const signUp = (inputs) => {
        console.log(inputs)
        axios.post('http://localhost:9000/signup', inputs)
        .then(res => {
            console.log(res.data)

            setUserState(prevUserState => ({
                ...prevUserState
            }))
            console.log("data sent")
        })
        .catch(err => console.log(err))
    }

    const login = (inputs) => {
        console.log(inputs)
        axios.post('http://localhost:9000/user', inputs)
        .then(res => {
            console.log(res.data)
        })
        // displayUserInfo()
    }

    // const displayUserInfo = () => {
    //     axios.get("http://localhost:9000/user")
    //     .then((res) => {
    //         console.log(res)
    //     })
    // }

    return(
        <UserContext.Provider value={ {...userState, signUp, login } }>
            { props.children }
        </UserContext.Provider>
    )
}

export default UserProvider;