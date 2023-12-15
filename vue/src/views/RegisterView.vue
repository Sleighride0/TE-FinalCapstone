<template>
  <body>
  <div id="register" class="text-center">
    <form v-on:submit.prevent="register">
      <h1>Create Account</h1>
      <img src="../assets/Flex_Box_Logo copy.png" id="logo"/>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" class="input-box" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" class="input-box" v-model="user.password" required />
      </div>
      <div class="password-confirmation">
        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" class="input-box" v-model="user.confirmPassword" required />
      </div>
      <button type="submit" id="create-account-btn">Create Account</button>
      <p><router-link id="login" v-bind:to="{ name: 'login' }">Already have an account? Log in.</router-link></p>
    </form>
  </div>
</body>
</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
.form-input-group {
  text-align:center;
  margin-bottom: 1rem;
}

#logo{
  width:auto;
  height:200px;
  margin-left: 175px;
}

.input-box{
  border-style:solid;
  border-width:2px;
  border-radius:5px;
}

.password-confirmation{
  text-align:center;
  margin-right: 63px;
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}

body{
  background-image: url(../assets/regback.jpg);
  background-repeat: no-repeat;
  background-size: contain;
  align-items: center;
  width: 99%;
  height: 1080px;
}

#register{
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

#create-account-btn{
  margin-left:270px;
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

h1{
  text-align: center;
} 

#login{
  margin-left:210px;
}

</style>
