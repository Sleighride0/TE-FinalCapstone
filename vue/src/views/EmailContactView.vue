<template>
  <div class="contact-page">
    <div class="header">
      <h1 class="main-page-title page-title"> Contact Us</h1>
      <h4> Questions, Comments or Concerns? Reach out to our staff.</h4>
    </div>
    <div class="contact-form">
      <email-contact />
    </div>
  </div>
</template>

<script>
import EmailContact from '../components/EmailContact.vue';

export default {
  data() {
    return {};
  },
  components: {
    EmailContact,
  }
};
</script>

<style scoped>
.contact-page {
  font-family: 'Exo 2', sans-serif;
  text-align: center;
  padding: 20px;
  background-color: #a7d6ef;
  display: grid;
  border-radius:8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  grid-template-columns:1fr 2fr 1fr;
  grid-template-areas:
  ". the-header ."
  ". contact-form ."
}

.header{
  background-color: #ffffffc4;
  padding:10px;
  border-radius:8px;
  margin-bottom:10px;
  grid-area:the-header;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);

}

.contact-form{
  grid-area:contact-form;

}

.page-title {
  font-family: 'Exo 2', sans-serif;
  font-size: 45px;
  margin-bottom: 20px;
}
</style>