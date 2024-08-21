import express from "express"
import { PrismaClient } from '@prisma/client'

const app = express()

app.use(express.json())

const prisma = new PrismaClient()

app.get("/", (req, res) => {
  res.send("Hello, world!")
})

app.post("/form", async (req, res) => {
  const {
    name,
    surname,
    email,
    streetName,
    houseNumber,
    solectwo,

  } = req.body

  const user = await prisma.user.create({
    data: {
      name,
      surname,
      email,
      address: {
        create: {
          streetName,
          houseNumber,
          solectwo,
        },
      },
    },
  })
  console.log(user)

  const submittedData = {

  }



  res.send(`Got your submission`)
})

// Start the server
const port = 3000
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`)
})
