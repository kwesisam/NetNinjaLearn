const express = require('express');
const {createWorkOut, getAllWorkouts, getSingleWorkout, deleteWorkout, updateWorkout} = require('../Controllers/workoutController') 



const router = express.Router();

router.get('/',getAllWorkouts)

router.get('/:id',getSingleWorkout);


router.post('/', createWorkOut);

router.delete('/:id',deleteWorkout);

router.patch('/:id', updateWorkout);



module.exports = router