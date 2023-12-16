const express = require('express');
const {connectToDb, getDb} = require('./db');
const { ObjectId } = require('mongodb');

//init app & middleware
const app = express();
app.use(express.json())

//db connection 

let db;

connectToDb( (err) => {
    if(!err){
        //listening for request
        app.listen(3000, () => {
            console.log('app listening on port 3000');
        })
        db = getDb();
    }
})




//route
app.get("/books", (req, res) => {
    let mybook = [];

    db.collection('book')
    .find()
    .sort({author:1})
    .forEach(element => {
        mybook.push(element)
    })
    .then( () => {
        res.status(200).json(mybook);
    })
    .catch( () => {
        res.status(500).json({error: "Could not fetch the documents"})
    })
})

app.get('/books/:id', (req, res) => {
    

    if(ObjectId.isValid(req.params.id)){
        db.collection('book')
        .findOne({_id: new ObjectId(req.params.id)})
        .then( (doc) => {
            res.status(200).json(doc)
        })
        .catch(err => {
            res.status(500).json({error:"could not fetch the documet"})
        })
    }else{
        res.status(500).json({error:"not a valid document id"})
    }
    
})

app.post('/books', (req, res) => {
   const book = req.body
   
   db.collection('book')
   .insertOne(book)
   .then(result => {
    res.status(201).json(result)
   })
   .catch(err =>{
    res.status(500).json({err: "could not create a document"}); 
   })
})

app.delete('/books/:id', (req, res) => {
    if(ObjectId.isValid(req.params.id)){
        db.collection('book')
        .deleteOne({_id: new ObjectId(req.params.id)})
        .then(result => {
            res.status(200).json(result)
        })
        .catch(err => {
            res.status(500).json({error:"Could not delete document"})
        })
    }else{
        res.status(500).json({error:"not a valid id"})
    }
})

app.patch('/book/:id', (req, res) => {
    const updates = req.body;
    if(ObjectId.isValid(req.params.id)){
        db.collection('book')
        .updateOne({_id: new ObjectId(req.params.id)}, {$set: updates})
        .then(result => {
            res.status(200).json(result)
        })
        .catch(err => {
            res.status(500).json({error:"could not update the document"})
        })
    }else{
        res.status(500).json({error:"not a valid id"})
    }
})