<template>
    <div id="capstone-app">
        <div id="top-nav">
            <router-link v-if="$store.state.token !== ''" v-bind:to="{ name: 'logout' }"
                class="small-nav-link logout-link">Logout</router-link>
        </div>

        <!-- Main navigation bar -->
        <div id="nav" v-if="$store.state.token">
            <img src="@/assets/Flex_Box_Logo.png" alt="Logo" class="logo" />
            <router-link v-bind:to="{ name: 'home' }" class="nav-link" id="home">Home</router-link>
            <router-link v-bind:to="{ name: 'profile' }" class="nav-link" id="profile">Profile</router-link>
            <router-link v-bind:to="{ name: 'employee' }" class="nav-link" id="employee">Employee Services</router-link>
            <router-link v-bind:to="{ name: 'tutorial' }" class="nav-link" id="equipment">Equipment Tutorials</router-link>
            <router-link v-bind:to="{ name: 'contactForm' }" class="nav-link" id="contact">Contact Form</router-link>
            <router-link v-bind:to="{ name: 'scan' }" class="nav-link" id="qr-code">QR Code Scanner</router-link>
            <router-link v-bind:to="{ name: 'additional' }" class="nav-link" id="additional">Learn More</router-link>

            <check-in-out id="check-in" />

        </div>
        <span class="image-bar" v-if="$store.state.token">
            <random-fitness-image class="random-image" /> <random-fitness-image class="random-image" /> <random-fitness-image class="random-image" /> <random-fitness-image class="random-image" /> <random-fitness-image class="random-image" /> <random-fitness-image class="random-image" />
        </span>
    </div>
</template>

<script>
import CheckInOut from '../components/CheckInOut.vue';
import RandomFitnessImage from '../components/RandomFitnessImage.vue'
export default {
    components: {
        CheckInOut,
        RandomFitnessImage
    }
}
</script>

<style scoped>
#capstone-app {
    font-family: 'Exo 2', sans-serif;
    margin: 20px;
}

#nav {
    background-color: #ffffff;
    color: #000000;
    padding: 10px;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
    grid-column-gap: 5px;
    grid-row-gap: 5px;
    align-items: center;
    grid-template-areas:
        "logo home-nav profile-nav employee-nav equipment-nav contact-nav qr-code-nav additional-nav check-in-nav"
}

.image-bar{
    display:inline-flex;
    width:100%;
    align-content: center;
}

.random-image {
    margin-left:75px;
    margin-right:75px;
}

#home {
    grid-area: home-nav
}

#profile {
    grid-area: profile-nav
}

#employee {
    grid-area: employee-nav
}

#equipment {
    grid-area: equipment-nav
}

#contact {
    grid-area: contact-nav
}

#qr-code {
    grid-area: qr-code-nav
}

#additional {
    grid-area: additional-nav
}

#check-in {
    grid-area: check-in-nav
}

#top-nav {
    background-color: #f0f0f0;
    /* Light grey background */
    color: #ffffff;
    /* White text color */
    padding: 5px;
    text-align: right;
}

.small-nav-link {
    color: #ffffff;
    /* White text color */
    text-decoration: none;
    font-size: 12px;
    /* Adjust the font size as needed */
    margin: 0 10px;
    border-radius: 4px;
    /* Rounded corners */
}



.logo {
    max-height: 170px;
    /* Adjust the max height of the logo as needed */
    margin-right: 20px;
    /* Adjust the margin as needed */
    grid-area: "logo"
}

.nav-link {
    color: #000000;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
    padding: 5px 10px;
    border-radius: 8px;
    cursor: pointer;
}

.nav-link:hover {
    transition: transform 0.3s ease;
    transform: scale(1.08);
}

.logout-link {
    color: #000000;
    border-radius: 8px;
}

.logout-link:hover {
    text-decoration: underline;
    background-color: #4fa3e0;
    color: #ffffff;
}
</style>