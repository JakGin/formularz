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
  name: "",
  lastname: "",
  email: "",
  solectwo: null,
  street: "",
  homeNumber: "",
  eagerToJoin: null,
  yearToJoin: null,

  heatingSource: "",
  heatingSourcePower: 0.0,
  heatingSourceHasGrant: false,
  heatingSourceGrantYear: null,

  waterHeatingSource: "",
  waterHeatingSourcePower: 0.0,
  waterHeatingSourceHasGrant: false,
  waterHeatingSourceGrantYear: null,

  isInterested: false,
  isInterestedInYear: null,
});

const updateHeatingInfo = (data: any) => {
  (formData.value.heatingSource = data.selectedItem),
    (formData.value.heatingSourcePower = data.installationPower),
    (formData.value.heatingSourceHasGrant = data.hasFunding),
    (formData.value.heatingSourceGrantYear = data.fundingYear);
  console.log(formData.value);
};

const updateHotWaterHeatingInfo = (data: any) => {
  (formData.value.waterHeatingSource = data.selectedItem),
    (formData.value.waterHeatingSourcePower = data.installationPower),
    (formData.value.waterHeatingSourceHasGrant = data.hasFunding),
    (formData.value.waterHeatingSourceGrantYear = data.fundingYear);
  console.log(formData.value);
};

const handleIsInterestedChange = (value: boolean) => {
  formData.value.isInterested = value;
};

const handleYearToJoinChange = (value: string) => {
  formData.value.isInterestedInYear = value;
};

const handleSubmit = () => {
  console.log(JSON.stringify(formData.value, null, 2));

  const combinedData = {
    heating: heatingInfo.value,
    hotWaterHeating: toRaw(hotWaterHeatingInfo.value),
  };

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
    console.log("Dane przesylane do servera: ", formData.value);
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

      heatingSource: "",
      heatingSourcePower: 0.0,
      heatingSourceHasGrant: false,
      heatingSourceGrantYear: null,

      waterHeatingSource: "",
      waterHeatingSourcePower: 0.0,
      waterHeatingSourceHasGrant: false,
      waterHeatingSourceGrantYear: null,

      isInterested: false,
      isInterestedInYear: null,
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
      <PersonalInfo v-model:formData="formData" />
      <HeatingSourceForm @updateHeatingInfo="updateHeatingInfo" />
      <HotWaterHeatingSourceForm
        @updateHotWaterHeatingInfo="updateHotWaterHeatingInfo"
      />
      <MunicipalHeatingNetwork v-model:formData="formData" />
    </main>
    <div class="form-buttons">
      <v-btn
        class="me-4 personal-info-form-button"
        type="submit"
        text="Prześlij"
        @click="handleSubmit"
      />
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
