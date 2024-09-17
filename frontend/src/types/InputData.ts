export type TInputData = {
    name: string,
    lastname: string,
    email: string,
    solectwo: string | null,
    street: string | null,
    homeNumber: string,

    heatingSource: string,
    heatingSourcePower: number,
    heatingSourceHasGrant: false,
    heatingSourceGrantYear: number,

    waterHeatingSource: string,
    waterHeatingSourcePower: number,
    waterHeatingSourceHasGrant: false,
    waterHeatingSourceGrantYear: number,

    isInterested: false,
    isInterestedInYear: number | null,
}
