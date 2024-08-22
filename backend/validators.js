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
    heatingSource === undefined ||
    heatingSourcePower === undefined ||
    heatingSourceHasGrant === undefined
  ) {
    return {
      isDataValid: false,
      errorMessage: "Heating source, power and grant information are required",
    }
  }

  if (
    waterHeatingSource === undefined ||
    waterHeatingSourcePower === undefined ||
    waterHeatingSourceHasGrant === undefined
  ) {
    return {
      isDataValid: false,
      errorMessage:
        "Water heating source, power and grant information are required",
    }
  }

  if (isInterested === undefined) {
    return {
      isDataValid: false,
      errorMessage: "Interested information is required",
    }
  }

  // Check if someone didn't submit the form with the same address
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
        errorMessage: "You have already submitted the form with this address",
      }
    }
  }

  return {
    isDataValid: true,
    errorMessage: "",
  }
}
