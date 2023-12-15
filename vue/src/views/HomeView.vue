<template>
  <div class="home">
    <h1 class="welcome-header">Welcome to FlexBox</h1>
    <div class="content">
      <div class="dashboard-section exercise-log-container">
        <exercise-log />
      </div>
      <div class="dashboard-section event-list-container">
        <event-list />
      </div>
    </div>
  </div>
</template>

<script>
import ExerciseLog from "../components/ExerciseLog.vue";
import EventList from "../components/EventList.vue";



export default {
  components: {
    ExerciseLog,
    EventList,
    
   
  },
  data() {
  },
  methods: {
    setCheckInOutTime() { },
    
  }
}

</script>

<style scoped>
@font-face {
  font-family: "Exo 2";
  src: url("@/fonts/Exo2-VariableFont_wght.ttf") format("truetype");
  font-weight: normal;
  font-style: normal;
}

.home {
  font-family: "Exo 2", sans-serif;
  text-align: center;
  margin: 50px auto;
  padding: 30px;
  width: auto;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  position: relative;
  border-radius:8px;
}

.random-image{
  grid-area:random-image
}

.home:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #a7d6ef;
  z-index: -1;
}

.welcome-header {
  font-size: 50px;
  /* Adjust the font size as needed */
  color: #333;
  /* Change the color as needed */
}

.content {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-areas: "checkIn checkIn events" "logExercise logExercise events";
  grid-gap: 20px;
  align-items: center;
  margin-top: 20px;
}

.check-in-out-container {
  grid-area: checkIn;
}

.exercise-log-container {
  grid-area: logExercise;
}

.event-list-container {
  grid-area: events;
}

.dashboard-container {
  flex-grow: 1;
  position: relative;
  z-index: 2;
}

.dashboard-section {
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  padding: 20px;
}

.dashboard-section h2 {
  color: #3498db;
  font-size: 24px;
  margin-bottom: 15px;
}

@media screen and (max-width: 400px) {
  .content {
    grid-template-columns: 1fr;
    grid-template-areas:
      "checkIn"
      "logExercise"
      "events";
  }
}

</style>