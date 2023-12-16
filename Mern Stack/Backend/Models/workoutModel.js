const mongoose = require('mongoose')

var workoutSchema =  mongoose.Schema({
    title : {
        type: String,
        required: true
    },

    reps: {
        type: Number,
        required: true
    },

    load:{
        type: Number,
        required: true
    }

}, {timestamps:true});

module.exports = mongoose.model('workout', workoutSchema);