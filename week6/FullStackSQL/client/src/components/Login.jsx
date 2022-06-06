import { useState, useContext } from "react";
import LoginForm from "./LoginForm";
import { UserContext } from "../context/UserProvider";

const initInputs = {username: "", password: ""}

const Login = () => {
    const [inputs, setInputs] = useState(initInputs)
    const [toggle, setToggle] = useState(false)

    const {signUp, login} = useContext(UserContext)

    const toggleForm = () => {
        setToggle(prev => !prev)
    }

    const handleChange = (e) => {
        const {name, value} = e.target
        console.log(name, value)
        setInputs(prevInputs => ({...prevInputs, [name]: value}))
    }

    const handleLogin = (e) => {
            e.preventDefault()
            login(inputs)
    }

    const handleSignUp = (e) => {
        e.preventDefault()
        signUp(inputs)
    }

    return (
        <div>
            <h1>Capstone</h1>
            {!toggle ?
                <>
                    <LoginForm 
                        handleChange={handleChange}
                        handleSubmit={handleLogin}
                        inputs={inputs}
                        btnText="Login"
                    />
                    <p onClick={()=>  toggleForm()} className='createaccount'>Create an Account</p>  
                </>
                :
                <>
                    <LoginForm 
                        handleChange={handleChange}
                        handleSubmit={handleSignUp}
                        inputs={inputs}
                        btnText="Sign Up"
                    />
                    <p onClick={()=> toggleForm()} className='haveaccount'>Already have an account?</p>
                </>
            }
        </div>
    )
}
export default Login;