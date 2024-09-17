<template>
  <div>
    <h2 class="municipal-heating-network-title">Gminna Sieć Ciepłownicza</h2>
    <v-radio-group v-model="isInterested" required aria-required="true" label="Czy jesteś zainteresowany podłączeniem się do gminnej sieci ciepłowniczej?">
      <v-radio label="Tak" value="tak"></v-radio>
      <v-radio label="Nie" value="nie"></v-radio>
      <v-radio label="Nie wiem" value="nieWiem"></v-radio>
    </v-radio-group>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, defineEmits, watch } from "vue";
import { yearRules } from "../constants/validationRulesMunicipalHeatingNetwork";

const emit = defineEmits(["updateMunicipalHeatingInfo"]);

const isInterested = ref<any>(undefined);

watch([isInterested], () => {
  emit("updateMunicipalHeatingInfo", {
    isInterested: isInterested.value === "tak" ? true : (isInterested.value === "nie" ? false : null),
  });
  console.log("isInterested.value", isInterested.value);
});
</script>

<style scoped>
.municipal-heating-network-title {
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
