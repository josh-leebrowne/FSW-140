import { useContext } from "react";
import { UserContext } from "../context/UserProvider";
import profilePic from "../images/profile.webp"
const Profile = () => {

    const {username, email, logout} = useContext(UserContext)

    return(
        <div className="profile-container">
            <h1 className="profile-header">
                Welcome Back: @{username}
            </h1>
                <div className="info-container">
                    <img src={profilePic} alt="" className="profile-pic"/>
                    <h4 className="profile-info">
                        Username: {username}
                    </h4>
                    <h4 className="profile-info">
                        Email: {email}
                    </h4>
                </div>
            <button className="logout-btn" onClick={logout}>Logout</button>
        </div>
    )
}

export default Profile;