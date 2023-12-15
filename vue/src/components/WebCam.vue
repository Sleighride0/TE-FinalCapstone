<template>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <div class="main">
        <span class="header">
            <h1>Take a picture you wish to set as your profile image.</h1>
            <h4> Your image should be a portrait style shot, i.e shoulders and up. Make sure to smile! </h4>
        </span>
        <div class="card-deck" id="card-deck">
            <div class="card bg-light text-dark text-center rounded-lg" style="width: 30rem;" id="camera-container">
                <WebCam @photoTaken="photoTaken" @init="webcamInit" ref="webcam"
                    :constraints="{ video: { width: { ideal: 1080 }, height: { ideal: 1350 } }, facingMode: 'environment' }"
                    id="camera" />
                <select @change="setCamera" v-model="deviceId" id="device">
                    <option value="">-</option>
                    <option v-for="camera in cameras" v-bind:key="camera.id" :value="camera.deviceId">{{ camera.label }}
                    </option>
                </select>
                <div class="card-body">
                    <button v-on:click="takePhoto" id="take-photo-button"> Take Photo!</button>
                </div>
            </div>


            <div class="card bg-light text-dark text-center rounded-lg" style="width: 30rem;" id="taken-photo-container"
            >
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h4>New Image:</h4>
                    </li>
                    <li class="list-group-item"><img :src="imageSrc" class="taken-image" v-show="imageSrc" /></li>
                    <li class="list-group-item" v-show="!imageSrc" > Go ahead and take a picture! </li>
                    <li class="list-group-item" v-show="imageSrc"> Set this as your new photo?<button v-on:click="setProfilePicture()" id="yes-button"> Yes </button>
                        <button v-on:click="resetImage()" id="no-button"> No </button></li>
                </ul>
            </div>

            <div class="card bg-light text-dark text-center rounded-lg" style="width: 30rem;" id="profile-picture-container"
                >
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h4>Your current profile picture: </h4>
                    </li>
                    <li class="list-group-item"><img :src="profilePictureUrl" alt="Profile Picture" id="profile-picture" v-if="profilePictureUrl"/></li>
                    <li class="list-group-item" v-show="!profilePictureUrl" > You have not yet set a profile image. </li>
                </ul>
            </div>
        </div>
        <router-link v-bind:to="{ name: 'profile' }" class="nav-link" id="profile-link">Return</router-link>

    </div>
</template>
  
<script>
import { ref, onMounted } from 'vue';
import { useStore } from 'vuex';
import ProfileService from '../services/ProfileService';


export default {
    setup() {
        const store = useStore();
        const imageSrc = ref(null);
        const profilePictureUrl = ref(null); // Add this line


        const loadProfilePicture = async () => {
            const userId = store.getters.getUserId;
            ProfileService.getProfilePicture(userId)
                .then(response => {
                    console.log(response);
                    profilePictureUrl.value = response;
                })
                .catch(error => {
                    console.error('Error fetching profile picture:', error);
                });
        };

        onMounted(() => {
            loadProfilePicture();
        });

        return {
            showCamera: true,
            imageSrc,
            profilePictureUrl, // Add this line
            loadProfilePicture,
        };
    },
    data() {
        return {
            cameras: [],
            deviceId: '',
        }
    },
    methods: {
        photoTaken(PhotoTaken) {
            this.imageSrc = PhotoTaken.image_data_url
            console.log(PhotoTaken)
        },
        setUserId() {
            this.userId = this.$store.getters.getUserId;
        },
        loadCameras() {
            this.$refs.webcam.loadCameras()
            this.cameras = this.$refs.webcam.cameras;
        },
        webcamInit(deviceId) {
            this.deviceId = deviceId
            this.$emit('init', this.deviceId)
        },
        setCamera() {
            this.$refs.webcam.changeCamera(this.deviceId === '' ? null : this.deviceId)
        },
        takePhoto() {
            // Call the takePhoto method from the WebCam component
            this.$refs.webcam.takePhoto();
        },
        photoTakenEvent({ blob, image_data_url }) {
            this.$emit('photoTaken', { blob, image_data_url })
        },
        download() {
            if (!this.imageSrc) {
                return
            }
            const a = document.createElement("a");
            a.href = this.imageSrc;
            a.download = "Flex_Box_Profile_Image.jpg";
            a.click();
        },
        resetImage() {
            this.imageSrc = "";
        },
        setProfilePicture() {
            if (!this.imageSrc) {
                return;
            }
            if (this.profilePictureUrl === null) {
                const userId = this.$store.getters.getUserId;
                ProfileService.uploadProfilePicture(userId, this.imageSrc)
                    .then(response => {
                        console.log('Profile picture set successfully');
                        this.$router.go(0)
                    })
                    .catch(error => {
                        console.error('Error setting profile picture:', error);
                    });
            } else {
                const userId = this.$store.getters.getUserId;
                ProfileService.updateProfilePicture(userId, this.imageSrc)
                    .then(response => {
                        console.log('profile updated');
                        this.$router.go(0)
                    })
                    .catch(error => {
                        console.log(error.status)
                    });
            }

        },
    },
    // load cameras
    mounted() {


        this.cameras = this.$refs.webcam.cameras;
        if (this.cameras.length === 0) {
            // if no camera found, we will try to refresh cameras list each second until there is some camera
            let reloadCamInterval = setInterval(() => {
                this.loadCameras()
                if (this.cameras.length > 0) {
                    clearInterval(reloadCamInterval)
                }
            }, 1000);
        }

    },
}
</script>
  
<style scoped>
.main {
    width:98.2%;
    border-radius:8px;
    margin-left:10px;
    padding:5px;
    display: grid;
    text-align: center;
    background-color: #a7d6ef;
    font-family: "Exo 2", sans-serif;
    grid-template-columns: 1fr 1fr 1fr;
    grid-column-gap: 5px;
    grid-row-gap: 5px;
    grid-template-areas:
        "header header header"
        "card-deck card-deck card-deck"
        ". profile-link ."
}

#card-deck {
    grid-area: card-deck
}
#profile-link{
    grid-area: profile-link
}

#camera-container {
    grid-area: camera-container;
}

#camera {
    grid-area: camera;
    object-fit: cover;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

#take-photo-button {
    grid-area: take-photo;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    margin: 5px;
}

#take-photo-button:hover {
    cursor: pointer;
    transition: transform 0.3s ease;
    transform: scale(1.08);
}

#device {
    grid-area: device;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    margin: 5px;
}

#taken-photo-container {
    grid-area: tp-container
}

#profile-picture-container {
    grid-area: profile-pic;
}

#profile-picture {
    width: 100%;
    height: 100%;
    object-fit: cover;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.5);
}

#confirm-message {
    grid-area: confirmation
}

#confirm-selection {
    text-align: center;
    display: flex;
    column-gap: 5px;
    grid-area: confirm-selection
}

#yes-button {
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    border-radius: 6px;
    margin: 2px;
    width: 90px;
    height: 40px;

}

#yes-button:hover {
    transition: transform 0.3s ease;
    transform: scale(1.05);
    background-color: lightgreen;
    cursor: pointer;
}

#no-button {
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    border-radius: 6px;
    margin: 2px;
    width: 90px;
    height: 40px;


}

#no-button:hover {
    transition: transform 0.3s ease;
    transform: scale(1.05);
    background-color: lightcoral;
    cursor: pointer;
}

.taken-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    grid-area: taken-image;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.5);
}

.header {
    grid-area: header;
    background: #ffffffc5;
    border-style: solid;
    border-radius: 8px;
    border-width: 1px;
    margin-top: 15px;
    padding: 5px;
}</style>
