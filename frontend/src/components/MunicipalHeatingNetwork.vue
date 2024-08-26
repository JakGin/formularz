<template>
  <div>
    <h2 class="municipal-heating-network-title">Gminna Sieć Ciepłownicza</h2>
    <v-checkbox
      v-model="localFormData.eagerToJoin"
      label="Czy jesteś zainteresowany podłączeniem się do gminnej sieci ciepłowniczej?"
    />
    <v-text-field
      v-if="localFormData.eagerToJoin"
      v-model="localFormData.yearToJoin"
      :rules="yearRules"
      label="Rok planowanego dołączenia"
      required
    />
  </div>
</template>

<script setup lang="ts">
import { ref, watch, computed } from "vue";
import { PropType } from "vue";

const props = defineProps({
  formData: {
    type: Object as PropType<{
      eagerToJoin: boolean | null;
      yearToJoin: string | null;
    }>,
    required: true,
  },
});

const emit = defineEmits(["update:formData"]);

const localFormData = ref({ ...props.formData });

watch(
  localFormData,
  (newVal) => {
    emit("update:formData", newVal);
  },
  { deep: true }
);

const yearRules = computed(() => [
  (value: string) => !!value || "To pole jest wymagane.",
  (value: string) =>
    (value && value.length === 4) || "Rok musi składać się z 4 cyfr.",
  (value: string) =>
    (value && !isNaN(Number(value))) || "Rok musi składać się z cyfr.",
]);
</script>

<style scoped>
.municipal-heating-network-title {
  font-weight: bold;
  margin-bottom: 20px;
}
</style>
