<template>
  <v-container
    class="hot-water-heating-source-form-container d-flex flex-column"
  >
    <h2 class="hot-water-heating-source-form-title">Obecne źródło ogrzewania ciepłej wody</h2>

    <v-row class="align-center justify-center text-center mx-auto" max-width="300">
      <v-col>
        <v-list density="compact">
          <v-list-subheader>Wybierz źródło ogrzewania wody</v-list-subheader>

          <v-list-item
            v-for="(item, i) in heatingOptions"
            v-model="selectedWaterHeatingItem"
            :key="i"
            :value="item.text"
            color="primary"
            @click="selectHeatingOption(item.text)"
          >
            <template v-slot:prepend>
              <v-icon>{{ item.icon }}</v-icon>
            </template>
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item>
        </v-list>
      </v-col>
    </v-row>

    <v-row v-if="selectedWaterHeatingItem === 'Inne'">
      <v-col>
        <v-text-field
          v-model="otherWaterHeatingSource"
          label="Inne źródło ogrzewania"
          outlined
          required
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-text-field
          v-model="installationWaterHeatingPower"
          label="Moc instalacji (kW)"
          type="number"
          outlined
          required
          :rules="installationWaterHeatingPowerRules"
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-checkbox
          v-model="hasWaterHeatingFunding"
          label="Czy posiadają Państwo dofinansowanie na wyżej wymienioną instalację grzewczą?"
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
      <v-col>
        <v-text-field
          v-model="waterHeatingLastFundingYear"
          label="Rok trwałości dofinansowania"
          type="number"
          outlined
          :rules="[validateYear]"
        ></v-text-field>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup lang="ts">
import { ref, defineEmits, watch } from "vue"
import { installationWaterHeatingPowerRules } from "../constants/validationRulesHotWaterHeatingSource"

const emit = defineEmits(["updateHotWaterHeatingInfo"])

const heatingOptions = [
  { text: "Pompa ciepła", icon: "mdi-air-conditioner" },
  { text: "Boiler", icon: "mdi-water-boiler" },
  { text: "Piec elektryczny", icon: "mdi-radiator" },
  { text: "Piec gazowy", icon: "mdi-fire" },
  { text: "Eko groszek", icon: "mdi-sack" },
  { text: "Pelet", icon: "mdi-leaf" },
  { text: "Inne", icon: "mdi-help-circle-outline" },
]

const selectedWaterHeatingItem = ref<string | null>(null)
const otherWaterHeatingSource = ref<string | null>(null)
const installationWaterHeatingPower = ref<number | null>(null)
const hasWaterHeatingFunding = ref<boolean>(false)
const waterHeatingFundingYear = ref<number | null>(null)
const waterHeatingLastFundingYear = ref<number | null>(null)

const validateYear = (year: number | null) => {
  const currentYear = new Date().getFullYear() + 50
  return year && year > 1900 && year <= currentYear
    ? true
    : `Podaj prawidłowy rok (1900-${currentYear})`
}

const selectHeatingOption = (option: string) => {
  selectedWaterHeatingItem.value = option
  if (option !== "Inne") {
    otherWaterHeatingSource.value = null
  }
}

watch(
  [
    selectedWaterHeatingItem,
    installationWaterHeatingPower,
    hasWaterHeatingFunding,
    waterHeatingFundingYear,
    waterHeatingLastFundingYear,
    otherWaterHeatingSource,
  ],
  () => {
    emit("updateHotWaterHeatingInfo", {
      selectedItem:
        selectedWaterHeatingItem.value === "Inne"
          ? otherWaterHeatingSource.value
          : selectedWaterHeatingItem.value,
      installationPower: installationWaterHeatingPower.value,
      hasFunding: hasWaterHeatingFunding.value,
      fundingYear: waterHeatingFundingYear.value,
      fundingLastYear: waterHeatingLastFundingYear.value,
    })
  }
)
</script>

<style scoped>
.hot-water-heating-source-form-container {
  padding: 0;
}

.hot-water-heating-source-form-title {
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
