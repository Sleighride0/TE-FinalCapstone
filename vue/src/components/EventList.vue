<template>
    <div class="upcoming-events">
        <h2>Upcoming Events</h2>
        <ul>
            <li v-for="event in upcomingEvents" :key="event.id">
                <h3>{{ event.eventName }}</h3>
                <p>{{ event.description }}</p>
                <p>Date: {{ formatDate(event.date) }}</p>
                <p>Time: {{ formatTime(event.startTime) }} - {{ calculateEndTime(event.startTime, event.eventDuration) }}</p>
            </li>
        </ul>
    </div>
</template>

<script>
import EventService from '../services/EventService'

export default {
    data() {
        return {
            upcomingEvents: [], // Array to store upcoming events
        };
    },
    methods: {
      
        getEvents() {
            this.isLoading = true;
            EventService.getEventList().then(
                (response) => {
                    // Update upcomingEvents with the response data
                    this.upcomingEvents = response.data;
                }
            ).finally(() => {
                this.isLoading = false;
            });
        },
        formatDate(date) {
            const options = { year: 'numeric', month: 'long', day: 'numeric' };
            return new Date(date).toLocaleDateString('en-US', options);
        },
        formatTime(startTime) {
            const [hours, minutes] = startTime.split(':').map(Number);
            const period = hours >= 12 ? 'PM' : 'AM';
            const formattedHours = hours % 12 || 12; // Convert to 12-hour format

            return `${formattedHours}:${String(minutes).padStart(2, '0')} ${period}`;
        },
        // Calculate end time based on start time and duration
        calculateEndTime(startTime, duration) {
            if (!startTime || isNaN(duration)) {
                return ''; // Return an empty string or a default value if the input is not valid
            }

            // Trim startTime to exclude seconds
            const trimmedStartTime = startTime.split(':').slice(0, 2).join(':');

            const [hours, minutes] = trimmedStartTime.split(':').map(Number);

            // Calculate the total duration in minutes
            const totalMinutes = hours * 60 + minutes + duration;

            // Calculate the end time in hours and minutes
            const endHours = Math.floor(totalMinutes / 60) % 12 || 12; // Convert to 12-hour format
            const endMinutes = totalMinutes % 60;
            const period = Math.floor(totalMinutes / 60) < 12 ? 'AM' : 'PM';

            // Format the end time as HH:MM with leading zeros
            return `${String(endHours).padStart(2, '0')}:${String(endMinutes).padStart(2, '0')} ${period}`;
        }
    },
    mounted() {
        // Fetch upcoming events from the database using the getevents method
        this.getEvents();
    }
};
</script>

<style scoped>


.upcoming-events ul {
    list-style-type: none;
    padding: 0;
}

.upcoming-events li {
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
    /* Example border for separation */
}
</style>
