<template>
  <div class="container">
    <form ref="form" @submit.prevent="sendEmail">
      <label>Name</label>
      <input type="text" v-model="userName" name="name" placeholder="Your name">
      <label>Email</label>
      <input type="email" v-model="userEmail" name="email" placeholder="example@email.com">
      <label>Message</label>
      <textarea v-model="message" name="message" placeholder="Enter your message here.."></textarea>
      <input type="submit" value="Send">
    </form>
  </div>
</template>

<script>
import emailjs from '@emailjs/browser';

export default {
  data() {
    return {
      userName: '',
      userEmail: '',
      message: ''
    };
  },
  methods: {
    sendEmail() {
      emailjs.sendForm('flex_box', 'contact_form', this.$refs.form, 'p_Etm8zKIbI0uOYan')
        .then((result) => {
          console.log('SUCCESS!', result.text);
          this.resetForm();
        })
        .catch((error) => {
          console.log('FAILED...', error.text);
        });
    },
    resetForm() {
      this.userName = '';
      this.userEmail = '';
      this.message = '';
      this.$refs.form.reset();
    }
  }
}
</script>

<style scoped>
* {box-sizing: border-box;}

label {
  float: left;
  font-family: 'Exo 2', sans-serif;
}

input[type=text], [type=email], textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
  font-family: 'Exo 2', sans-serif;
}

input[type=submit] {
  background-color: #3498db;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-family: 'Exo 2', sans-serif;
}

input[type=submit]:hover {
  background-color: #b8c7b9;
}

.container {
  display: block;
  margin: auto;
  text-align: center;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width: 50%;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}
</style>