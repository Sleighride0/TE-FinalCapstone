<template>
  <div>
    <h1>Log Your Exercise</h1>
    <p class="error-message" v-show="showErrorMessage">{{ errorMessage }}</p>
    <form class="exercise-form" v-on:submit.prevent="submitExercise">
      <div class="exercise-buttons">
        <!-- ExerciseButtons component will handle the buttons -->
        <ExerciseButtons :mode="'select'" :selectExercise="selectExercise" />
      </div>

      <div class="input-container">
        <div class="form-group">
          <label for="sets">Sets</label>
          <input type="number" id="sets" v-model="exercise.sets" required placeholder="Enter your number of sets."/>
        </div>
      </div>

      <div v-if="exercise.mode === 'reps'">
        <div class="input-container">
          <div class="form-group">
            <label for="reps">Reps</label>
            <input type="number" id="reps" v-model="exercise.reps" min="0" required placeholder="Enter your number of reps."/>
          </div>
          <div class="form-group">
            <label for="weight">Weight</label>
            <input type="number" id="weight" v-model="exercise.weight" min="0" required placeholder="Enter the weight used (number only)." />
          </div>
        </div>
      </div>

      <div v-if="exercise.mode === 'duration'">
        <div class="input-container">
          <div class="form-group">
            <label for="duration">Duration (minutes)</label>
            <input type="number" id="duration" v-model="exercise.duration" min="0" required />
          </div>
        </div>
      </div>

      <div class="input-container">
        <div class="form-group">
          <label for="date">Date</label>
          <input type="date" id="date" v-model="exercise.date" required />
        </div>
      </div>

      <button type="submit">Submit</button>
      <p class="status-message" v-show="showStatusMessage">{{ statusMessage }}</p>
    </form>
  </div>
</template>


<script>
import ExerciseService from "../services/ExerciseService.js";
import ExerciseButtons from '../components/ExerciseButtons.vue';


export default {
  components: {
    ExerciseButtons
  },
  data() {
    return {
      totalVisitDuration: "",
      statusMessage: "",
      errorMessage: "",
      showStatusMessage: false,
      showErrorMessage: false,
      exercises: [],
      showEmployeeForm: false,
      userId: null,
      exercise: {
        exerciseName: "",
        userId: "",
        exerciseId: "",
        sets: "",
        reps: "",
        duration: "",
        weight: "",
        date: "",
        mode: "", // Added property for reps or duration choice
      },
      exerciseOptions: [
        { id: 1, name: "Bench Press", mode: "reps" },
        { id: 2, name: "Treadmill", mode: "duration" },
        { id: 3, name: "Dumbells", mode: "reps" },
        { id: 4, name: "Lat Pulldown", mode: "reps" },
        { id: 5, name: "Rowing Machine", mode: "duration" },
        { id: 6, name: "Stairmaster", mode: "duration" },
        { id: 7, name: "Squats", mode: "reps" },
        { id: 8, name: "Russian Twist", mode: "duration" },
        { id: 9, name: "Leg Extension Machine", mode: "reps" },
        { id: 10, name: "Fly", mode: "reps" },
        { id: 11, name: "Dips", mode: "reps" },
        { id: 12, name: "Abdominal Crunch", mode: "reps" },
        { id: 13, name: "Elliptical", mode: "duration" },
        { id: 14, name: "Deadlift", mode: "reps" },
        { id: 15, name: "Planks", mode: "duration" },
        { id: 16, name: "Assault Bike", mode: "duration" },
        { id: 17, name: "Push Ups", mode: "reps" },
        { id: 18, name: "Pulley", mode: "reps" },
      ],
    };
  },
  mounted() {
    this.getExerciseByUserId();
  },

  methods: {
    submitExercise() {
        this.setUserId();
        if (this.exercise.mode === "reps") {
          this.exercise.duration = null; // Reset duration if reps mode is selected
        } else if (this.exercise.mode === "duration") {
          this.exercise.reps = null; // Reset reps if duration mode is selected
        }
        ExerciseService.addExercise(this.exercise)
        .then((response) => {
          if (response.status === 200) {
            this.statusMessage = "Exercise Logged, Keep at it!"
            this.showStatusMessage = true;
            this.exercise = {};
            this.switchMessage();
          }
        }
        ).catch(error => {
          this.handleErrorResponse(error)
        })

    },
    selectExercise(exerciseOption) {
      // Handle the selected exercise logic
      this.exercise.exerciseName = exerciseOption.name;
      this.updateExerciseMode();
    },

    handleErrorResponse(error) {
         console.log(error);
         this.showErrorMessage = true;
         this.switchMessage();
         if (error.response) {
             this.errorMessage = 'Error adding new exercise. Error: ' + error.response.status;
         }
         else if(error.request) {
             this.errorMessage = 'Error adding new exercise. Error: server unavailable';
         }
         else {
             this.errorMessage = 'Woe, error be upon ye';
         }
         
    },

    setUserId() {
      this.exercise.userId = this.$store.getters.getUserId;
    },

    switchMessage() {
      setTimeout(() => {
        this.showErrorMessage = false;
        this.showStatusMessage = false;
      }, 5000);
    },

    getExerciseByUserId() {
      ExerciseService.getExerciseByUserId(this.$store.getters.getUserId).then(
        (response) => {
          this.isLoading = false;
          this.exercises = response.data;
        }
      );
    },

    employeeGetExerciseByUserId(userId) {
      ExerciseService.getExerciseByUserId(userId).then((response) => {
        this.isLoading = false;
        this.exercises = response.data;
      });
    },

    formatDate(date) {
      const options = { year: "numeric", month: "short", day: "numeric" };
      return new Date(date).toLocaleDateString("en-US", options);
    },

    getTotalVisitDurationByUserId() {
      ExerciseService.getTotalVisitDurationByUserId(
        this.$store.getters.getUserId
      ).then((response) => {
        if (response.status === 200) {
          this.totalVisitDuration = response.data;
        }
      });
    },

    updateExerciseMode() {
      const selectedExercise = this.exerciseOptions.find(
        (option) => option.name === this.exercise.exerciseName
      );

      if (selectedExercise) {
        this.exercise.mode = selectedExercise.mode;
      }
    },
  },
};
</script>

<style scoped>
body {
  font-family: "Arial", sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
}

.error-message{
  color:red;
  font-weight: bold;
  font-size: 16px;
}

.status-message{
  color:black;
  font-family: "Arial", sans-serif;
  font-weight: bold;
}

.container {
  max-width: 800px;
  margin: auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.header {
  text-align: center;
  color: #333;
}

.exercise-form {
  max-width: 700px; /* Adjust the max-width to make the form wider */
  margin: auto;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-size: 20px;
  font-weight: bold;
  text-align: left; /* Align the labels to the left */
}

.input-container {
  display: flex;
  flex-direction: column;
}

.input-container input,
.input-container select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  box-sizing: border-box;
  margin-top: 5px; /* Add some top margin to the inputs for spacing */
}

select {
  cursor: pointer;
}

button {
  font-family: 'Exo 2', sans-serif;
  background-color: #4caf50;
  color: #fff;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #45a049;
}
</style>