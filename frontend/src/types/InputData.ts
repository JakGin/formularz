export type TInputData = {
  name: string
  lastname: string
  email: string
  solectwo: string | null
  street: string | null
  homeNumber: string

  heatingSource: string
  heatingSourcePower: number
  heatingSourceHasGrant: false
  heatingSourceGrantYear: number
  heatingSourceLastYear: number

  waterHeatingSource: string
  waterHeatingSourcePower: number
  waterHeatingSourceHasGrant: false
  waterHeatingSourceGrantYear: number
  waterHeatingSourceLastYear: number

  isInterested: string | boolean | null | undefined,
}
