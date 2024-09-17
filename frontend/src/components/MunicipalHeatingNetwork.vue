<template>
  <div>
    <h2 class="municipal-heating-network-title">Gminna Sieć Ciepłownicza</h2>
    <v-checkbox
      v-model="isInterested"
      label="Czy jesteś zainteresowany podłączeniem się do gminnej sieci ciepłowniczej?"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, defineEmits, watch } from "vue"
import { yearRules } from "../constants/validationRulesMunicipalHeatingNetwork"

const emit = defineEmits(["updateMunicipalHeatingInfo"])

const isInterested = ref<boolean>(false)
const isInterestedInYear = ref<number | null>(null)

watch([isInterested, isInterestedInYear], () => {
  emit("updateMunicipalHeatingInfo", {
    isInterested: isInterested.value,
    isInterestedInYear: isInterestedInYear.value,
  })
})
</script>

<style scoped>
.municipal-heating-network-title {
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
