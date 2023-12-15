<template>
  <div class="profile-view">
    <div class="utilContainer">
      
      <h2>Need Help?</h2>
      <p id="instructions"> Click an exercise below to watch a short tutorial.</p>
      <div id="searchButton">
        
        
      </div>
    </div>
      <h1 class="exercise-bar">{{ currentExerciseName }}</h1>
      <LiteYouTubeEmbed :videoId="currentVideoId" class="video-container" />

      <div class="video-buttons">
        <button class="toggle-btn" @click="changeVideo('qthXlEbdGEc', 'Lat Pulldown')">
          <div class="button-icon-container">
            <img src="../assets/latpulldown.png" alt="lat Image" class="button-icon" />
          </div>
          <div class="button-text">Lat Pulldown</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('z5u8DDnaZSg', 'Bench Press')">
          <div class="button-icon-container">
            <img src="../assets/benchpress.png" alt="benchpress Image" class="button-icon" />
          </div>
          <div class="button-text">Bench Press</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('yINN07eVVyg', 'Dumbbell')">
          <div class="button-icon-container">
            <img src="../assets/Dumbells.png" alt="Dumbbell Image" class="button-icon" />
          </div>
          <div class="button-text">Dumbbell</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('t7ylA_jv9Yg', 'Fly')">
          <div class="button-icon-container">
            <img src="../assets/fly.png" alt="fly Image" class="button-icon" />
          </div>
          <div class="button-text">Fly</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('nzK3Vd0q0Ew', 'Squats')">
          <div class="button-icon-container">
            <img src="../assets/squats.png" alt="squat Image" class="button-icon" />
          </div>
          <div class="button-text">Squats</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('XIm_DQ_K5hU', 'Leg Extension Machine')">
          <div class="button-icon-container">
            <img src="../assets/legExtensionmachine.png" alt="leg extension Image" class="button-icon" />
          </div>
          <div class="button-text">Leg Extension Machine</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('lcAI2vqZXcM', 'Dips')">
          <div class="button-icon-container">
            <img src="../assets/dips.png" alt="dip Image" class="button-icon" />
          </div>
          <div class="button-text">Dips</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('W9hTmXgdJcw', 'Stairmaster')">
          <div class="button-icon-container">
            <img src="../assets/stairmaster.png" alt="stairmaster Image" class="button-icon" />
          </div>
          <div class="button-text">Stairmaster</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('t5CXJA8ZTY4', 'Treadmill')">
          <div class="button-icon-container">
            <img src="../assets/Treadmill.png" alt="Treadmill Image" class="button-icon" />
          </div>
          <div class="button-text">Treadmill</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('IqgIv2LPTiE', 'Assault Bike')">
          <div class="button-icon-container">
            <img src="../assets/assaultbike.png" alt="bike Image" class="button-icon" />
          </div>
          <div class="button-text">Assault Bike</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('_PALjGstyFM', 'Seated Cable Row')">
          <div class="button-icon-container">
            <img src="../assets/rowingmachine.png" alt="rowing Image" class="button-icon" />
          </div>
          <div class="button-text">Seated Cable Row</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('0W6nKe6GL9k', 'Deadlift')">
          <div class="button-icon-container">
            <img src="../assets/deadlift.png" alt="deadlift Image" class="button-icon" />
          </div>
          <div class="button-text">Deadlift</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('curSJrn6X0o', 'Elliptical')">
          <div class="button-icon-container">
            <img src="../assets/Elliptical.png" alt="Elliptical Image" class="button-icon" />
          </div>
          <div class="button-text">Elliptical</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('g-bPs3dX7MM', 'Planks')">
          <div class="button-icon-container">
            <img src="../assets/planks.png" alt="plank Image" class="button-icon" />
          </div>
          <div class="button-text">Planks</div>
        </button>

        <button class="toggle-btn" @click="changeVideo('cLSO6DjOsi8', 'Pushups')">
          <div class="button-icon-container">
            <img src="../assets/pushups.png" alt="pushup Image" class="button-icon" />
          </div>
          <div class="button-text">Pushups</div>
        </button>
        <button class="toggle-btn" @click="changeVideo('I_LbV5DNr54', 'Pulley')">
          <div class="button-icon-container">
            <img src="../assets/pulley.png" alt="pulley Image" class="button-icon" />
          </div>
          <div class="button-text">Pulley</div>
        </button>
        <button class="toggle-btn" @click="changeVideo('oq--8TSF7LQ', 'Twist')">
          <div class="button-icon-container">
            <img src="../assets/russiantwist.png" alt="twist Image" class="button-icon" />
          </div>
          <div class="button-text">Twists</div>
        </button>
        <button class="toggle-btn" @click="changeVideo('7T0ZUEt1m8s', 'Crunch')">
          <div class="button-icon-container">
            <img src="../assets/abdominalcrunch.png" alt="crunch Image" class="button-icon" />
          </div>
          <div class="button-text">Crunch Machine</div>
        </button>
      </div>
    </div>
</template>
  
  
<script>
import LiteYouTubeEmbed from '../components/LiteYouTubeEmbed.vue';
import 'vue-lite-youtube-embed/style.css';


export default {
  components: {
    LiteYouTubeEmbed,
   
  },
  data() {
    return {
      currentVideoId: 'qthXlEbdGEc', // Default video ID
      currentExerciseName: 'Lat Pulldown', // Default exercise name
    };
  },
  methods: {
    changeVideo(videoId, exerciseName) {
      this.currentVideoId = videoId;
      this.currentExerciseName = exerciseName;
    },
  },
};
</script>
  
<style scoped>
.profile-view {
  font-family: 'Exo 2', sans-serif;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  text-align: center;
  /* Center the content horizontally */
  background-color: #f4f4f4; /* Grey background color */
  box-shadow: 0 0 20px 5px rgba(0, 0, 0, 0.1); /* Grey box shadow with increased spread radius */
  border-radius: 10px; /* Rounded corners */
}

.exercise-bar {
  background-color: #3498db;
  color: #fff;
  padding: 10px 20px;
  /* Increased padding for a slightly rounded appearance */
  margin-bottom: 20px;
  /* Add space below the exercise bar */
  border-radius: 5px;
  /* Added border-radius for rounded corners */
  display: inline-block;
  /* Make it an inline-block to fit the content width */
}

.video-container {
  border: 4px solid #0246d0;
  /* Increased border size around the video */
  border-radius: 8px;
  /* Added border-radius for rounded corners */
}

.video-buttons {
  margin-top: 20px;
  display: flex;
  /* Use flexbox to align buttons */
  justify-content: center;
  /* Center the buttons horizontally */
  flex-wrap: wrap;
  /* Allow buttons to wrap to the next line if needed */
}

.toggle-btn {
  font-family: 'Exo 2', sans-serif;
  background-color: #3498db;
  color: #fff;
  padding: 20px;
  flex: 0 0 calc(33.33% - 20px);

  margin: 0 10px 20px 10px;

  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.button-icon-container {
  font-family: 'Exo 2', sans-serif;
  margin-bottom: 10px;
}

.button-icon {
  width: auto;
  height: 60px;
  margin-right: 10px;
}

.toggle-btn:hover {
  background-color: #2980b9;
}

@media screen and (max-width: 600px) {
  .toggle-btn {
    flex-basis: calc(33.33% - 20px);
    /* Adjust the width for three buttons per row in mobile view */
  }

  .utilContainer {
    font-family: 'Exo 2', sans-serif;
    display: grid;
    grid-template-columns: 50% 50%;
    grid-column-gap: 50px;
  }
}
</style>