<template>
  <div class="exercise-list">
    <h2>List of Exercises:</h2>
    <button @click="loadPreviousPage" :disabled="offset === 0">Load Previous Page</button>
    <button @click="loadNextPage">Load Next Page</button>
    <ul class="list">
      <li v-for="exercise in englishExercises" :key="exercise.id">
        <span class="exercise-name">{{ exercise.name }}</span>
        <p class="exercise-description">{{ sanitizeHTML(exercise.description) }}</p>
      </li>
    </ul>
  </div>
</template>
  
<script>
import axios from 'axios';

export default {
  data() {
    return {
      englishExercises: [],
      exerciseImages: [],
      exerciseUrl: "",
      offset: 0,
      limit: 20,
    };
  },
  mounted() {
    this.getEnglishExercises();
    this.getExerciseImage();
  },

  methods: {
    async getEnglishExercises() {
      try {
        const response = await axios.get('https://wger.de/api/v2/exercise/', {
          params: {
            language: 2,
            limit: this.limit,
            offset: this.offset,
          },
          headers: {
            Authorization: '0cbf2789d52b1545ca9b839866d21f12c428a9e5',
          },
        });

        if (response.status === 200) {
          this.englishExercises = response.data.results;
        } else {
          console.error(`Error: ${response.status}`);
        }
      } catch (error) {
        console.error('An error occurred while fetching data:', error);
      }
    },
    async getExerciseImage() {
      try {
        const response = await axios.get('https://wger.de/api/v2/exerciseimage/', {
          headers: {
            Authorization: '0cbf2789d52b1545ca9b839866d21f12c428a9e5',
          },
        });

        if (response.status === 200) {
          this.exerciseImages = response.data.results;
        } else {
          console.error(`Error: ${response.status}`);
        }
      } catch (error) {
        console.error('An error occurred while fetching data:', error);
      }
    },
    sanitizeHTML(html) {
      const doc = new DOMParser().parseFromString(html, 'text/html');
      return doc.body.textContent || '';
    },
    loadNextPage() {
      this.offset += this.limit;
      this.getEnglishExercises();
    },
    loadPreviousPage() {
      if (this.offset >= this.limit) {
        this.offset -= this.limit;
        this.getEnglishExercises();
      }
    },
  },
};
</script>
  
<style scoped>
.exercise-list {
  background-color: #ffffffc4;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.list {
  list-style: none;
  padding: 0;
}

li {
  background-color: #f5f5f5;
  /* Light grey background */
  padding: 10px;
  margin-bottom: 10px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.exercise-name {
  font-weight: bold;
  font-size: 1.2em;
  color: #333;
}

.exercise-description {
  font-size: 1em;
  color: #555;
}

button {
  margin-top: 10px;
  padding: 8px 16px;
  font-size: 1em;
  cursor: pointer;
  background-color: #6ad5e5;
  color: #fff;
  border: none;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

button:disabled {
  background-color: #ddd;
  color: #777;
  cursor: not-allowed;
}
</style>