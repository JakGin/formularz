import express from "express"
import cors from "cors"
import { PrismaClient } from "@prisma/client"
import { validateData, validateUpdateData } from "./validators.js"

const app = express()

app.use(express.json())
app.use(cors())

const prisma = new PrismaClient()

app.get("/submitted_data", async (req, res) => {
  const submittedData = await prisma.submittedData.findMany()

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
  const { solectwo } = req.query;
  if (!solectwo) {
    return res.status(400).json({ error: "solectwo query parameter is required" });
  }

  try {
    const streets = await prisma.street.findMany({
      where: {
        solectwo: {
          name: solectwo,
        },
      },
      select: {
        name: true,
      },
    });

    res.json(streets);
  } catch (error) {
    console.error("Error fetching streets:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.post("/form", async (req, res) => {
  try {
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
    } = req.body
    // Validate the data
    const { isDataValid, errorMessage } = await validateData(req.body)
    if (!isDataValid) {
      res.status(400).json({ error: errorMessage })
      return
    }

    const submittedData = await prisma.submittedData.create({
      data: {
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
      },
    })

    res.send()
  } catch (error) {
    console.error("Error saving the form data:", error)
    res.status(500).json({ error: "Internal server error" })
  }
})

app.put("/form", async (req, res) => {
  try {
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
    } = req.body
    // Validate the data
    const { isDataValid, errorMessage } = await validateUpdateData(req.body)
    if (!isDataValid) {
      res.status(400).json({ error: errorMessage })
      return
    }

    // Check if someone did submit the form with the same address
    const submittedData = await prisma.submittedData.findFirst({
      where: {
        email,
        solectwo,
        street,
        houseNumber,
      },
    })

    if (!submittedData) {
      res.status(400).json({
        error: "Na podany adres nie został wcześniej wysłany formularz",
      })
      return
    }

    await prisma.submittedData.update({
      where: {
        id: submittedData.id,
      },
      data: {
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
      },
    })

    res.send()
  } catch (error) {
    console.error("Error updating the form data:", error)
    res.status(500).json({ error: "Internal server error" })
  }
})

// Start the server
const port = 3000
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`)
})
