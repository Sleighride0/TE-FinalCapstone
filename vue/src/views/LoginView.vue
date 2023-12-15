<template>
  <body>
  <div class="main">
    <div id="login">
      <form v-on:submit.prevent="login">
        <h1>Welcome to FlexBox! Please Sign In</h1>
        <img src="../assets/Flex_Box_Logo copy.png" id="logo"/>
        <div role="alert" id="invalid" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div role="alert" v-if="this.$route.query.registration">
          Thank you for registering, please sign in.
        </div>
        <div class="form-input-group">
          <label for="username">Username: </label>
          <input type="text" id="username" class="input-box" v-model="user.username" required autofocus />
        </div>
        <div class="form-input-group">
          <label for="password">Password: </label>
          <input type="password" id="password" class="input-box" v-model="user.password" required />
        </div>
        <button type="submit" id="sign-in-btn">Sign in!</button>
        <p>
          <router-link id="sign-up" v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link>
        </p>
      </form>
    </div>
  </div>
</body>
</template>

<script>
import authService from "../services/AuthService";

export default {

  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false,
      showLogIn: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            const userId = response.data.user.id;
            this.$store.commit("SET_USER_ID", userId);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
    toggleLogin() {
      this.showLogIn = !this.showLogIn;
    }
  }
};
</script>

<style scoped>
body{
  align-items: center;
  background-image: url(../assets/images/gym-wallpaper.jpg);
  background-repeat:no-repeat;
  background-size:contain;
  width:99%;
  height:1080px;
  color: black;
}

#logo{
  height: 200px;
  width:auto;
  margin-left:175px;
}

.main{
  width:99%;
  height:1080px;
}
.form-input-group {
  text-align:center;
  margin-bottom: 1rem;
}

.input-box{
  border-style:solid;
  border-width:2px;
  border-radius:5px;
}

#sign-in-btn{
  margin-left:290px;
  font-family: 'Exo 2', sans-serif;
    padding: 10px;
    font-size: 16px;
    background-color: #4caf50;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

#sign-up{
  margin-left:235px;
}

label {
  margin-right: 0.5rem;
}

#login{
  align-content:center;
  margin-left:30%;
  margin-right:30%;
  font-family: 'Exo 2', sans-serif;
  border-style:solid;
  border-radius:8px;
  border-width:1px;
  background-color: rgba(237, 237, 237, 0.75);
  background-blend-mode: lighten;
  grid-area:login;
}

h1{
  text-align: center;
} 

#invalid{
  text-align: center;
  margin-bottom: 2%;
}

</style>