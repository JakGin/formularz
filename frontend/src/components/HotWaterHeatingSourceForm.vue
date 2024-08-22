<template>
  <v-container
    class="mt-10 d-flex flex-column align-center justify-center text-center"
  >
    <v-row>
      <v-col>
        <h2>Obecne źródło ogrzewania <br />ciepłej wody</h2>
      </v-col>
    </v-row>

    <v-row class="mx-auto" max-width="300">
      <v-col>
        <v-list density="compact">
          <v-list-subheader>Wybierz źródło ogrzewania wody</v-list-subheader>

          <v-list-item
            v-for="(item, i) in heatingOptions"
            v-model="selectedWaterHeatingItem"
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
          v-model="installationWaterHeatingPower"
          label="Moc instalacji (kW)"
          type="number"
          outlined
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-checkbox
          v-model="hasWaterHeatingFunding"
          label="Czy posiadają Państwo dofinansowanie?"
        ></v-checkbox>
      </v-col>
    </v-row>

    <v-row v-if="hasWaterHeatingFunding">
      <v-col>
        <v-text-field
          v-model="waterHeatingFundingYear"
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

const selectedWaterHeatingItem = ref<string | null>(null);
const installationWaterHeatingPower = ref<number | null>(null);
const hasWaterHeatingFunding = ref<boolean>(false);
const waterHeatingFundingYear = ref<number | null>(null);

const validateYear = (year: number | null) => {
  const currentYear = new Date().getFullYear();
  return year && year > 1900 && year <= currentYear
    ? true
    : `Podaj prawidłowy rok (1900-${currentYear})`;
};

watch(
  [
    selectedWaterHeatingItem,
    installationWaterHeatingPower,
    hasWaterHeatingFunding,
    waterHeatingFundingYear,
  ],
  () => {
    emit("updateHeatingInfo", {
      selectedItem: selectedWaterHeatingItem.value,
      installationPower: installationWaterHeatingPower.value,
      hasFunding: hasWaterHeatingFunding.value,
      fundingYear: waterHeatingFundingYear.value,
    });
  }
);
</script>

<style scoped></style>
