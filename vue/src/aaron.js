// src/api.js
import axios from 'axios';

const baseURL = 'https://cors-anywhere.herokuapp.com/https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/db.json';

export const getExercises = async () => {
  try {
    const response = await axios.get(baseURL);
    return response.data;
  } catch (error) {
    console.error('Error fetching exercises:', error);
    throw error;
  }
};
