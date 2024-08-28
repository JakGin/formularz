import { PrismaClient } from "@prisma/client"

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

    waterHeatingSource,
    waterHeatingSourcePower,
    waterHeatingSourceHasGrant,
    waterHeatingSourceGrantYear,

    isInterested,
    interestedInYear,
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
    heatingSourceHasGrant === undefined || heatingSourceHasGrant === null
  ) {
    return {
      isDataValid: false,
      errorMessage: "Heating source, power and grant information are required",
    }
  }

  if (
    !waterHeatingSource ||
    !waterHeatingSourcePower ||
    waterHeatingSourceHasGrant === undefined || waterHeatingSourceHasGrant === null
  ) {
    return {
      isDataValid: false,
      errorMessage:
        "Water heating source, power and grant information are required",
    }
  }

  if (!isInterested) {
    return {
      isDataValid: false,
      errorMessage: "Interested information is required",
    }
  }

  // Check if someone did submit the form with the same address
  const submittedData = await prisma.submittedData.findFirst({
    where: {
      user: {
        email,
      },
    },
  })

  if (submittedData) {
    if (
      submittedData.solectwo === solectwo &&
      submittedData.street === street &&
      submittedData.houseNumber === houseNumber
    ) {
      return {
        isDataValid: false,
        errorMessage: "Na podany adres został już złożony formularz przez ten adres e-mail",
      }
    }
  }

  return {
    isDataValid: true,
    errorMessage: "",
  }
}
