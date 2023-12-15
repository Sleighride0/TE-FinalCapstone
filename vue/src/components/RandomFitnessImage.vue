<template>
    <div>
      <img :src=randomImageUrl alt="random image" id="thang"/>
    </div>
  </template>
    
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        exerciseImages: [],
        randomInt:"",
        randomImageUrl: ""
      };
    },
    mounted() {
      this.getExerciseImage();
    },
  
  
    methods: {
      async getExerciseImage() {
        try {
          const response = await axios.get('https://wger.de/api/v2/exerciseimage/', {
  
            headers: {
              Authorization: '0cbf2789d52b1545ca9b839866d21f12c428a9e5',
            },
          });
  
          if (response.status === 200) {
            this.exerciseImages = response.data.results;
            this.cycleImage();
          } else {
            console.error(`Error: ${response.status}`);
          }
        } catch (error) {
          console.error('An error occurred while fetching data:', error);
        }
      },

      cycleImage(){
        this.randomInt = Math.floor(Math.random() * 20)
        this.randomImageUrl = this.exerciseImages[this.randomInt].image;
      }
    },
  };
  </script>
  
  <style scoped>
  #thang{
    width:auto;
    height:100px;
  }
  </style>
    