<template>
    <div class="visit-info">
        <div class="total-visit-time card">
            <h2>Total Visit Time:</h2>
            <p class="total-time">{{ formatDuration(totalVisitDuration) }}</p>
        </div>
        <div class="average-visit-time card">
            <h2>Average Visit Time</h2>
            <p class="average-time">{{ formatAverageDuration(averageVisitTime) }}</p>
        </div>
    </div>
</template>
  
<script>
import ExerciseService from "../services/ExerciseService";
import CheckInOutService from "../services/CheckInOutService";

export default {
    data() {
        return {
            totalVisitDuration: 0,
            averageVisitTime: 0,
        };
    },

    mounted() {
        this.getTotalVisitDurationByUserId();
        this.getAverageVisitTime();
    },

    methods: {
        getTotalVisitDurationByUserId() {
            ExerciseService.getTotalVisitDurationByUserId(
                this.$store.getters.getUserId
            ).then((response) => {
                if (response.status === 200) {
                    this.totalVisitDuration = response.data;
                }
            });
        },
        formatDuration(minutes) {
            const days = Math.floor(minutes / 1440);
            const hours = Math.floor((minutes % 1440) / 60);
            const remainingMinutes = minutes % 60;

            return `${days}d ${hours}h ${remainingMinutes}m`;
        },
        getAverageVisitTime() {
            CheckInOutService.getAverageVisitDurationByUserId(
                this.$store.getters.getUserId
            ).then((response) => {
                if (response.status === 200) {
                    this.averageVisitTime = response.data;
                }
            });
        },
        formatAverageDuration(minutes) {
            const hours = Math.floor(minutes / 60);
            const remainingMinutes = Math.floor(minutes % 60);

            return `${hours}h ${remainingMinutes}m`;
        },
    },
};
</script>
  
<style scoped>
.visit-info {
    display: flex;
    flex-direction: column; /* Updated to stack items vertically */
    align-items: center; /* Optional: Center items horizontally */
    margin-top:200px;
}

.card {
    width: 400px; /* Set a fixed width for the cards */
    background-color: #3498db;
    color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
    text-align: center;
    transition: transform 0.3s ease;
    margin:20px;
}

.total-visit-time{
margin-bottom:50px;
}

.average-visit-time{
margin-top:50px;
}
.card:hover {
    transform: scale(1.05);
}

.card h2 {
    font-size: 1.5rem;
    margin-bottom: 10px;
}

.card p {
    font-size: 1.2rem;
    margin: 0;
}
</style>
