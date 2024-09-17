/*
  Warnings:

  - You are about to drop the column `interestedInYear` on the `SubmittedData` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "SubmittedData" DROP COLUMN "interestedInYear",
ADD COLUMN     "heatingSourceLastYear" INTEGER,
ADD COLUMN     "waterHeatingSourceLastYear" INTEGER,
ALTER COLUMN "isInterested" DROP NOT NULL;
