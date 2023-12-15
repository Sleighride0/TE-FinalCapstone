<template>
  <div class="body">
    <div class="profile-view">
      <div class="profile-visit-container">
        <profile />
      </div>
      <div class="exercise-container">
        <exercise-list />
      </div>
      <div class="chart-container">
        <visit-chart />
      </div>
    </div>
  </div>
</template>

<script>
import ExerciseList from '../components/ExerciseList.vue';
import VisitChart from '../components/VisitChart.vue';
import Profile from '../components/Profile.vue';

export default {
  components: {
    ExerciseList,
    VisitChart,
    Profile
  }
}
</script>

<style scoped>
.profile-view {
  font-family: 'Exo 2', sans-serif;
  width: 100%;
  flex-direction: column;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 0 0 10px 10px;
}

.profile-visit-container {
  display: grid;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 15px;
}

.exercise-container {
  grid-area: exerciseList;
  width: 100%;
  flex: 2;
  margin-right: 20px;
  padding: 20px;
  background-color: #ffffffc0;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.chart-container {
  grid-area: chart;
  width: 92;
  padding: 40px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-top: 20px;
}
</style>