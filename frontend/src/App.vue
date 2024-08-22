<script setup lang="ts">
import PersonalInfo from "./components/PersonalInfo.vue"
import HeatingSourceForm from "./components/HeatingSourceForm.vue";
</script>

<template>
  <header>
    <div></div>
  </header>

  <main>
    <div>
      Formularz

      <HeatingSourceForm />
    </div>
    <PersonalInfo/>
  </main>
</template>

<style scoped></style>
