import { createApp } from 'vue'
import CapstoneApp from './App.vue'
import { createStore } from './store'
import router from './router'
import axios from 'axios'
import { Bar } from 'vue-chartjs'
import VueCameraLib from 'vue-camera-lib'


/* sets the base url for server API communication with axios */
axios.defaults.baseURL = import.meta.env.VITE_REMOTE_API;

/*
 * The authorization header is set for axios when you login but what happens when 
 * you come back or the page is refreshed. When that happens you need to check 
 * for the token in local storage and if it exists you should set the header 
 * so that it will be attached to each request.
 */
let currentToken = localStorage.getItem('token');
let currentUser = JSON.parse(localStorage.getItem('user'));

if (currentToken) {
  // Set token axios requests
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

// Create the Vuex store passing in the stored credentials
const store = createStore(currentToken, currentUser);

const app = createApp(CapstoneApp);
app.use(store);
app.use(router);
app.use(VueCameraLib);
app.mount('#app');

// const createScannerElements = () => {
//   const appDiv = document.getElementById('app');

//   const scannerContainer = document.createElement('div');
//   scannerContainer.id = 'scanner-container';

//   const video = document.createElement('video');
//   video.id = 'scanner';
//   video.width = '100%';
//   video.height = '100%';
//   video.autoplay = true;

//   scannerContainer.appendChild(video);
//   appDiv.appendChild(scannerContainer);

//   const resultDiv = document.createElement('div');
//   resultDiv.id = 'result';
//   appDiv.appendChild(resultDiv);
// };

// const initializeScanner = () => {

// }