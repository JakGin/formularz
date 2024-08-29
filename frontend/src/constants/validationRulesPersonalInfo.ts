export const nameRules = [
    (value: string) => {
        if (value) return true
        return 'Imię jest wymagane.'
    },
    (value: string) => {
        if (value.length >= 2) return true
        return 'Imię musi się składać przynajmniej z 2 znaków.'
    },
]

export const lastnameRules = [
    (value: string) => {
        if (value) return true
        return 'Nazwisko jest wymagane.'
    },
    (value: string) => {
        if (value.length >= 2) return true
        return 'Nazwisko musi się składać przynajmniej z 2 znaków.'
    },
]

export const emailRules = [
    (value: string) => {
        if (value) return true
        return 'E-mail jest wymagany.'
    },
    (value: string) => {
        if (/.+@.+\..+/.test(value)) return true
        return 'E-mail musi być poprawny.'
    },
]

export const solectwoRules = [
    (value: string) => {
        if (value) return true
        return 'Sołectwo jest wymagane.'
    },
]

export const streetRules = [
    (value: string) => {
        if (value) return true
        return 'Ulica jest wymagana.'
    },
]

export const homeNumberRules = [
    (value: string) => {
        if (value) return true
        return 'Numer domu jest wymagany.'
    },
]
