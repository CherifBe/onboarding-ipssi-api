const express = require('express');
require('dotenv').config();
const cors = require('cors');
const productRouter = require('./router/product.router');
const userRouter = require('./router/user.router');

const { PORT } = process.env || 3000;

const app = express();

app.use(cors());

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/products', productRouter);
app.use('/users', userRouter);

app.get('/', (req, res, next) => {
    res.status(200).json({message: 'Bienvenue sur mon API'});
})

app.use((err, req, res, next) => {
    res.status(500).json({ status: 'error', message: err });
});

app.use((req, res) => {
    res.status(404).json({ message: 'not found: check the url !' });
});

app.listen(PORT, () => {
    console.log(`=> server lauched on port : ${PORT}`);
});