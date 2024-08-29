export const yearRules =  [
    (value: string) => {
        if (value) return true
        return 'To pole jest wymagane.'
    },
    (value: string) => {
        if (value && value.length === 4) return true
        return 'Rok musi składać się z 4 cyfr.'
    },
    (value: string) => {
        if (value && !isNaN(Number(value))) return true
        return 'Rok musi składać się z cyfr.'
    },
    (value: string) => {
        if (value && Number(value) >= 2024 && Number(value) <= 2074) return true
        return 'Rok musi być z zakresu 2024-2074.'
    },
]
