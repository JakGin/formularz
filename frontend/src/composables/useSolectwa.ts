import { ref, onMounted } from 'vue'
import type { TSolectwo } from '../types/Solectwo'
import { API_BASE_URL } from '../constants/url'

const useSolectwa = () => {
  const solectwa = ref<TSolectwo | null>(null)
  const loading = ref(true)

  const fetchSolectwa = async () => {
    try {
      loading.value = true
      const response = await fetch(`${API_BASE_URL}/api/.................`, {
        method: 'GET'
      })
      const data = await response.json()

      if (!response.ok) {
        console.error('Error loading data')
      } else {
        solectwa.value = JSON.parse(JSON.stringify(data))
      }
    } catch (error) {
      console.error('Fetch solectwa failed:', error)
    } finally {
      loading.value = false
    }
  }

  onMounted(fetchSolectwa)

  return {
    solectwa,
    loading
  }
}

export default useSolectwa
