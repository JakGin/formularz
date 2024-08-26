<script setup lang="ts">
import { ref } from "vue";
import PersonalInfo from "./components/PersonalInfo.vue";
import HeatingSourceForm from "./components/HeatingSourceForm.vue";
import HotWaterHeatingSourceForm from "./components/HotWaterHeatingSourceForm.vue";
import MunicipalHeatingNetwork from "./components/MunicipalHeatingNetwork.vue";

const formData = ref({
  name: "",
  lastname: "",
  email: "",
  solectwo: null,
  street: "",
  homeNumber: "",
  eagerToJoin: null,
  yearToJoin: null,
});

const handleSubmit = () => {
  console.log(JSON.stringify(formData.value, null, 2));

  if (
    formData.value.name === "" ||
    formData.value.lastname === "" ||
    formData.value.email === "" ||
    formData.value.solectwo === "" ||
    formData.value.homeNumber === "" ||
    (formData.value.eagerToJoin && !formData.value.yearToJoin)
  ) {
    alert("Wypełnij wszystkie wymagane pola");
  } else {
    alert("Dziękujemy za wypełnienie formularza");
    formData.value = {
      name: "",
      lastname: "",
      email: "",
      solectwo: null,
      street: "",
      homeNumber: "",
      eagerToJoin: null,
      yearToJoin: null,
    };
  }
};
</script>

<template>
  <div class="app">
    <header>
      <h1 class="app-header-title">Ogrzewanie</h1>
    </header>
    <main class="app-main-parts">
      <PersonalInfo v-model:formData="formData"/>
      <HeatingSourceForm />
      <HotWaterHeatingSourceForm />
      <MunicipalHeatingNetwork />

      <div>
        <v-btn
        class="me-4"
        type="submit"
        text="Prześlij"
        @click="handleSubmit"
        />
      </div>
    </main>
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
