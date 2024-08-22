<script setup lang="ts">
import PersonalInfo from "./components/PersonalInfo.vue";
import HeatingSourceForm from "./components/HeatingSourceForm.vue";
import HotWaterHeatingSourceForm from "./components/HotWaterHeatingSourceForm.vue";
import MunicipalHeatingNetwork from "./components/MunicipalHeatingNetwork.vue";
</script>

<template>
  <div class="app">
    <header>
      <h1 class="app-header-title">Ogrzewanie</h1>
    </header>
    <main class="app-main-parts">
      <PersonalInfo />
      <HeatingSourceForm />
      <HotWaterHeatingSourceForm />
      <MunicipalHeatingNetwork />
    </main>
  </div>
</template>

<style scoped>
.app {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.app-header-title {
  text-align: center;
  font-weight: bold;
  margin: 40px 0 20px;
}
.app-main-parts {
  margin: 40px;
  max-width: 900px;
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  
  gap: 20px;
}
</style>
