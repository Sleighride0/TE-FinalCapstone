<template>
  <div class="main">
    <p id="instructions"> Search the User Id of a specific user. Search all exercises will return all of that users listed
      exercises. You can also check the user in and out.</p>

    <div id="searchButton">
      <button class="button toggle-btn" v-on:click="toggleEmployeeForm">
        {{ showEmployeeForm ? 'Hide Employee Search' : 'Show Employee Search' }}
      </button>
    </div>

    <div class="search-form" v-show="showEmployeeForm">
      <span v-show="showErrorMessage" class="error-message"> {{ errorMessage }} </span>
      <div class="input-box">
        <label for="userIdInput" id="user-id-label">Enter User Id:</label>
        <input type="number" id="user-id-input" v-model="userId" min=0 />
        
      </div>
      <div id="check-inout-button">
        <button @click="toggleCheckInOut" :class="{ 'check-btn-in': !isCheckedIn, 'check-btn-out': isCheckedIn }">
          {{ checkInOutLabel }}
        </button>
      </div>
      <span class="system-message" v-show="showMessage">
        <span v-show="isCheckedIn" class="status-message">User checked in</span>
        <span v-show="!isCheckedIn" class="status-message">User checked out</span>
      </span>

      <div class="exercise-filter">
        <label for="filterDate">Filter Exercises by Date</label>
        <input type="date" id="filterDate" v-model="selectedDate" ref="filterDateInput" required />
        <button class="button" @click="getExerciseByDayByUserId(this.userId, this.selectedDate)">Search</button>
        <button class="button" @click="toggleExerciseList">
          {{ showExerciseList ? 'Hide' : 'Show' }} Results
        </button>
      </div>

      <div class="exercise-list-container" v-if="showExerciseList">
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
import CheckInOutService from "../services/CheckInOutService";

export default {
  data() {
    return {
      totalVisitDuration: "",
      errorMessage: "",
      exercises: [],
      showEmployeeForm: false,
      showMessage: false,
      showErrorMessage: false,
      showExerciseList: false,
      selectedDate: "",
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
      currentTime: null,
      checkOutTime: null,
      isCheckedIn: false,
      visitDuration: "",
      CheckInOut: {
        userVisitId: "",
        checkInTime: "",
        checkOutTime: "",
        duration: "",
        userId: "",
      },
    };
  },
  methods: {
    toggleEmployeeForm() {
      this.showEmployeeForm = !this.showEmployeeForm;
    },

    toggleExerciseList() {
      this.showExerciseList = !this.showExerciseList;
      this.selectedDate = '';
      this.$refs.filterDateInput.value = '';
      if (!this.showExerciseList) {
        this.getExerciseByUserId(this.userId);
      }
    },

    switchMessage() {
      setTimeout(() => {
        this.showMessage = false;
        this.showErrorMessage = false;
      }, 5000);
    },

    employeeGetExerciseByUserId(userId) {
      if (this.userId <= 0) {
        this.errorMessage = "Please enter a valid User ID to search."
        this.showErrorMessage = true;
        this.switchMessage();
      } else {
        ExerciseService.getExerciseByUserId(userId)
          .then((response) => {
            this.isLoading = false;
            this.exercises = response.data;
          }).catch(error => {
            this.handleErrorResponse(error);
          });
      }
    },

    getExerciseByDayByUserId(userId, selectedDate) {
      if (!this.selectedDate) {
        this.errorMessage = "Please enter a valid date to search."
        this.showErrorMessage = true;
        this.switchMessage();
      } else if (this.userId <= 0) {
        this.errorMessage = "Please enter a valid User ID to search."
        this.showErrorMessage = true;
        this.switchMessage();
      } else {
        this.isLoading = true;
        ExerciseService.getExerciseByDayByUserId(userId, selectedDate)
          .then((response) => {
            this.isLoading = false;
            this.exercises = response.data.map((exercise) => ({
              ...exercise,
              date: this.reformatDate(exercise.date), // Reformat date
            }));
          });
      }
    },

    formatDate(date) {
      const options = { year: "numeric", month: "short", day: "numeric" };
      return new Date(date).toLocaleDateString("en-US", options);
    },

    reformatDate(date) {
      // Assuming date is in "YYYY-MM-DD" format
      const [year, month, day] = date.split("-");
      return `${month}/${day}/${year}`;
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

    getCurrentTime() {
      this.currentTime = new Date();
      // this.currentTime = this.currentTime.toLocaleString('en-US', { timeZone: 'America/New_York' });
    },

    setCheckInTime() {
      this.CheckInOut.checkInTime = this.currentTime;
    },

    setCheckOutTime() {
      this.CheckInOut.checkOutTime = this.currentTime;
    },

    setUserId() {
      this.CheckInOut.userId = this.userId;
    },

    checkUserId() {
      if (this.userId <= 0) {
        this.errorMessage = "Please enter a valid User ID to search."
      }
    },

    calculateDuration() {
      const checkInTime = new Date(this.CheckInOut.checkInTime);
      const checkOutTime = new Date(this.CheckInOut.checkOutTime);
      const durationInMillis = checkOutTime - checkInTime;
      const durationInMinutes = Math.floor(durationInMillis / (1000 * 60));
      this.CheckInOut.duration = `${durationInMinutes}`;
    },

    sendCheckIn() {
      if (this.userId <= 0) {
        this.errorMessage = "Please enter a valid User ID to search."
        this.showErrorMessage = true;
        this.switchMessage();
      } else {
        this.getCurrentTime(),
          this.setCheckInTime(),
          this.setUserId(),
          CheckInOutService.checkIn(this.CheckInOut)
            .then((response) => {
              if (response.status === 200) {
                //we are successful
                console.log(response.data);
                this.CheckInOut.userVisitId = response.data.userVisitId;
                this.isCheckedIn = true;
                this.showMessage = true;
                this.switchMessage();
              }
            }).catch(error => {
              this.handleErrorResponse(error);
            });
      }
    },

    sendCheckOut() {
      this.getCurrentTime(),
        this.setCheckOutTime(),
        this.setUserId(),
        this.calculateDuration();
      this.visitDuration = this.CheckInOut.duration;
      CheckInOutService.checkOut(this.CheckInOut).then((response) => {
        if (response.status === 200) {
          //we are successful
          console.log(response.data);
          this.isCheckedIn = false;
          this.showMessage = true;
          this.switchMessage();
          this.CheckInOut.checkOutTime = new Date();
          this.checkOutTime = this.CheckInOut.checkOutTime.toLocaleString(
            "en-US",
            { timeZone: "EST" }
          );

          this.CheckInOut = {};
        }
      });
    },

    handleErrorResponse(error) {
      console.log(error);
      this.showErrorMessage = true;
      this.switchMessage();
      if (error.response) {
        this.errorMessage = 'Error: ' + error.response.status;
      }
      else if (error.request) {
        this.errorMessage = 'Error: server unavailable';
      }
      else {
        this.errorMessage = 'Woe, error be upon ye';
      }

    },

    toggleCheckInOut() {
      if (this.isCheckedIn) {
        this.sendCheckOut();
      } else {
        this.sendCheckIn();
      }
    },
  },

  computed: {
    formattedCheckInTime() {
      return this.CheckInOut.checkInTime.toLocaleString("en-US", { timeZone: "EST" });
    },
    formattedCheckOutTime() {
      return this.CheckInOut.checkOutTime.toLocaleString("en-US", { timeZone: "EST" });
    },
    checkInOutLabel() {
      return this.isCheckedIn ? "Check Out" : "Check In";
    },
  },

};
</script>

<style scoped>
.main {
  text-align: center;
  margin-top: 20px;
  background-color: #a7d6ef;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
  border-radius: 10px;
  display: flex;
  /* Use flexbox */
  flex-direction: column;
  /* Stack elements vertically */
  align-items: center;
}

#searchButton {
  margin-bottom: 20px;
  font-family: 'Exo 2', sans-serif;

}

