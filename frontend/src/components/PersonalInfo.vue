<template>
  <div>
    <h2 class="personal-info-title">Wprowadź swoje dane</h2>
    <form @submit.prevent class="personal-info-form">
      <v-text-field
        v-model="localFormData.name"
        required
        :rules="nameRules"
        clearable
        label="Imię"
      />
      <v-text-field
        v-model="localFormData.lastname"
        required
        :rules="lastnameRules"
        clearable
        label="Nazwisko"
      />
      <v-text-field
        v-model="localFormData.email"
        required
        :rules="emailRules"
        clearable
        label="E-mail"
      />
      <v-select
        v-model="localFormData.solectwo"
        :items="solectwaNames"
        label="Sołectwo"
        clearable
        required
        :rules="solectwoRules"
      />
      <v-select
        v-model="localFormData.street"
        :items="streetNames"
        :loading="loadingStreets"
        label="Ulica"
        clearable
      />
      <v-text-field
        v-model="localFormData.homeNumber"
        required
        :rules="homeNumberRules"
        clearable
        label="Numer domu"
      />
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, computed } from "vue";
import { PropType } from "vue";
import useSolectwa from '../composables/useSolectwa';
import useStreets from '../composables/useStreets';
import { nameRules, lastnameRules, emailRules, homeNumberRules, solectwoRules } from '../constants/validationRulesPersonalInfo';

const props = defineProps({
  formData: {
    type: Object as PropType<{
      name: string;
      lastname: string;
      email: string;
      solectwo: string | null;
      street: string | null;
      homeNumber: string;
    }>,
    required: true,
  },
});

const emit = defineEmits(["update:formData"]);

const localFormData = ref({ ...props.formData });

watch(localFormData, (newVal) => {
  emit("update:formData", newVal);
}, { deep: true });

const { solectwa, loading: loadingSolectwa } = useSolectwa();
const { streets, loading: loadingStreets, fetchStreets } = useStreets(computed(() => localFormData.value.solectwo));

watch(() => localFormData.value.solectwo, (newSolectwo) => {
  if (newSolectwo) {
    fetchStreets(newSolectwo);
  }
});

const solectwaNames = computed(() => solectwa.value.map((solectwo) => solectwo.name));
const streetNames = computed(() => streets.value.map((street) => street.name));

console.log(solectwaNames);
console.log(streetNames);
</script>

<style scoped>
.personal-info-title {
  font-weight: bold;
  margin-bottom: 20px;
}
.personal-info-form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 15px;
}
.personal-info-form-single-button {
  width: 300px;
}
.personal-info-form-button {
  margin-top: 20px;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
}
</style>
