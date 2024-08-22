<template>
    <div class="personal-info">
        <div class="personal-info-title">
            Wprowadź swoje dane
        </div>
        <form @submit.prevent="HandleSubmit">
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
            
            <v-text-field
            v-model="street"
            clearable
            label="Ulica"
            />
            
            <v-text-field
            v-model="homeNumber"
            required
            :rules="inputRules"
            clearable
            label="Numer domu"
            />
            
            <v-btn
            class="me-4 personal-info-form-button"
            type="submit"
            text="Prześlij"
            />
            
            <v-btn 
            class="personal-info-form-button"
            @click="clearForm"
            text="Wyczyść formularz"
            />
        </form>
    </div>
</template>
  
  
<script setup lang="ts">
import {ref} from 'vue';

const name = ref('')
const lastname = ref('')
const email = ref('')
const solectwo = ref(null)
const street = ref('')
const homeNumber = ref('')
const items = [
    'Sołectwo 1',
    'Sołectwo 2',
    'Sołectwo 3',
    'Sołectwo 4',
]

const inputRules = [
    (value: string) => {
        if (!!value) return true
        return 'To pole jest wymagane.'
    },
]

const clearForm = () => {
    solectwo.value = null
    street.value = ''
    homeNumber.value = ''
    name.value = ''
    lastname.value = ''
    email.value = ''
}

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
    
    if (submitData.solectwo === '' || submitData.street === '' || submitData.homeNumber === '' || submitData.name === '' || submitData.lastname === '' || submitData.email === '') {
        alert("Wypełnij wszystkie pola")
    }
    else {
        alert("Dziękujemy za wypełnienie formularza")
        clearForm()
    }
}
</script>

<style scoped>
.personal-info {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
    gap: 20px;
}

.personal-info-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

.personal-info-form-button {
    margin-top: 40px;
}
</style>
