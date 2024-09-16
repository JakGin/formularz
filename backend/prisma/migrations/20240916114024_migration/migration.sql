-- CreateTable
CREATE TABLE "SubmittedData" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "solectwo" TEXT NOT NULL,
    "street" TEXT,
    "houseNumber" TEXT NOT NULL,
    "heatingSource" TEXT NOT NULL,
    "heatingSourcePower" DOUBLE PRECISION NOT NULL,
    "heatingSourceHasGrant" BOOLEAN NOT NULL,
    "heatingSourceGrantYear" INTEGER,
    "waterHeatingSource" TEXT NOT NULL,
    "waterHeatingSourcePower" DOUBLE PRECISION NOT NULL,
    "waterHeatingSourceHasGrant" BOOLEAN NOT NULL,
    "waterHeatingSourceGrantYear" INTEGER,
    "isInterested" BOOLEAN NOT NULL,
    "interestedInYear" INTEGER,

    CONSTRAINT "SubmittedData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Solectwo" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Solectwo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Street" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "solectwoId" INTEGER NOT NULL,

    CONSTRAINT "Street_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Street" ADD CONSTRAINT "Street_solectwoId_fkey" FOREIGN KEY ("solectwoId") REFERENCES "Solectwo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
