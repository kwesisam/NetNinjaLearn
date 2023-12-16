import { useWorkoutsContext } from "../hooks/useWorkoutContext";

const WorkoutDetials = ({workout}) => {
    const { dispatch } = useWorkoutsContext();
    const handleDelete = async () => {
        const respond  = await fetch('/api/workouts/' + workout._id, {
            method:'DELETE',
        } )

        const json = respond.json();

        if(respond.ok){
            dispatch({type:'DELETE_WORKOUT', payload: json})
        }
    }
    return ( 
        <div className="workout-details">
            <h4>{workout.title}</h4>
            <p><strong>Loand (kg):</strong>{workout.load}</p>
            <p><strong>Reps :</strong>{workout.reps}</p>
            <p>{workout.createdAt}</p>
            <span onClick={handleDelete} >Delete</span>

        </div>
     );
}
 
export default WorkoutDetials;