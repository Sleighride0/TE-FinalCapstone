import axios from 'axios';

export default {

  getEventList() {
    return axios.get('/events')
  },
}