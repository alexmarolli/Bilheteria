const express=require('express');
const cors=require('cors');
const app=express();


const port=3333;

app.use(cors());

app.listen(port,()=>{
    console.log('servidor rodando')
});

app.get('/',function (_req, res) {
        res.send('Testando');
        console.log('foi');
    })