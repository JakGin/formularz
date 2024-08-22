<script setup lang="ts">
import PersonalInfo from "./components/PersonalInfo.vue";
import HeatingSourceForm from "./components/HeatingSourceForm.vue";
import MunicipalHeatingNetwork from "./components/MunicipalHeatingNetwork.vue";
</script>

<template>
  <header>
    <div></div>
  </header>

  <main>
    <PersonalInfo />
    <HeatingSourceForm />
    <MunicipalHeatingNetwork />
  </main>
</template>

<style scoped></style>
