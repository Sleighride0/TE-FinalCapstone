<template>
  <div class="main">
    <p id="instructions"> Search database for usage metrics by specified month. You can search by either machines that
      measure in repetitions or duration (time used)</p>
    <div id="searchButton">
      <button class="button toggle-btn" v-on:click="toggleEquipmentSearch">
        {{ showEquipmentSearch ? 'Hide Equipment Search' : 'Show Equipment Search' }}
      </button>
    </div>
    <div class="search-form" v-show="showEquipmentSearch">
      <span v-show="showErrorMessage" class="error-message">{{ errorMessage }}</span>
      <div class="input-box">
        <label for="monthSelect">Select Month:</label>
        <select id="monthSelect" v-model="monthNum">
          <option v-for="(month, index) in months" :key="index" :value="index + 1">{{ month }}</option>
        </select>
      </div>
      <span class="employeeInput">
        <button v-on:click="getMostUsedDurationEquipmentByMonth" class="button search-btn">
          Show month's equipment metrics (duration)
        </button>
        <button v-on:click="getMostUsedRepsEquipmentByMonth" class="button search-btn">
          Show month's equipment metrics (repetition)
        </button>
      </span>
      <div class="error-message" v-show="showErrorMessage">{{ errorMessage }}</div>
      <div class="output-chart">
        <Bar :data="chartData" :key="chartKey" v-if="showChart" />
      </div>
    </div>
  </div>
</template>

<script>
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
import ExerciseService from '../services/ExerciseService';
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);
export default {
  name: 'EquipmentUsageChart',
  components: { Bar },
  data() {
    return {
      monthNum: 1, // Default to January
      errorMessage: '',
      showEquipmentSearch: false,
      showErrorMessage: false,
      showChart: false,
      chartData: {
        labels: [],
        datasets: [
          {
            label: 'Total Usage',
            backgroundColor: '#3498DB',
            data: [],
          },
        ],
      },
      chartKey: 0,
      months: [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ],
    };
  },
  computed: {
    getExerciseName() {
      return this.$store.getters.getExerciseName;
    },
  },
  methods: {
    toggleEquipmentSearch() {
      this.showEquipmentSearch = !this.showEquipmentSearch;
      this.resetChart();
    },
    resetChart() {
      this.showChart = false;
      this.chartData.labels = [];
      this.chartData.datasets[0].data = [];
      this.chartKey += 1;
    },
    async fetchData(metricType) {
      try {
        const monthNameToNumber = {
          'January': 1, 'February': 2, 'March': 3, 'April': 4, 'May': 5, 'June': 6,
          'July': 7, 'August': 8, 'September': 9, 'October': 10, 'November': 11, 'December': 12
        };

        // Ensure monthNum is a number
        const selectedMonthName = this.months[this.monthNum - 1];

        // Check if a valid month is selected
        if (!selectedMonthName || !monthNameToNumber[selectedMonthName]) {
      this.showErrorMessage = true;
      this.errorMessage = 'Please select a valid month.';
      return;
    }

    const selectedMonthNumber = monthNameToNumber[selectedMonthName];

    const response =
      metricType === 'duration'
        ? await ExerciseService.getMostUsedDurationEquipmentByMonth(selectedMonthNumber)
        : await ExerciseService.getMostUsedRepsEquipmentByMonth(selectedMonthNumber);

        const visits = response.data;
        const filteredVisits = visits.filter(visit =>
          metricType === 'duration' ? visit.mode === 'duration' : visit.mode === 'reps'
        );

        const metricData = {};
        filteredVisits.forEach(visit => {
          if (!metricData[visit.exerciseName]) {
            metricData[visit.exerciseName] = { total: 0, count: 0 };
          }
          metricData[visit.exerciseName].total += metricType === 'duration' ? visit.duration : visit.reps;
          metricData[visit.exerciseName].count += 1;
        });

        const finalMetricData = Object.keys(metricData).map(equipmentName => {
          const averageMetric = metricData[equipmentName].total / metricData[equipmentName].count;
          return { label: equipmentName, data: averageMetric.toFixed(2) };
        });

        this.chartData.labels = finalMetricData.map(item => item.label);
        this.chartData.datasets[0].data = finalMetricData.map(item => item.data);
        this.showChart = true;
        this.showErrorMessage = false; // Reset error message on success
      } catch (error) {
        console.error('Error fetching equipment metrics:', error);
        this.showErrorMessage = true;
        this.errorMessage = 'Error fetching equipment metrics.';
      }
    },
    getMostUsedDurationEquipmentByMonth() {
      this.resetChart();
      this.fetchData('duration');
    },
    getMostUsedRepsEquipmentByMonth() {
      this.resetChart();
      this.fetchData('reps');
    },
  },
};
</script>


<style scoped>
.main {
  text-align: center;
  margin-top: 20px;
  background-color: #A7D6EF;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
  border-radius: 10px;
  display: flex;
  /* Use flexbox */
  flex-direction: column;
  /* Stack elements vertically */
  align-items: center;
  /* Center items horizontally */
}

#searchButton {
  font-family: 'Exo 2', sans-serif;
  margin-bottom: 20px;
}

.toggle-btn {
  font-family: 'Exo 2', sans-serif;
  background-color: #3498DB;
  color: #fff;
  padding: 12px 24px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

/* Add this style for the white background of the chart */
.output-chart {
  background-color: #fff;
  padding: 30px;
  /* Increase padding */
  border-radius: 15px;
  /* Increase border-radius for a more rounded appearance */
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
  /* Adjust box-shadow */
  margin-top: 30px;
  /* Increase top margin */
  width: 100%;
  /* Increase width on both sides */
  margin: 0 -30px;
  /* Compensate for the added width on both sides */
}

/* Style enhancements for search buttons */
.button.search-btn {
  font-family: 'Exo 2', sans-serif;
  background-color: #3498DB;
  color: #fff;
  padding: 12px 24px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.button.search-btn:hover {
  background-color: #267BB5;
}</style>