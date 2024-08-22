<template>
    <div>
        <h2 class="municipal-heating-network-title">
            Gminna Sieć Ciepłownicza
        </h2>
        <v-checkbox
        v-model="eagerToJoin"
        label="Czy jesteś zainteresowany podłączeniem się do gminnej sieci ciepłowniczej znanej z geotermalnych i innych odnawialnych źródeł ciepła?"
        ></v-checkbox>

        <v-text-field
        v-if="eagerToJoin"
        v-model="yearToJoin"
        :rules="yearRules"
        label="Rok planowanego dołączenia"
        required
        ></v-text-field>
    </div>
</template>

<script setup lang="ts">
import { ref } from "vue";

const eagerToJoin = ref(null);
const yearToJoin = ref(null);

const yearRules = [
    (value: string) => !!value || "To pole jest wymagane.",
    (value: string) => (value && value.length === 4) || "Rok musi składać się z 4 cyfr.",
    (value: string) => (value && !isNaN(Number(value))) || "Rok musi składać się z cyfr.",
];
</script>

<style scoped>
.municipal-heating-network-title {
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
