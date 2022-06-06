import './App.css';
import { Route, Navigate, Routes } from 'react-router-dom';
import { useContext } from 'react';
import Login from './components/Login.jsx';
import Profile from './components/Profile';
import { UserContext } from "./context/UserProvider";

function App() {

  const {id} = useContext(UserContext)
  console.log(id)

  return (
    <div>
      <Routes>
        <Route 
        exact path="/"
        element={ id ? <Navigate replace to='/profile' /> : <Login /> }
        />
        <Route 
        exact path="/profile"
        element={ !id ? <Navigate replace to ='/' /> : <Profile /> }
        />
      </Routes>
    </div>
  );
}

export default App;
