<template>
  <div>
    <h2>Visit Metrics</h2>
    <div class="search-options">
      <label for="monthNumInput">Enter Month Number:</label>
      <input type="number" id="monthNumInput" v-model="monthNum" />
      <button class="button" @click="getVisitsByMonthByUserId(monthNum)">Search</button> |
      <button class="button" @click="getVisitsByWeekByUserId">View Past Week Visits</button> |
      <button class="button" @click="getVisitsByUserId">View All Visits</button>
    </div>
    <ul class="visit-list">
      <li v-for="visit in visits" :key="visit.visitId" class="visit-item">
        <span class="visit-id">Visit ID: {{ visit.visitId }}</span>
        <span class="visit-check-in">Check In: {{ formatDateTime(visit.checkInTime) }}</span>
        <span class="visit-check-out">Check Out: {{ formatDateTime(visit.checkOutTime) }}</span>
        <span class="visit-duration">Duration: {{ visit.duration }} minutes</span>
      </li>
    </ul>
  </div>
</template>
  
<script>
import ExerciseService from '../services/ExerciseService';
import CheckInOutService from '../services/CheckInOutService';

export default {
  data() {
    return {
      visits: [],
      userId: null,
      visit: {
        visitId: "",
        userId: "",
        checkInDate: "",
        checkOutDate: "",
        duration: "",
      },
      monthNum: null,
    };
  },
  mounted() {
    this.setUserId();
    this.getVisitsByUserId();
    this.getTotalVisitDurationByUserId();
  },
  methods: {
    setUserId() {
      this.visit.userId = this.$store.getters.getUserId;
    },
    getVisitsByUserId() {
      this.isLoading = true;
      CheckInOutService.getVisitsByUserId(this.$store.getters.getUserId).then(
        (response) => {
          this.visits = response.data;
        }
      );
    },
    getVisitsByWeekByUserId() {
      this.isLoading = true;
      CheckInOutService.getVisitsByWeekByUserId(this.$store.getters.getUserId).then(
        (response) => {
          this.visits = response.data;
        }
      );
    },
    getVisitsByMonthByUserId(monthNum) {
      
      this.isLoading = true;
      CheckInOutService.getVisitsByMonthByUserId(this.$store.getters.getUserId, monthNum).then(
        (response) => {
          this.visits = response.data;
        }
      );
    },
    getVisitsByDayByUserId(date) {
      this.isLoading = true;
      CheckInOutService.getVisitsByDayByUserId(this.$store.getters.getUserId, date).then(
        (response) => {
          this.visits = response.data;
        }
      );
    },

    formatDateTime(dateTime) {
      const options = {
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        hour12: true,
      };
      return new Date(dateTime).toLocaleString("en-US", options);
    },

    getTotalVisitDurationByUserId() {
      ExerciseService.getTotalVisitDurationByUserId(
        this.$store.getters.getUserId
      ).then((response) => {
        if (response.status === 200) {
          this.totalVisitDuration = response.data;
        }
      });
    },
  },
};
</script>

<style scoped>
.visit-info {
  width: 100%; /* Full width for Visit List when it's below Exercise List */
  box-sizing: border-box;
  padding: 0; /* Remove padding for full width */
  margin-top: 20px; /* Add margin to separate Visit List from Exercise List */
}

.visit-item {
  border: 1px solid #ccc;
  border-radius: 8px;
  margin-bottom: 20px;
  padding: 15px;
  background-color: #fff;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.visit-item:hover {
  transform: scale(1.02);
}

.visit-id {
  font-size: 18px;
  font-weight: bold;
  color: #333;
}

.visit-check-in,
.visit-check-out,
.visit-duration {
  display: block;
  margin-top: 8px;
  font-size: 14px;
  color: #555;
}

.button {
  font-family: 'Exo 2', sans-serif;
  border: none;
  border-radius: 4px;
  padding: 8px 16px;
  margin: 8px;
  cursor: pointer;
  background-color: #3498db;
  color: #fff;
  font-size: 14px;
}

.search-options {
  margin-bottom: 20px;
}

h2 {
  color: #333;
}
</style>