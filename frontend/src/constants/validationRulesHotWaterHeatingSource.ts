export const installationWaterHeatingPowerRules = [
    (value: string) => {
        if (value) return true
        return 'Moc instalacji jest wymagana.'
    },
]
