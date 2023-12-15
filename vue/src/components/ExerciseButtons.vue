
<template>
  <div class="exercise-buttons">
    <button class="exercise-button"
      v-for="exerciseOption in exerciseOptions"
      :key="exerciseOption.id"
      @click="handleButtonClick(exerciseOption)"
    >
      
      <img
      :src="`/assets/${exerciseOption.name.toLowerCase().replace(/\s+/g, '')}.png`"
        alt="Exercise Image"
        class="button-icon"
      />
      {{ exerciseOption.name }}
    </button>
  </div>
</template>

<script>
export default {
  props: ['mode', 'selectExercise', 'playVideo'],
  data() {
    return {
      exerciseOptions: [
        { id: 1, name: "Bench Press", mode: "reps", videoId: 'z5u8DDnaZSg' },
        { id: 2, name: "Treadmill", mode: "duration", videoId: 't5CXJA8ZTY4' },
        { id: 3, name: "Dumbells", mode: "reps", videoId: 'yINN07eVVyg' },
        { id: 4, name: "Lat Pulldown", mode: "reps", videoId: 'qthXlEbdGEc' },
        { id: 5, name: "Rowing Machine", mode: "duration", videoId: '_PALjGstyFM' },
        { id: 6, name: "Stairmaster", mode: "duration", videoId: 'W9hTmXgdJcw' },
        { id: 7, name: "Squats", mode: "reps", videoId: 'nzK3Vd0q0Ew' },
        { id: 8, name: "Russian Twist", mode: "duration", videoId: 'oq--8TSF7LQ' },
        { id: 9, name: "Leg Extension Machine", mode: "reps", videoId: 'XIm_DQ_K5hU' },
        { id: 10, name: "Fly", mode: "reps", videoId: 't7ylA_jv9Yg' },
        { id: 11, name: "Dips", mode: "reps", videoId: 'lcAI2vqZXcM' },
        { id: 12, name: "Abdominal Crunch", mode: "reps", videoId:'7T0ZUEt1m8s' },
        { id: 13, name: "Elliptical", mode: "duration", videoId: 'curSJrn6X0o' },
        { id: 14, name: "Deadlift", mode: "reps", videoId: '0W6nKe6GL9k' },
        { id: 15, name: "Planks", mode: "duration", videoId: 'g-bPs3dX7MM' },
        { id: 16, name: "Assault Bike", mode: "duration", videoId: 'IqgIv2LPTiE' },
        { id: 17, name: "Push Ups", mode: "reps", videoId: 'cLSO6DjOsi8' },
        { id: 18, name: "Pulley", mode: "reps", videoId: 'I_LbV5DNr54' },
      ],
    };
  },
  methods: {
    handleButtonClick(exerciseOption) {
      if (this.mode === 'select') {
        this.selectExercise(exerciseOption);
      } else if (this.mode === 'play') {
        this.playVideo(exerciseOption.videoId, exerciseOption.name);
      } else if (this.mode === 'changeVideo') {
        this.changeVideo(exerciseOption.videoId, exerciseOption.name);
      }
    }
  }
};
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=Exo+2:wght@400;700&display=swap');

  .exercise-buttons {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 20px;
  }

  .exercise-button {
    font-family: 'Exo 2', sans-serif;
    background-color: #3498db;
    color: #fff;
    padding: 10px 15px;
    margin: 0 10px 10px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    width: calc(33.33% - 10px); /* Adjust the margin based on your preference */
    flex-basis: calc(33.33% - 10px);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    height: 120px; /* Set a fixed height for the buttons */
  }

  .button-text {
    max-height: 40px; /* Adjust the max-height based on your preference */
    overflow: hidden;
    font-family: 'Exo 2', sans-serif;
  }

  .button-icon {
    max-width: 100%;
    max-height: 60%; /* Adjust the max-height based on your preference */
    object-fit: contain; /* Preserve aspect ratio while fitting within the specified dimensions */
    margin-bottom: 8px; /* Adjust this margin based on your preference */
  }

  .exercise-button:hover {
    background-color: #2980b9;
  }
  @media screen and (max-width: 400px) {
    .exercise-button {
      width: calc(30% - 10px); /* Adjust the margin based on your preference */
      flex-basis: calc(30% - 10px);
    }
  }

</style>
