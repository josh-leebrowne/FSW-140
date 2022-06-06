const express = require('express')
const mysql = require('mysql2')
const cors = require("cors")



//Establish a MySQL Connection
const db = mysql.createConnection({
    host: 'localhost', //or IP Address
    user: 'root',
    password: 'password',
    database: 'capstonedb'
})

//Connect to the MySQL Database
db.connect((err) => {
    if(err){
        throw err
    }
    console.log("Connected to DB")
})

//Express Server
const app = express()
app.use(cors())
app.use(express.json())

app.post('/signup', (req, res) => {
    console.log(req.body)
    const username = req.body.username
    const password = req.body.password

    db.query(
        "INSERT INTO users (username, password) VALUES (?,?)", 
        [username, password], ( err, result) => {
            if(err){
                throw err
            }
            res.send("Values Inserted")
        }
    )
})

app.get('/user', (req, res) => {
    console.log(res)
    db.query("SELECT * FROM users", (err, result) => {
        if(err){
            throw err
        }
        res.send(result)
    })
})

//Create DB
app.get('/createDB', (req, res) => {
    let sqlString = "CREATE DATABASE newDB";
    //Run the Commamd
    db.query(sqlString, (err, result) => {
        if(err){
            throw err
        }
        res.send("Database Created Succesfully")
        console.log(result)
    })
})

//Create Table
app.get('/createTable', (req, res) => {
    let sqlString = 'CREATE TABLE postings ( id INT AUTO_INCREMENT, title VARCHAR(100), message VARCHAR(250), PRIMARY KEY(id) )'
    //Run Command
    db.query(sqlString, (err, result) => {
        if(err){
            throw err
        }
        res.send("Postings Table Created Succesfully")
        console.log(result)
    })
})

//Insert new Row to Table
app.get('/insertRow1', (req, res) => {
    let post = {title: 'First Title', message: 'First Message'}
    let sqlString = "INSERT INTO postings SET ?"
    db.query(sqlString, post, (err, result) => {
        if(err){
            throw err
        }
        res.send("First Row Created Succesfully")
        console.log(result)
    })
})

//Insert new Row to Table
app.get('/insertRow2', (req, res) => {
    let post = {title: 'Second Title', message: 'Second Message'}
    let sqlString = "INSERT INTO postings SET ?"
    db.query(sqlString, post, (err, result) => {
        if(err){
            throw err
        }
        res.send("Second Row Created Succesfully")
        console.log(result)
    })
})

//Execute SELECT
app.get('/getPosts', (req, res) => {
    let sqlString = "SELECT * FROM postings"
    db.query(sqlString, (err, result) => {
        if(err){
            throw err
        }
        res.send("All Rows Selected Succesfully")
        console.log(result)
    })
})


//Execute SELECT query with WHERE clause
app.get('/getPost/:id', (req, res) => {
    let sqlString = `SELECT * FROM postings WHERE id = ${req.params.id}`
    db.query(sqlString, (err, result) => {
        if(err){
            throw err
        }
        res.send("Single Row Selected Succesfully")
        console.log(result)
    })
})

//Execute Update query
app.get('/updatePosts/:id', (req, res) => {
    let newTitle = "New Title from JS"
    let sqlString = `UPDATE postings SET title = '${newTitle}' WHERE id = ${req.params.id}`
    db.query(sqlString, (err, result) => {
        if(err){
            throw err
        }
        res.send("Updated Succesfully")
        console.log(result)
    })
})

//Execute DELETE query
app.get('/deletePosts/:id', (req, res) => {
    let sqlString = `DELETE FROM postings WHERE id = ${req.params.id}`
    db.query(sqlString, (err, result) => {
        if(err){
            throw err
        }
        res.send("Deleted Succesfully")
        console.log(result)
    })
})

//Start Server
app.listen('9000', ()=> {
    console.log('Local Server Running')
})
