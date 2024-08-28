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
  street: null,
  homeNumber: "",
  eagerToJoin: null,
  yearToJoin: null,

  heatingSource: "",
  heatingSourcePower: 0.0,
  heatingSourceHasGrant: false,
  heatingSourceGrantYear: 0,

  waterHeatingSource: "",
  waterHeatingSourcePower: 0.0,
  waterHeatingSourceHasGrant: false,
  waterHeatingSourceGrantYear: 0,

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

const updateMinicipalHeatingInfo = (data: any) => {
  (formData.value.isInterested = data.isInterested),
    (formData.value.isInterestedInYear = data.isInterestedInYear);
  console.log(formData.value);
};

const handleSubmit = async () => {
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
  }
  const dataToSend = {
    name: formData.value.name,
    surname: formData.value.lastname,
    email: formData.value.email,
    solectwo: formData.value.solectwo,
    street: formData.value.street,
    houseNumber: formData.value.homeNumber,
    heatingSource: formData.value.heatingSource,
    heatingSourcePower: parseFloat(formData.value.heatingSourcePower as any),
    heatingSourceHasGrant: formData.value.heatingSourceHasGrant,
    heatingSourceGrantYear: formData.value.heatingSourceGrantYear
      ? parseInt(formData.value.heatingSourceGrantYear as any)
      : null,
    waterHeatingSource: formData.value.waterHeatingSource,
    waterHeatingSourcePower: formData.value.waterHeatingSourcePower
      ? parseFloat(formData.value.waterHeatingSourcePower as any)
      : null,
    waterHeatingSourceHasGrant: formData.value.waterHeatingSourceHasGrant,
    waterHeatingSourceGrantYear: formData.value.waterHeatingSourceGrantYear
      ? parseInt(formData.value.waterHeatingSourceGrantYear as any)
      : null,
    isInterested: formData.value.isInterested,
    interestedInYear: formData.value.isInterestedInYear
      ? parseInt(formData.value.isInterestedInYear as any)
      : null,
  };
  console.log(dataToSend);
  console.log(JSON.stringify(dataToSend));

  try {
    const response = await fetch("http://localhost:3000/form", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(dataToSend),
    });

    if (!response.ok) {
      console.log("Błąd serwera (!response.ok): ", response.status);
      const responseData = await response.json();
      console.log("Odpowiedź serwera (!response.ok): ", responseData);
      return
    }

    alert("Dziękujemy za wypełnienie formularza");
    formData.value = {
      name: "",
      lastname: "",
      email: "",
      solectwo: null,
      street: null,
      homeNumber: "",
      eagerToJoin: null,
      yearToJoin: null,
      heatingSource: "",
      heatingSourcePower: 0.0,
      heatingSourceHasGrant: false,
      heatingSourceGrantYear: 0,
      waterHeatingSource: "",
      waterHeatingSourcePower: 0.0,
      waterHeatingSourceHasGrant: false,
      waterHeatingSourceGrantYear: 0,
      isInterested: false,
      isInterestedInYear: null,
    };
  } catch (error) {
    console.error("Błąd podczas wysyłania danych: ", error);
    alert(
      "Wystąpił błąd podczas wysyłania formularza. Spróbuj ponownie później."
    );
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
      <MunicipalHeatingNetwork
        @updateMunicipalHeatingInfo="updateMinicipalHeatingInfo"
      />
    </main>
    <div class="form-buttons">
      <v-btn
        class="me-4 personal-info-form-button"
        type="submit"
        text="Prześlij"
        @click="handleSubmit"
        color="indigo-darken-3"
        size="x-large"
        variant="flat"
      />
    </div>
  </div>
</template>

<style scoped>
.app {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 70px;
}
.app-header-title {
  text-align: center;
  font-weight: bold;
  font-size: 40px;
  color: rgb(0, 0, 148);
}
.app-main-parts {
  margin: 50px 0 50px 0;
  max-width: 900px;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  gap: 20px;
}
</style>
