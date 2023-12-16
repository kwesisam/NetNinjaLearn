import { useEffect, useState } from "react";
import WorkoutDetials from "../components/WorkoutDetials";
import WorkoutForm from "../components/WorkoutForm";
import { useWorkoutsContext } from "../hooks/useWorkoutContext";
const Home = () => {
    const {workouts, dispatch} = useWorkoutsContext()
    useEffect(() => {
        const fetchWorkouts = async () => {
            const response = await fetch("/api/workouts")
            const json = await response.json();

            if(response.ok){
                dispatch({type:"SET_WORKOUT", payload: json})
            }
        }

        fetchWorkouts();
    }, []) 
    return ( 
        <div className="home">
            <div className="workouts"> 
                {workouts && workouts.map((workout) => (
                    <WorkoutDetials key={workout._id} workout={workout} />
                ))}
            </div>
            <WorkoutForm />
        </div>
     );
}
 
export default Home;