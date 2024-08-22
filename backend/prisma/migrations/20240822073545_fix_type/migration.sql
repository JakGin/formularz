/*
  Warnings:

  - You are about to drop the `SubmitedData` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "SubmitedData";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "SubmittedData" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "solectwo" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "street" TEXT,
    "houseNumber" TEXT NOT NULL,
    "heatingSource" TEXT NOT NULL,
    "heatingSourcePower" REAL NOT NULL,
    "heatingSourceHasGrant" BOOLEAN NOT NULL,
    "heatingSourceGrantYear" INTEGER,
    "waterHeatingSource" TEXT NOT NULL,
    "waterHeatingSourcePower" REAL NOT NULL,
    "waterHeatingSourceHasGrant" BOOLEAN NOT NULL,
    "waterHeatingSourceGrantYear" INTEGER,
    "isInterested" BOOLEAN NOT NULL,
    "interestedInYear" INTEGER,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "SubmittedData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
