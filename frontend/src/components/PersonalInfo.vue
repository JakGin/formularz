<template>
    <form @submit.prevent="HandleSubmit">
        <v-text-field
        v-model="name"
        label="Imię"
        ></v-text-field>

        <v-text-field
        v-model="lastname"
        label="Nazwisko"
        ></v-text-field>

        <v-text-field
        v-model="email"
        label="E-mail"
        ></v-text-field>

        <v-text-field
        v-model="solectwo"
        label="Sołectwo"
        ></v-text-field>

        <v-text-field
        v-model="street"
        label="Ulica"
        ></v-text-field>

        <v-text-field
        v-model="homeNumber"
        label="Numer domu"
        ></v-text-field>

        <!-- <v-select
        v-model="select.value.value"
        :error-messages="select.errorMessage.value"
        :items="items"
        label="Select"
        ></v-select> -->

        <!-- <v-checkbox
        v-model="checkbox.value.value"
        :error-messages="checkbox.errorMessage.value"
        label="Option"
        type="checkbox"
        value="1"
        ></v-checkbox> -->

        <v-btn
        class="me-4"
        type="submit"
        text="Prześlij"
        />
    </form>
</template>
  
  
<script setup lang="ts">
import {ref} from 'vue';

const solectwo = ref('')
const street = ref('')
const homeNumber = ref('')
const name = ref('')
const lastname = ref('')
const email = ref('')

const HandleSubmit = () => {
    const submitData = {
        solectwo: solectwo.value,
        street: street.value,
        homeNumber: homeNumber.value,
        name: name.value,
        lastname: lastname.value,
        email: email.value,
    }
    console.log(JSON.stringify(submitData, null, 2))
}

</script>

<style scoped></style>
