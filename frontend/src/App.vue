<script setup lang="ts">
import { ref, toRaw } from "vue";
import PersonalInfo from "./components/PersonalInfo.vue";
import HeatingSourceForm from "./components/HeatingSourceForm.vue";
import HotWaterHeatingSourceForm from "./components/HotWaterHeatingSourceForm.vue";
import MunicipalHeatingNetwork from "./components/MunicipalHeatingNetwork.vue";

const personalInfo = ref({});
const heatingInfo = ref({});
const hotWaterHeatingInfo = ref({});

const formData = ref({
  eagerToJoin: null,
  yearToJoin: null,
});

// Update methods to receive data from child components
const updatePersonalInfo = (data: any) => {
  personalInfo.value = data;
};

const updateHeatingInfo = (data: any) => {
  heatingInfo.value = data;
};

const updateHotWaterHeatingInfo = (data: any) => {
  console.log(data);
  hotWaterHeatingInfo.value = data;
};

// Handle form submission
const handleSubmit = () => {
  const combinedData = {
    personalInfo: toRaw(personalInfo.value),
    heating: heatingInfo.value,
    hotWaterHeating: toRaw(hotWaterHeatingInfo.value),
  };

  // Simulate sending the data to the server
  console.log("Submitting data:", combinedData);
  console.log(JSON.stringify(formData.value, null, 2));

  // Reset forms after submission
  clearAllForms();

  alert("Dziękujemy za wypełnienie formularza");
};

// Clear all forms
const clearAllForms = () => {
  personalInfo.value = {};
  heatingInfo.value = {};
  hotWaterHeatingInfo.value = {};
};
</script>

<template>
  <div class="app">
    <header>
      <h1 class="app-header-title">Ogrzewanie</h1>
    </header>
    <main class="app-main-parts">
      <PersonalInfo />
      <HeatingSourceForm @updateHeatingInfo="updateHeatingInfo" />
      <HotWaterHeatingSourceForm
        @updateHotWaterHeatingInfo="updateHotWaterHeatingInfo"
      />
      <MunicipalHeatingNetwork v-model:formData="formData"/>
    </main>
    <div class="form-buttons">
      <v-btn class="me-4 personal-info-form-button" @click="handleSubmit">
        Prześlij
      </v-btn>

      <v-btn class="personal-info-form-button" @click="clearAllForms">
        Wyczyść formularz
      </v-btn>
    </div>
  </div>
</template>

<style scoped>
.app {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.app-header-title {
  text-align: center;
  font-weight: bold;
  margin: 40px 0 20px;
}
.app-main-parts {
  margin: 40px;
  max-width: 900px;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;

  gap: 20px;
}
</style>
