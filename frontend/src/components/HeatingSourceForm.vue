<template>
  <v-container
    class="heating-source-form-container d-flex flex-column"
  >
    <h2 class="heating-source-form-title">Obecne źródło ogrzewania gospodarstwa domowego</h2>

    <v-row class="align-center justify-center text-center mx-auto" max-width="300">
      <v-col>
        <v-list density="compact">
          <v-list-subheader>Wybierz źródło ciepła</v-list-subheader>

          <v-list-item
            v-for="(item, i) in heatingOptions"
            v-model="selectedItem"
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

    <!-- Pole tekstowe do wpisania innego źródła ogrzewania, pojawia się, gdy wybrano opcję 'Inne' -->
    <v-row v-if="selectedItem === 'Inne'">
      <v-col>
        <v-text-field
          v-model="otherHeatingSource"
          label="Inne źródło ogrzewania"
          outlined
          required
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-text-field
          v-model="installationPower"
          label="Moc instalacji (kW)"
          type="number"
          outlined
          required
          :rules="installationPowerHeatingRules"
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-checkbox
          v-model="hasFunding"
          label="Czy posiadają Państwo dofinansowanie na wyżej wymienioną instalację grzewczą?"
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
      <v-col>
        <v-text-field
          v-model="fundingLastYear"
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
import { installationPowerHeatingRules } from "../constants/validationRulesHeatingSource"

const emit = defineEmits(["updateHeatingInfo"])

const heatingOptions = [
  { text: "Pompa ciepła", icon: "mdi-air-conditioner" },
  { text: "Piec elektryczny", icon: "mdi-radiator" },
  { text: "Piec gazowy", icon: "mdi-fire" },
  { text: "Eko groszek", icon: "mdi-sack" },
  { text: "Pelet", icon: "mdi-leaf" },
  { text: "Inne", icon: "mdi-help-circle-outline" },
]

const selectedItem = ref<string | null>(null)
const otherHeatingSource = ref<string | null>(null)
const installationPower = ref<number | null>(null)
const hasFunding = ref<boolean>(false)
const fundingYear = ref<number | null>(null)
const fundingLastYear = ref<number | null>(null)

const validateYear = (year: number | null) => {
  const currentYear = new Date().getFullYear() + 50
  return year && year > 1900 && year <= currentYear
    ? true
    : `Podaj prawidłowy rok (1900-${currentYear})`
}

const selectHeatingOption = (option: string) => {
  selectedItem.value = option
  if (option !== "Inne") {
    otherHeatingSource.value = null
  }
}

watch(
  [
    selectedItem,
    installationPower,
    hasFunding,
    fundingYear,
    fundingLastYear,
    otherHeatingSource,
  ],
  () => {
    emit("updateHeatingInfo", {
      selectedItem:
        selectedItem.value === "Inne"
          ? otherHeatingSource.value
          : selectedItem.value,
      installationPower: installationPower.value,
      hasFunding: hasFunding.value,
      fundingYear: fundingYear.value,
      fundingLastYear: fundingLastYear.value,
    })
  }
)
</script>

<style scoped>
.heating-source-form-container {
  padding: 0;
}
.heating-source-form-title {
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
