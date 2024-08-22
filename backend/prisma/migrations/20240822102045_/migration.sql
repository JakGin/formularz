/*
  Warnings:

  - You are about to drop the column `city` on the `SubmittedData` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "SubmittedData" DROP COLUMN "city";

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

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Street" ADD CONSTRAINT "Street_solectwoId_fkey" FOREIGN KEY ("solectwoId") REFERENCES "Solectwo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
