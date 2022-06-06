import { useState, useContext } from "react";
import LoginForm from "./LoginForm";
import { UserContext } from "../context/UserProvider";
import SignUpForm from "./SignUpForm";

const initInputs = {username: "", password: "", email: ""}

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
        <div className="main-container">
            {!toggle ?
                <>
                <h1 className="logintitle">Sign In</h1>
                    <div className="login-wrapper">
                        <LoginForm 
                            handleChange={handleChange}
                            handleSubmit={handleLogin}
                            inputs={inputs}
                            btnText="Login"
                        />
                        <hr className="break" />
                        <div className="account">
                            <p className="account-txt">Don't have an account?</p>
                            <p onClick={()=>  toggleForm()} className='account-nav'>Create an Account</p>
                        </div>
                    </div>  
                </>
                :
                <>
                <h1 className="logintitle">Create an Account</h1>
                    <div className="login-wrapper">
                        <SignUpForm 
                            handleChange={handleChange}
                            handleSubmit={handleSignUp}
                            inputs={inputs}
                            btnText="Sign Up"
                        />
                        <hr className="break" />
                        <div className="account">
                            <p className="account-txt">Already have an acccount? </p>
                            <p onClick={()=> toggleForm()} className='account-nav'> Sign In</p>
                        </div>
                    </div>
                </>
            }
        </div>
    )
}
export default Login;