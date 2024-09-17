import type { TInputData } from "../types/InputData";

const initData: TInputData = {
    name: "",
    lastname: "",
    email: "",
    solectwo: null,
    street: null,
    homeNumber: "",

    heatingSource: "",
    heatingSourcePower: 0.0,
    heatingSourceHasGrant: false,
    heatingSourceGrantYear: 0,

    waterHeatingSource: "",
    waterHeatingSourcePower: 0.0,
    waterHeatingSourceHasGrant: false,
    waterHeatingSourceGrantYear: 0,

    isInterested: false,
    isInterestedInYear: null,
}

export default initData;
