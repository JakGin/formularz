export type TInputData = {
    name: string,
    lastname: string,
    email: string,
    solectwo: string | null,
    street: string | null,
    homeNumber: string,

    heatingSource: string,
    heatingSourcePower: number,
    heatingSourceHasGrant: boolean,
    heatingSourceGrantYear: number,

    waterHeatingSource: string,
    waterHeatingSourcePower: number,
    waterHeatingSourceHasGrant: boolean,
    waterHeatingSourceGrantYear: number,

    isInterested: string | boolean | null | undefined,
}
