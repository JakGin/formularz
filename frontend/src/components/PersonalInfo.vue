<template>
  <div>
    <h2 class="personal-info-title">Wprowadź swoje dane</h2>
    <form @submit.prevent="HandleSubmit" class="personal-info-form">
      <v-text-field
      v-model="name"
      required
      :rules="inputRules"
      clearable
      label="Imię"
      />

      <v-text-field
      v-model="lastname"
      required
      :rules="inputRules"
      clearable
      label="Nazwisko"
      />

      <v-text-field
      v-model="email"
      required
      :rules="inputRules"
      clearable
      label="E-mail"
      />
      
      <v-select
      v-model="solectwo"
      :items="items"
      required
      :rules="inputRules"
      clearable
      label="Sołectwo"
      ></v-select>

      <v-text-field v-model="street" clearable label="Ulica" />

      <v-text-field
      v-model="homeNumber"
      required
      :rules="inputRules"
      clearable
      label="Numer domu"
      />
      
      <div class="personal-info-form-button">
        <v-btn
        class="personal-info-form-single-button"
        @click="clearForm"
        text="Wyczyść formularz"
        />
        
        <v-btn
        class="me-4 personal-info-form-single-button"
        type="submit"
        text="Prześlij"
        />
      </div>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";

const name = ref("");
const lastname = ref("");
const email = ref("");
const solectwo = ref(null);
const street = ref("");
const homeNumber = ref("");
const items = ["Sołectwo 1", "Sołectwo 2", "Sołectwo 3", "Sołectwo 4"];

const inputRules = [
  (value: string) => {
    if (!!value) return true;
    return "To pole jest wymagane.";
  },
];

const clearForm = () => {
  solectwo.value = null;
  street.value = "";
  homeNumber.value = "";
  name.value = "";
  lastname.value = "";
  email.value = "";
};

const HandleSubmit = () => {
  const submitData = {
    solectwo: solectwo.value,
    street: street.value,
    homeNumber: homeNumber.value,
    name: name.value,
    lastname: lastname.value,
    email: email.value,
  };
  console.log(JSON.stringify(submitData, null, 2));

  if (
    submitData.solectwo === "" ||
    submitData.street === "" ||
    submitData.homeNumber === "" ||
    submitData.name === "" ||
    submitData.lastname === "" ||
    submitData.email === ""
  ) {
    alert("Wypełnij wszystkie pola");
  } else {
    alert("Dziękujemy za wypełnienie formularza");
    clearForm();
  }
};
</script>

<style scoped>

.personal-info-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 30px;
}
.personal-info-form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin-top: 20px;
  gap: 15px;
}

.personal-info-form-single-button {
  width: 300px;
}

.personal-info-form-button {
  margin-top: 30px;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
}
</style>
