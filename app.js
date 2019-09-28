const express = require('express');
const port = 3000;
const app = express();
const path = require('path');
//banco
const mysql = require('mysql');

//Create Connection
const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'biometria'
});

//connect to database
conn.connect((err) => {
    if (err) throw err;
    console.log('Mysql Connected...');
});

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.static(path.join(__dirname, 'public')));  // adcionando a pasta publica

app.get('/', function(req, res, next) {
    res.render('index', {
        title: "Trabalho de Fábrica de Software II",
        version: "0.0.0"
    });
});

app.get('/login',(req, res, next) => {  //criando outra tela
    res.render('login');
});

app.listen(port, err => {
    console.log(`Server is listening on ${port}`);
});
