<template>
  <div>
    <h1>My Visit History</h1>
    <Bar ref="chart" :data="chartData" :key="chartKey" />
    <div class="button-container">
      <button @click="viewBy('days')">Lifetime</button>
      <button @click="viewBy('weeks')">Past Week</button>
      <button @click="viewBy('months')">Month Average</button>
      <button @click="updateUserGoal">Set Goal</button>
    </div>
  </div>
</template>

<script>
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, PointElement, LineElement } from 'chart.js';
import CheckInOutService from '../services/CheckInOutService';
import { reactive } from 'vue';
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, PointElement, LineElement);
import ProfileService from '../services/ProfileService';
export default {
  name: 'BarChart',
  components: { Bar },
  data() {
    return {
      userId: '',
      userGoal: 0,
      userGoalsByViewMode: reactive ({
        days: 0,
        weeks: 0,
        months: 0,
      }),
      chartData: reactive ({
        labels: [],
        datasets: [
          {
            label: 'Minutes',
            backgroundColor: '#3498db',
            data: [],
          },
        ],
      }),
      chartKey: 0,
      viewMode: 'days',

    };
  },
  computed: {
    getUserId() {
      return this.$store.getters.getUserId;
    },
  },
  methods: {
    async fetchData() {
      try {
        this.userId = this.getUserId;
        const response = await CheckInOutService.getVisitsByUserId(this.userId);
        const visits = response.data;

        if (Array.isArray(visits)) {
          if (this.viewMode === 'days') {
            const visitsByDay = visits.reduce((result, visit) => {
              const formattedDate = formatDate(visit.checkInTime);
              if (!result[formattedDate]) {
                result[formattedDate] = { totalDuration: 0, visitCount: 0 };
              }
              result[formattedDate].totalDuration += visit.duration;
              result[formattedDate].visitCount += 1;
              return result;
            }, {});

            const averageDurations = Object.keys(visitsByDay).map((date) => {
              const averageDuration =
                visitsByDay[date].totalDuration / visitsByDay[date].visitCount;
              return averageDuration.toFixed(2);
            });

            this.chartData.labels = Object.keys(visitsByDay).map((date) => formatYearMonthDay(date));
            this.chartData.datasets[0].data = averageDurations;
            this.chartKey += 1;
          } else if (this.viewMode === 'weeks') {
            const pastWeekDays = Array.from({ length: 7 }, (_, index) => {
              const day = new Date();
              day.setDate(day.getDate() - index);
              return day.toISOString().split('T')[0];
            }).reverse();

            const visitsByDay = visits.reduce((result, visit) => {
              const formattedDate = formatDate(visit.checkInTime);
              if (!result[formattedDate]) {
                result[formattedDate] = { totalDuration: 0, visitCount: 0 };
              }
              result[formattedDate].totalDuration += visit.duration;
              result[formattedDate].visitCount += 1;
              return result;
            }, {});

            const averageDurations = pastWeekDays.map((date) => {
              const formattedDate = formatDate(date);
              const averageDuration = visitsByDay[formattedDate]
                ? visitsByDay[formattedDate].totalDuration / visitsByDay[formattedDate].visitCount
                : 0;
              return averageDuration.toFixed(2);
            });

            this.chartData.labels = pastWeekDays.map((date) => formatMonthDay(date));
            this.chartData.datasets[0].data = averageDurations;
            this.chartKey += 1;
          } else if (this.viewMode === 'months') {
            const visitsByMonth = visits.reduce((result, visit) => {
              const formattedMonth = formatYearMonth(visit.checkInTime);
              if (!result[formattedMonth]) {
                result[formattedMonth] = { totalDuration: 0, visitCount: 0 };
              }
              result[formattedMonth].totalDuration += visit.duration;
              result[formattedMonth].visitCount += 1;
              return result;
            }, {});

            const averageDurations = Object.keys(visitsByMonth).map((month) => {
              const averageDuration =
                visitsByMonth[month].totalDuration / visitsByMonth[month].visitCount;
              return averageDuration.toFixed(2);
            });

            this.chartData.labels = Object.keys(visitsByMonth).map((month) => formatYearMonth(month));
            this.chartData.datasets[0].data = averageDurations;
            this.chartKey += 1;
          }
        } else {
          console.error('Received data is not an array:', visits);
        }
      } catch (error) {
        console.error('Error fetching visits:', error);
      }
    },

    viewBy(mode) {
      this.viewMode = mode;
      this.fetchData();
    },
    async updateUserGoal() {
      const userGoal = prompt('Enter your goal in minutes:');
      const parsedUserGoal = parseInt(userGoal) || 0;
      try {
        // Call the ProfileService method with the user's goal
        await ProfileService.updateVisitDurationGoalByUserId(parsedUserGoal, this.userId);

      this.userGoal = parsedUserGoal;
      this.userGoalsByViewMode[this.viewMode] = parsedUserGoal;

      if (this.$refs.chart && this.$refs.chart.chart) {
        const chart = this.$refs.chart.chart;

        // Ensure chart.options is defined
        if (!chart.options) {
          chart.options = {};
        }


        if (!chart.options.scales) {
          chart.options.scales = {};
        }


        if (!chart.options.scales.yAxes) {
          chart.options.scales.yAxes = [{ ticks: {} }];
        }


        chart.options.scales.yAxes[0].ticks.min = Math.min(...chart.data.datasets[0].data, this.userGoal);
        chart.options.scales.yAxes[0].ticks.max = Math.max(...chart.data.datasets[0].data, this.userGoal + 1000);

        // Log the updated y-axis range
        console.log(
          'Updated y-axis range:',
          chart.options.scales.yAxes[0].ticks.min,
          '-',
          chart.options.scales.yAxes[0].ticks.max
        );

        // Update the chart
        chart.update();
        this.drawGoalLine();
      }
    } catch (error) {
        console.error('Error updating user goal:', error);
        // Handle the error as needed
      }
    },
    drawGoalLine() {
  const chart = this.$refs.chart.chart;

  // Remove existing goal line datasets
  chart.data.datasets = chart.data.datasets.filter(
    (dataset) => !dataset.label.startsWith('Goal:')
  );

  const goalLineDataset = {
    label: `Goal: ${this.userGoalsByViewMode[this.viewMode]} Minutes`,
    borderColor: '#e74c3c',
    borderWidth: 4,
    pointRadius: 0,
    data: chart.data.labels.map(() => this.userGoalsByViewMode[this.viewMode]),
    fill: false,
    type: 'line',
    order: 3,
    z: 10,
  };

  chart.data.datasets.push(goalLineDataset);

  // Reassign the datasets property to trigger reactivity
  this.chartData.datasets = [...chart.data.datasets];

  chart.update();
}


  },
  async mounted() {
    console.log('Mounted hook is called');

    await this.fetchData();

    if (this.$refs.chart && this.$refs.chart.chart) {
      const chart = this.$refs.chart.chart;

      if (chart.data.datasets.length > 0 && chart.data.datasets[0].data) {
        // Set the min and max values for the left y-axis
        chart.options.scales.yAxes[0].ticks.min = 0;
        chart.options.scales.yAxes[0].ticks.max = Math.max(
          ...chart.data.datasets[0].data,
          this.userGoal + 1000
        );

        // Log the initial y-axis range
        console.log(
          'Initial y-axis range:',
          chart.options.scales.yAxes[0].ticks.min,
          '-',
          chart.options.scales.yAxes[0].ticks.max
        );

        // Update the chart
        chart.update();

        this.drawGoalLine();
      } else {
        console.error('Chart dataset or dataset data is undefined or empty.');
      }
    } else {
      console.error('Chart or chart.chart is undefined.');
    }
  }

};

function formatDate(dateString) {
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function formatYearMonthDay(dateString) {
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function formatMonthDay(dateString) {
  const options = { month: 'short', day: 'numeric' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function formatYearMonth(dateString) {
  const options = { year: 'numeric', month: 'long' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

</script>

<style scoped>
div {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.button-container {
  font-family: 'Exo 2', sans-serif;
  margin-top: 20px;
  display: flex;
  flex-direction: row;
}

button {
  font-family: 'Exo 2', sans-serif;
  margin: 5px;
  padding: 10px;
  font-size: 16px;
  background-color: #6ad5e5;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #2980b9;
}
</style>