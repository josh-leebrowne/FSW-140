const LoginForm = ( { handleChange, handleSubmit, btnText, inputs} ) => {

    return(
        <div className="login-wrapper">
            <form className="loginForm" onSubmit={handleSubmit}>
                <input
                    className="username"
                    type="text"
                    value={inputs.username}
                    name={'username'}
                    onChange={handleChange}
                    placeholder="Username"/>
                <input
                    className="password"
                    type="text"
                    value={inputs.password}
                    name={'password'}
                    onChange={handleChange}
                    placeholder="Password"/>
                    <button  className="login">{ btnText }</button>
            </form>
        </div>
    )
}

export default LoginForm;