<template>
  <div class="container">
    <div class="exercise-list-container">
      <span>
        <h1>Exercise List</h1>
        <h4> Search all your logged exercise history here.</h4>
      </span>
      <div class="exercise-filter">
        <label for="filterDate">Filter Exercises by Date</label>
        <input type="date" id="filterDate" v-model="selectedDate" ref="filterDateInput" required />
        <button class="button" @click="getExerciseByDayByUserId">Search</button> 
        <button class="button" @click="toggleExerciseList">
          {{ showExerciseList ? 'Hide' : 'Show' }} Results
        </button>
      </div>
      <div class="exercise-list-wrapper" v-if="showExerciseList">

        <ul class="exercise-list">
          <li v-for="exercise in exercises" :key="exercise.exercise_id" class="exercise-item">
            <span class="exercise-name">{{ exercise.exerciseName }}</span>
            <span class="exercise-sets">Sets: {{ exercise.sets }}</span>
            <span v-show="exercise.mode === 'reps'" class="exercise-reps">Reps: {{ exercise.reps }}</span>
            <span v-show="exercise.mode === 'duration'" class="exercise-duration">Duration: {{ exercise.duration }}
              mins</span>
            <span class="exercise-weight">Weight: {{ exercise.weight }} lbs</span>
            <span class="exercise-date">Date: {{ formatDate(exercise.date) }}</span>
          </li>

          <li v-if="exercises.length === 0" class="no-exercises-message">
            No exercises available for the selected date.
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import ExerciseService from "../services/ExerciseService";

export default {
  data() {
    return {
      exercises: [],
      showExerciseList: false,
      selectedDate: '',
      userId: null,
      date: null,
      isLoading: false,
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

    };
  },
  mounted() {
    this.getExerciseByUserId();
    this.getTotalVisitDurationByUserId();
  },
  methods: {
    setUserId() {
      this.exercise.userId = this.$store.getters.getUserId;
    },
    getExerciseByUserId() {
      this.isLoading = true;  // Add this line
      ExerciseService.getExerciseByUserId(this.$store.getters.getUserId).then(
        (response) => {
          this.isLoading = false;
          this.exercises = response.data;
        }
      );
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
    formatDuration(minutes) {
      const days = Math.floor(minutes / 1440);
      const hours = Math.floor((minutes % 1440) / 60);
      const remainingMinutes = minutes % 60;

      return `${days}d ${hours}h ${remainingMinutes}m`;
    },
    getExerciseByDayByUserId() {
      if (!this.selectedDate) {
        console.warn("Please select a date.");
        return;
      }

      // Set the user ID before making the API call
      this.setUserId();

      this.isLoading = true;
      ExerciseService.getExerciseByDayByUserId(
        this.$store.getters.getUserId,
        this.selectedDate
      ).then((response) => {
        this.isLoading = false;
        this.exercises = response.data.map((exercise) => ({
          ...exercise,
          date: this.reformatDate(exercise.date), // Reformat date
        }));
      });
    },
    // Add a method to reformat the date
    reformatDate(date) {
      // Assuming date is in "YYYY-MM-DD" format
      const [year, month, day] = date.split("-");
      return `${month}/${day}/${year}`;
    },
    getAllExercises() {
      // Set the user ID before making the API call
      this.setUserId();

      this.isLoading = true;
      ExerciseService.getExerciseByUserId(this.$store.getters.getUserId).then(
        (response) => {
          this.isLoading = false;
          this.exercises = response.data.map((exercise) => ({
            ...exercise,
            date: this.reformatDate(exercise.date), // Reformat date
          }));
        }
      );
    },
    toggleExerciseList() {
      this.showExerciseList = !this.showExerciseList;
      this.selectedDate = '';
      this.$refs.filterDateInput.value = '';
      if (!this.showExerciseList) {
        // Call getExerciseByDayByUserId when hiding the list
        this.getExerciseByUserId();
      }
    },
  },
};
</script>

<style scoped>
.container {
  display: flex;
  max-width: 1200px;
  margin: 20px auto;
}

.exercise-list-container {
  width: 66.67%;
  /* 2/3 of the width */
  float: left;
  box-sizing: border-box;
  padding-right: 10px;
  /* Adjust spacing between Exercise List and Visit List */
}

.exercise-list-wrapper {
  margin-top: 10px;
  /* Adjust as needed */
}

.exercise-list {
  list-style: none;
  padding: 0;
}

.button {
  font-family: 'Exo 2', sans-serif;
  border: none;
  border-radius: 4px;
  padding: 8px 16px;
  margin: 8px;
  cursor: pointer;
  background-color: #3498db;
  color: #fff;
  font-size: 14px;
}

.exercise-item {
  border: 1px solid #ddd;
  border-radius: 8px;
  margin-bottom: 20px;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.exercise-item:hover {
  transform: scale(1.02);
}

.exercise-name {
  font-size: 20px;
  font-weight: bold;
  color: #333;
}

.exercise-sets,
.exercise-reps,
.exercise-duration,
.exercise-weight,
.exercise-date {
  display: block;
  margin-top: 8px;
  font-size: 14px;
  color: #555;
}

.exercise-reps,
.exercise-duration {
  font-style: italic;
}

.exercise-date {
  color: #777;
}

.no-exercises-message {
  font-style: italic;
  color: #777;
  margin-top: 10px;
}
</style>