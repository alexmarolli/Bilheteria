const express = require('express');
const cors = require('cors');
const Route = require('./routes');
const app = express();
const port = 3333;

app.use(cors());
app.use(Route());
app.listen(port, () => {
    console.log('servidor rodando')
});