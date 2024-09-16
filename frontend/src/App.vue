<script setup lang="ts">
import { ref, toRaw } from "vue";
import PersonalInfo from "./components/PersonalInfo.vue";
import HeatingSourceForm from "./components/HeatingSourceForm.vue";
import HotWaterHeatingSourceForm from "./components/HotWaterHeatingSourceForm.vue";
import MunicipalHeatingNetwork from "./components/MunicipalHeatingNetwork.vue";
import { API_BASE_URL } from "./constants/url";

const dialog = ref(false);
const wasFilledInThePast = ref(false);

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

const errorMessage = ref("");

const updateHeatingInfo = (data: any) => {
  formData.value.heatingSource = data.selectedItem;
  formData.value.heatingSourcePower = data.installationPower;
  formData.value.heatingSourceHasGrant = data.hasFunding;
  formData.value.heatingSourceGrantYear = data.fundingYear;
  console.log(formData.value);
};

const updateHotWaterHeatingInfo = (data: any) => {
  formData.value.waterHeatingSource = data.selectedItem;
  formData.value.waterHeatingSourcePower = data.installationPower;
  formData.value.waterHeatingSourceHasGrant = data.hasFunding;
  formData.value.waterHeatingSourceGrantYear = data.fundingYear;
  console.log(formData.value);
};

const updateMinicipalHeatingInfo = (data: any) => {
  formData.value.isInterested = data.isInterested;
  formData.value.isInterestedInYear = data.isInterestedInYear;
  console.log(formData.value);
};

const handleSubmit = async (overwrite = false) => {
  console.log(JSON.stringify(formData.value, null, 2));

  if (
    formData.value.name === "" ||
    formData.value.lastname === "" ||
    formData.value.email === "" ||
    formData.value.solectwo === "" ||
    formData.value.homeNumber === "" ||
    formData.value.heatingSource === "" ||
    formData.value.waterHeatingSource === "" ||
    formData.value.waterHeatingSourcePower === 0.0 ||
    (formData.value.heatingSourceHasGrant &&
      formData.value.heatingSourceGrantYear === 0) ||
    (formData.value.waterHeatingSourceHasGrant &&
      formData.value.waterHeatingSourceGrantYear === 0)
  ) {
    alert("Wypełnij wszystkie wymagane pola");
    return;
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
    const url = `${API_BASE_URL}/form`;
    const method = overwrite ? "PUT" : "POST";
    const response = await fetch(url, {
      method,
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(dataToSend),
    });

    if (!response.ok) {
      if (response.status === 400) {
        const responseData = await response.json();
        errorMessage.value = responseData.error;
        console.log("Dane już istnieją na serwerze: \n", responseData.error);
        wasFilledInThePast.value = true;
      } else {
        throw new Error(`Błąd serwera: ${response.status}`);
      }
    } else {
      dialog.value = false;
      alert("Dziękujemy za wypełnienie formularza.");
      wasFilledInThePast.value = false;
    }
  } catch (error) {
    console.error("Błąd podczas wysyłania danych: ", error);
    alert(
      "Wystąpił błąd podczas wysyłania formularza. Spróbuj ponownie później."
    );
  } finally {
    errorMessage.value = "";
  }
};

const submitForm = (wasfilled: boolean) => {
  wasFilledInThePast.value = wasfilled;
  handleSubmit(wasFilledInThePast.value);
};

const submitUpdate = (wasfilled: boolean) => {
  wasFilledInThePast.value = wasfilled;
  handleSubmit(wasFilledInThePast.value);
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

    <div v-if="errorMessage">
      <p style="color: red; margin-bottom: 16px">{{ errorMessage }}</p>
    </div>
    <div class="form-buttons">
      <v-btn
        class="me-4 personal-info-form-button"
        text="Prześlij"
        @click="dialog = true"
        color="indigo-darken-3"
        size="x-large"
        variant="flat"
      />
    </div>

    <div class="text-center pa-4">
      <v-dialog v-model="dialog" max-width="500" persistent>
        <v-card
          v-if="wasFilledInThePast"
          prepend-icon="mdi-pencil"
          title="Czy chcesz przesłać formularz ponownie?"
          text="Dane już istnieją na serwerze. Czy chcesz je nadpisać?"
        >
          <template v-slot:actions>
            <v-spacer></v-spacer>

            <v-btn @click="dialog = false">
              Nie przesyłaj ponownie
            </v-btn>

            <v-btn @click="submitUpdate(wasFilledInThePast)">
              Zaktualizuj dane
            </v-btn>
          </template>
        </v-card>
        <v-card v-else>
          <v-card-title>Prześlij Formularz</v-card-title>
          <v-card-text>
            Czy na pewno chcesz przesłać formularz?
          </v-card-text>
          <v-card-actions>
            <v-btn @click="dialog = false">Anuluj</v-btn>
            <v-btn @click="submitForm(wasFilledInThePast)">Tak, Prześlij</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
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
