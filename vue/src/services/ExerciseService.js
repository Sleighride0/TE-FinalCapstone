import axios from 'axios';

export default {

  addExercise(newExercise) {
    return axios.post('/exercise', newExercise)
  },

  getExerciseByUserId(userId) {
    return axios.get(`/exercise/${userId}`)
  },

  getTotalVisitDurationByUserId(userId) {
    return axios.get(`/visits/${userId}/duration`)
  },
  getExerciseByDayByUserId(userId, date){
    return axios.get(`/exercise/${userId}/${date}`)
  },
  getMostUsedDurationEquipmentByMonth(monthNum){
    return axios.get(`/exercise/mostUsed/duration/${monthNum}`)
  },
  getMostUsedRepsEquipmentByMonth(monthNum){
    return axios.get(`/exercise/mostUsed/reps/${monthNum}`)
  }

}