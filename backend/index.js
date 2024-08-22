import express from "express"
import { PrismaClient } from "@prisma/client"
import { validateData } from "./validators.js"

const app = express()

app.use(express.json())

const prisma = new PrismaClient()

app.get("/users", async (req, res) => {
  const users = await prisma.user.findMany({
    include: {
      submittedData: true,
    },
  })

  res.json(users)
})

app.get("/submitted_data", async (req, res) => {
  const submittedData = await prisma.submittedData.findMany({
    include: {
      user: true,
    },
  })

  res.json(submittedData)
})

app.get("/api/solectwa", async (req, res) => {
  const solectwa = await prisma.solectwo.findMany({
    select: {
      name: true,
    },
  })
  res.json(solectwa)
})

app.get("/api/streets", async (req, res) => {
  const { street } = req.body

  res.json({})
})

app.post("/form", async (req, res) => {
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
  } = req.body
  // Validate the data
  const { isDataValid, errorMessage } = await validateData(req.body)
  if (!isDataValid) {
    res.status(400).json({ message: errorMessage })
    return
  }

  const user = await prisma.user.create({
    data: {
      name,
      surname,
      email,
    },
  })
  const submittedData = await prisma.submittedData.create({
    data: {
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

      userId: user.id,
    },
  })

  res.send()
})

// Start the server
const port = 3000
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`)
})
