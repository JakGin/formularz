<template>
    <form @submit.prevent="HandleSubmit">
        <v-text-field
        v-model="name"
        required
        :rules="inputRules"
        label="Imię"
        ></v-text-field>

        <v-text-field
        v-model="lastname"
        required
        :rules="inputRules"
        label="Nazwisko"
        ></v-text-field>

        <v-text-field
        v-model="email"
        required
        :rules="inputRules"
        label="E-mail"
        ></v-text-field>

        <v-text-field
        v-model="solectwo"
        required
        :rules="inputRules"
        label="Sołectwo"
        ></v-text-field>

        <v-text-field
        v-model="street"
        required
        :rules="inputRules"
        label="Ulica"
        ></v-text-field>

        <v-text-field
        v-model="homeNumber"
        required
        :rules="inputRules"
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

const inputRules = [
    (value: string) => {
        if (!!value) return true
        return 'To pole jest wymagane.'
    },
]

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
