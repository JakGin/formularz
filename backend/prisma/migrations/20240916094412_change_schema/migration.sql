/*
  Warnings:

  - You are about to drop the column `userId` on the `SubmittedData` table. All the data in the column will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[email]` on the table `SubmittedData` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `SubmittedData` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `SubmittedData` table without a default value. This is not possible if the table is not empty.
  - Added the required column `surname` to the `SubmittedData` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "SubmittedData" DROP CONSTRAINT "SubmittedData_userId_fkey";

-- AlterTable
ALTER TABLE "SubmittedData" DROP COLUMN "userId",
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "surname" TEXT NOT NULL;

-- DropTable
DROP TABLE "User";

-- CreateIndex
CREATE UNIQUE INDEX "SubmittedData_email_key" ON "SubmittedData"("email");
