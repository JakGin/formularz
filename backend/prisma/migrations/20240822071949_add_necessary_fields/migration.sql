/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `city` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `houseNumber` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `solectwo` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `surname` to the `User` table without a default value. This is not possible if the table is not empty.
  - Made the column `name` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Post";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "SubmitedData" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "heatingSource" TEXT NOT NULL,
    "heatingSourcePower" REAL NOT NULL,
    "heatingSourceGrant" BOOLEAN NOT NULL,
    "heatingSourceGrantYear" INTEGER,
    "waterHeatingSource" TEXT NOT NULL,
    "waterHeatingSourcePower" REAL NOT NULL,
    "waterHeatingSourceGrant" BOOLEAN NOT NULL,
    "waterHeatingSourceGrantYear" INTEGER,
    "isInterested" BOOLEAN NOT NULL,
    "interestedInYear" INTEGER,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "SubmitedData_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "solectwo" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "street" TEXT,
    "houseNumber" TEXT NOT NULL
);
INSERT INTO "new_User" ("email", "id", "name") SELECT "email", "id", "name" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
