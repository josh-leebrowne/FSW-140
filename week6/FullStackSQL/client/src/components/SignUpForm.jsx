const SignUpForm = ( { handleChange, handleSubmit, btnText, inputs} ) => {

    return(
        <div className="login-form-wrapper">
            <form className="loginForm" onSubmit={handleSubmit}>
                <input
                    className="username"
                    type="text"
                    value={inputs.username}
                    name={'username'}
                    onChange={handleChange}
                    placeholder="Username"/>
                <input 
                    className="email"
                    type="text"
                    value={inputs.email}
                    name={'email'}
                    onChange={handleChange}
                    placeholder="Email Address"/>
                <input
                    className="password"
                    type="password"
                    value={inputs.password}
                    name={'password'}
                    onChange={handleChange}
                    placeholder="Password"/>
                    <button  className="login-btn">{ btnText }</button>
            </form>
        </div>
    )
}

export default SignUpForm;