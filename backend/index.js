import express from "express"
import { PrismaClient } from "@prisma/client"

const app = express()

app.use(express.json())

const prisma = new PrismaClient()

app.post("/form", async (req, res) => {
  const {
    name,
    surname,
    email,

    heatingSource,
    heatingSourcePower,
    heatingSourceHasGrant,
    heatingSourceGrantAmount,

    waterHeatingSource,
    waterHeatingSourcePower,
    waterHeatingSourceHasGrant,
    waterHeatingSourceGrantAmount,

    isInterested,
    interestedInYear,
  } = req.body

  if (!name || !surname || !email) {
    return res.status(400).send("Please fill all the fields")
  }

  const user = await prisma.user.create({
    data: {
      name,
      surname,
      email,
    },
  })

  console.log(user)

  const submittedData = await prisma.submittedData.create({
    heatingSource,
    heatingSourcePower,
    heatingSourceHasGrant,
    heatingSourceGrantAmount,

    waterHeatingSource,
    waterHeatingSourcePower,
    waterHeatingSourceHasGrant,
    waterHeatingSourceGrantAmount,

    isInterested,
    interestedInYear,
  })

  console.log(submittedData)

  res.send()
})

// Start the server
const port = 3000
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`)
})