.toggle-btn {
  font-family: 'Exo 2', sans-serif;
  background-color: #3498db;
  color: #fff;
  padding: 10px 20px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.search-form {
  margin-top: 20px;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-row-gap: 10px;
  grid-template-areas:
    "instructions instructions instructions"
    "exercise-filter input-box check-inout-button"
    ". error-message system-message"
    "exercise-list . ."


}

#user-id-input {
  grid-area: user-id-input;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  width: 100px;
  text-align: center;
  border-radius: 5px;
}

#user-id-label {
  grid-area: user-id-label
}

#instructions {
  grid-area: instructions;
  margin: 10px 10px 10px 10px;
}

#check-inout-button {
  grid-area: check-inout-button
}

.system-message {
  grid-area: system-message;
  align-items: center;
  margin-top: 10px;
  margin-bottom: 10px;
}

.button.search-btn {
  font-family: 'Exo 2', sans-serif;
  background-color: #fff;
  color: #333;
  /* Set text color to a dark color */
  padding: 10px 20px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;
  /* Added color transition */
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;

  grid-area: search-exercise-button
}

.button.search-btn:hover {
  background-color: #f0f0f0;
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
  transform: scale(1.02);

}


.check-btn-in,
.check-btn-out {
  font-family: 'Exo 2', sans-serif;
  background-color: #2ecc71;
  /* Green color for Check In */
  color: #fff;
  padding: 20px 20px;
  /* Increased padding for a bigger button */
  font-size: 20px;
  /* Increased font size */
  cursor: pointer;
  border: none;
  border-radius: 12px;
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  /* Subtle box shadow for a modern look */
}

.check-btn-in:hover {
  background-color: #27ae60;
  /* Darker green on hover */
}

.input-box {
  grid-area: input-box;
}

.exercise-filter {
  grid-area: exercise-filter;
}

.check-btn-out {
  background-color: #e74c3c;
  /* Red color for Check Out */
}

.check-btn-out:hover {
  background-color: #c0392b;
  /* Darker red on hover */
}

.status-message {
  margin-top: 10px;
  font-size: 16px;
  text-align: center;
  padding: 5px;
  color: #090909;
  border-radius: 5px;
  width: 35%;
  font-weight: bold;
}

.error-message {
  color: red;
  font-weight: bold;
  font-size: 16px;
  grid-area: error-message;
}

.exercise-list-container {
  margin-top: 20px;
  grid-area: exercise-list;
}

.exercise-list {
  list-style: none;
  padding: 0;
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
</style>