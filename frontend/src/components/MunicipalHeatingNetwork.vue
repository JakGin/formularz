<template>
  <div>
    <h2 class="municipal-heating-network-title">Gminna Sieć Ciepłownicza</h2>
    <v-checkbox
      v-model="isInterested"
      label="Czy jesteś zainteresowany podłączeniem się do gminnej sieci ciepłowniczej?"
    />
    <v-text-field
      v-if="isInterested"
      v-model="isInterestedInYear"
      :rules="yearRules"
      label="Rok planowanego dołączenia"
      required
    />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, defineEmits, watch } from "vue";

const emit = defineEmits(["updateMunicipalHeatingInfo"]);

const isInterested = ref<boolean>(false);
const isInterestedInYear = ref<number | null>(null);

// const emitUpdate = () => {
//   emit("updateMunicipalHeatingInfo", {
//     isInterested: isInterested.value,
//     isInterestedInYear: isInterestedInYear.value,
//   });
// };

watch([isInterested, isInterestedInYear], () => {
  emit("updateMunicipalHeatingInfo", {
    isInterested: isInterested.value,
    isInterestedInYear: isInterestedInYear.value,
  });
});

const yearRules = computed(() => [
  (value: string) => !!value || "To pole jest wymagane.",
  (value: string) =>
    (value && value.length === 4) || "Rok musi składać się z 4 cyfr.",
  (value: string) =>
    (value && !isNaN(Number(value))) || "Rok musi składać się z cyfr.",
]);
</script>

<style scoped>
.municipal-heating-network-title {
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
