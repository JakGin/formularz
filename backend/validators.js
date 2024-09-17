import { PrismaClient } from "@prisma/client"
import { unescapeLeadingUnderscores } from "typescript"

const prisma = new PrismaClient()

export const validateData = async (data) => {
  const {
    name,
    surname,
    email,

    solectwo,
    street,
    houseNumber,

    heatingSource,
    heatingSourcePower,
    heatingSourceHasGrant,
    heatingSourceGrantYear,
    heatingSourceLastYear,

    waterHeatingSource,
    waterHeatingSourcePower,
    waterHeatingSourceHasGrant,
    waterHeatingSourceGrantYear,
    waterHeatingSourceLastYear,

    isInterested,
  } = data
  if (!name || !surname || !email) {
    return {
      isDataValid: false,
      errorMessage: "Name, surname and email are required",
    }
  }

  if (!solectwo || !houseNumber) {
    return {
      isDataValid: false,
      errorMessage: "Solectwo, street and house number are required",
    }
  }

  if (
    !heatingSource ||
    !heatingSourcePower ||
    heatingSourceHasGrant === undefined ||
    heatingSourceHasGrant === null
  ) {
    return {
      isDataValid: false,
      errorMessage: "Heating source, power and grant information are required",
    }
  }

  if (
    !waterHeatingSource ||
    !waterHeatingSourcePower ||
    waterHeatingSourceHasGrant === undefined ||
    waterHeatingSourceHasGrant === null
  ) {
    return {
      isDataValid: false,
      errorMessage:
        "Water heating source, power and grant information are required",
    }
  }

  // Check if someone did submit the form with the same house address
  const submittedData = await prisma.submittedData.findFirst({
    where: {
      email,
      solectwo,
      street,
      houseNumber,
    },
  })

  if (submittedData) {
    return {
      isDataValid: false,
      errorMessage:
        "Na podany adres został już złożony formularz przez ten adres e-mail",
    }
  }

  return {
    isDataValid: true,
    errorMessage: "",
  }
}

export const validateUpdateData = async (data) => {
  const {
    name,
    surname,
    email,

    solectwo,
    street,
    houseNumber,

    heatingSource,
    heatingSourcePower,
    heatingSourceHasGrant,
    heatingSourceGrantYear,
    heatingSourceLastYear,

    waterHeatingSource,
    waterHeatingSourcePower,
    waterHeatingSourceHasGrant,
    waterHeatingSourceGrantYear,
    waterHeatingSourceLastYear,

    isInterested,
  } = data
  if (!name || !surname || !email) {
    return {
      isDataValid: false,
      errorMessage: "Name, surname and email are required",
    }
  }

  if (!solectwo || !houseNumber) {
    return {
      isDataValid: false,
      errorMessage: "Solectwo, street and house number are required",
    }
  }

  if (
    !heatingSource ||
    !heatingSourcePower ||
    heatingSourceHasGrant === undefined ||
    heatingSourceHasGrant === null
  ) {
    return {
      isDataValid: false,
      errorMessage: "Heating source, power and grant information are required",
    }
  }

  if (
    !waterHeatingSource ||
    !waterHeatingSourcePower ||
    waterHeatingSourceHasGrant === undefined ||
    waterHeatingSourceHasGrant === null
  ) {
    return {
      isDataValid: false,
      errorMessage:
        "Water heating source, power and grant information are required",
    }
  }

  return {
    isDataValid: true,
    errorMessage: "",
  }
}
