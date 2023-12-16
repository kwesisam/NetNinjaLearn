require('dotenv').config()
const express = require('express');
const workOutRoute = require('./routes/workouts')
const mongoose = require('mongoose');

//express app
const app = express();

//middleware 
app.use(express.json());
app.use((req, res, next) => {
    console.log(req.path)
    console.log(req.method)
    next()
})

//react to request
app.use("/api/workouts",workOutRoute);

//connect to db
mongoose.connect(process.env.MONGO_URI)
.then(() => {
    //listen to express request
    app.listen(process.env.PORT, () => {
        console.log('listening for request from ' + process.env.PORT)
    })
})
.catch(err => {
    console.log(err);
})

