/*
  Warnings:

  - You are about to drop the column `heatingSourceGrant` on the `SubmitedData` table. All the data in the column will be lost.
  - You are about to drop the column `waterHeatingSourceGrant` on the `SubmitedData` table. All the data in the column will be lost.
  - You are about to drop the column `city` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `houseNumber` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `solectwo` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `street` on the `User` table. All the data in the column will be lost.
  - Added the required column `city` to the `SubmitedData` table without a default value. This is not possible if the table is not empty.
  - Added the required column `heatingSourceHasGrant` to the `SubmitedData` table without a default value. This is not possible if the table is not empty.
  - Added the required column `houseNumber` to the `SubmitedData` table without a default value. This is not possible if the table is not empty.
  - Added the required column `solectwo` to the `SubmitedData` table without a default value. This is not possible if the table is not empty.
  - Added the required column `waterHeatingSourceHasGrant` to the `SubmitedData` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_SubmitedData" (
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
    CONSTRAINT "SubmitedData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_SubmitedData" ("heatingSource", "heatingSourceGrantYear", "heatingSourcePower", "id", "interestedInYear", "isInterested", "userId", "waterHeatingSource", "waterHeatingSourceGrantYear", "waterHeatingSourcePower") SELECT "heatingSource", "heatingSourceGrantYear", "heatingSourcePower", "id", "interestedInYear", "isInterested", "userId", "waterHeatingSource", "waterHeatingSourceGrantYear", "waterHeatingSourcePower" FROM "SubmitedData";
DROP TABLE "SubmitedData";
ALTER TABLE "new_SubmitedData" RENAME TO "SubmitedData";
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "email" TEXT NOT NULL
);
INSERT INTO "new_User" ("email", "id", "name", "surname") SELECT "email", "id", "name", "surname" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
