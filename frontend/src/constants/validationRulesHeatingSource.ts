export const installationPowerHeatingRules = [
    (value: string) => {
        if (value) return true
        return 'Moc instalacji jest wymagana.'
    },
]
