

import axios from 'axios';

export default {


  getProfileByUserId(userId) {
    return axios.get(`/profile/${userId}`)
  },
  updateVisitDurationGoalByUserId(goal, userId){
    return axios.put(`/profile/${goal}/${userId}`)
  },
  createProfile(profile) {
    return axios.post('/profile/createProfile', profile)
      
  },
  uploadProfilePicture(userId, imageDataUrl) {
    const base64String = imageDataUrl.split(",")[1];
    return axios.post(`/profile/uploadPicture/${userId}`, { base64String })
  },

  updateProfilePicture(userId, imageDataUrl) {
    const base64String = imageDataUrl.split(",")[1];
    return axios.put(`/profile/updatePicture/${userId}`, { base64String })
  },


  getProfilePicture(userId) {
    return axios.get(`/profile/getPicture/${userId}`, { responseType: 'arraybuffer' })
      .then(response => { 
        const base64String = btoa(
          new Uint8Array(response.data)
            .reduce((data, byte) => data + String.fromCharCode(byte), '')
        );
        return `data:${response.headers['content-type']};base64,${base64String}`;
      })
      .catch(error => {
        console.error('Error fetching profile picture:', error);
        throw error;
      });
  },
};

