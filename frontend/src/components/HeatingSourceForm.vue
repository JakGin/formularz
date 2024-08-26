<template>
  <v-container
    class="mt-10 d-flex flex-column align-center justify-center text-center"
  >
    <v-row>
      <v-col>
        <h2>Obecne źródło ogrzewania <br />gospodarstwa domowego</h2>
      </v-col>
    </v-row>

    <v-row class="mx-auto" max-width="300">
      <v-col>
        <v-list density="compact">
          <v-list-subheader>Wybierz źródło ciepła</v-list-subheader>

          <v-list-item
            v-for="(item, i) in heatingOptions"
            v-model="selectedItem"
            :key="i"
            :value="item.text"
            color="primary"
          >
            <template v-slot:prepend>
              <v-icon>{{ item.icon }}</v-icon>
            </template>
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item>
        </v-list>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-text-field
          v-model="installationPower"
          label="Moc instalacji (kW)"
          type="number"
          outlined
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-checkbox
          v-model="hasFunding"
          label="Czy posiadają Państwo dofinansowanie?"
        ></v-checkbox>
      </v-col>
    </v-row>

    <v-row v-if="hasFunding">
      <v-col>
        <v-text-field
          v-model="fundingYear"
          label="Rok otrzymania dofinansowania"
          type="number"
          outlined
          :rules="[validateYear]"
        ></v-text-field>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup lang="ts">
import { ref, defineEmits, watch } from "vue";

const emit = defineEmits(["updateHeatingInfo"]);

const heatingOptions = [
  { text: "Pompa ciepła", icon: "mdi-air-conditioner" },
  { text: "Piec gazowy", icon: "mdi-fire" },
  { text: "Eko groszek", icon: "mdi-fire" },
  { text: "Pelet", icon: "mdi-leaf" },
];

const selectedItem = ref<string | null>(null);
const installationPower = ref<number | null>(null);
const hasFunding = ref<boolean>(false);
const fundingYear = ref<number | null>(null);

const validateYear = (year: number | null) => {
  const currentYear = new Date().getFullYear();
  return year && year > 1900 && year <= currentYear
    ? true
    : `Podaj prawidłowy rok (1900-${currentYear})`;
};

watch([selectedItem, installationPower, hasFunding, fundingYear], () => {
  emit("updateHeatingInfo", {
    selectedItem: selectedItem.value,
    installationPower: installationPower.value,
    hasFunding: hasFunding.value,
    fundingYear: fundingYear.value,
  });
});
</script>

<style scoped></style>
