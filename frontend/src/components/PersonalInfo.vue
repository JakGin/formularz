// PersonalInfo.vue
<template>
  <div>
    <h3>Sołectwa</h3>
            <!-- <pre>{{ loadingSolectwa }}</pre> -->
            <!-- <pre>Length: {{ solectwa.length }}</pre>
            <pre>{{ solectwa.slice(0, 3) }}</pre> -->
    <h2 class="personal-info-title">Wprowadź swoje dane</h2>
    <form @submit.prevent class="personal-info-form">
      <v-text-field
        v-model="localFormData.name"
        required
        :rules="inputRules"
        clearable
        label="Imię"
      />
      <v-text-field
        v-model="localFormData.lastname"
        required
        :rules="inputRules"
        clearable
        label="Nazwisko"
      />
      <v-text-field
        v-model="localFormData.email"
        required
        :rules="inputRules"
        clearable
        label="E-mail"
      />
      <v-select
        v-model="localFormData.solectwo"
        :items="solectwaNames"
        required
        clearable
        label="Sołectwo"
      />
      <v-text-field v-model="localFormData.street" clearable label="Ulica" />
      <v-text-field
        v-model="localFormData.homeNumber"
        required
        :rules="inputRules"
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

// Props to accept form data and emit changes
const props = defineProps({
  formData: {
    type: Object as PropType<{
      name: string;
      lastname: string;
      email: string;
      solectwo: string | null;
      street: string;
      homeNumber: string;
    }>,
    required: true,
  },
});

const emit = defineEmits(["update:formData"]);

// Create a local copy of formData to bind to form fields
const localFormData = ref({ ...props.formData });

watch(localFormData, (newVal) => {
  emit("update:formData", newVal);
}, { deep: true });

const inputRules = computed(() => [
  (value: string) => !!value || "To pole jest wymagane.",
]);


const { solectwa, loading: loadingSolectwa } = useSolectwa();
// Computed property to transform solectwa into an array of strings
const solectwaNames = computed(() => solectwa.value.map((solectwo) => solectwo.name));
console.log(solectwaNames);

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
