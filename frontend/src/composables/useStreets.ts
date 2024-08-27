import { ref, watch } from "vue";
import { API_BASE_URL } from "../constants/url";

const useStreets = (solectwo: string) => {
  const streets = ref<string[]>([]);
  const loading = ref(false);

  const fetchStreets = async (solectwo: string) => {
    if (!solectwo) return;
    try {
      loading.value = true;
      const response = await fetch(`${API_BASE_URL}/api/streets?solectwo=${encodeURIComponent(solectwo)}`);
      const data = await response.json();

      if (!response.ok) {
        console.error("Error loading data");
      } else {
        streets.value = data;
      }
    } catch (error) {
      console.error("Fetch streets failed:", error);
    } finally {
      loading.value = false;
    }
  };

  watch(
    () => solectwo,
    (newSolectwo) => {
      fetchStreets(newSolectwo);
    }
  );

  return {
    streets,
    loading,
    fetchStreets,
  };
};

export default useStreets;