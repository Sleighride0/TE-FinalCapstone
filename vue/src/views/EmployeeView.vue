<template>
  <div class = "body">
  <div class="utilContainer">
    <employee-user-util/>
    <equipment-search-util/>
  </div>
</div>
</template>

<script>
import EmployeeUserUtil from '../components/EmployeeUserUtil.vue';
import EquipmentSearchUtil from '../components/EquipmentSearchUtil.vue';

export default {
  data() {
    return {};
  },
  components: {
    EmployeeUserUtil,
    EquipmentSearchUtil
  }
};
</script>

<style scoped>
.utilContainer {
  font-family: 'Exo 2', sans-serif;
  display: grid;
  grid-template-rows: auto auto; /* Adjusted grid-template-rows */
  grid-row-gap: 20px; /* Changed to grid-row-gap for better spacing */
}

.body {
  font-family: 'Exo 2', sans-serif;
}
</style>