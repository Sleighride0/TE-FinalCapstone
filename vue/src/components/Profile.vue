<template>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

  <div class="card-deck">
    <div class="card bg-light text-dark text-center rounded-sm" style="width: 18rem;">
      <p v-if="profile.profilePicUrl == undefined"> You have not yet set a profile image! </p>
      <img v-if="profile.profilePicUrl" :src="profile.profilePicUrl" alt="Profile Picture" class="rounded-lg border border-dark" />
      <div class="card-body">
        <h5 class="card-title">My Profile</h5>
      </div>
      <ul class="list-group list-group-flush">
        <li class="list-group-item bg-light text-dark">Username: {{ profile.username }}</li>
        <li class="list-group-item bg-light text-dark">Email Address: {{ profile.emailAddress }}</li>
      </ul>
      <div class="card-body">
        <router-link v-bind:to="{ name: 'camera' }">Update Your Profile Pic</router-link>
      </div>
    </div>

    <div class="card bg-light" style="width: 18rem;">
      <div class="card-body">
        <total-visit-time/>
      </div>
    </div>

  </div>
</template>

<script>
import { ref, onMounted, watchEffect } from 'vue';
import { useStore } from 'vuex';
import ProfileService from "../services/ProfileService";
import TotalVisitTime from '../components/TotalVisitTime.vue';

export default {
  setup() {
    const store = useStore();
    const profile = ref({
      userId: null,
      username: "",
      profilePicUrl:"",
      emailAddress: "",
      visitDurationGoal: 0,
    });

    const loadProfileData = async () => {
      const userId = store.getters.getUserId;
      try {
        // Fetch user profile data
        const profileResponse = await ProfileService.getProfileByUserId(userId);
        profile.value = profileResponse.data;

        // Fetch profile picture
        const pictureResponse = await ProfileService.getProfilePicture(userId);
        profile.value.profilePicUrl = pictureResponse;
      } catch (error) {
        console.error('Error fetching profile data:', error);
      }
    };

    onMounted(loadProfileData);
    watchEffect(() => {
      loadProfileData(); // Watch for changes in userId and reload the profile data
    });

    return {
      profile,
    };
  },
  components: {
    TotalVisitTime
  }
};
</script>

  
<style scoped>

.profile-picture {
  max-width: 100%;
  /* Adjust the width as needed */
  margin-top: 10px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>