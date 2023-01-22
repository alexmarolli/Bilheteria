/*
  Warnings:

  - You are about to drop the column `filme` on the `sessao` table. All the data in the column will be lost.
  - You are about to drop the column `id_sessao` on the `ticket` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `ticket` table. All the data in the column will be lost.
  - Added the required column `id_filme` to the `sessao` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ticket" DROP CONSTRAINT "ticket_id_sessao_fkey";

-- DropForeignKey
ALTER TABLE "ticket" DROP CONSTRAINT "ticket_id_user_fkey";

-- AlterTable
ALTER TABLE "sessao" DROP COLUMN "filme",
ADD COLUMN     "id_filme" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "ticket" DROP COLUMN "id_sessao",
DROP COLUMN "id_user";

-- CreateTable
CREATE TABLE "filme" (
    "id_filme" SERIAL NOT NULL,
    "Filme" TEXT NOT NULL,

    CONSTRAINT "filme_pkey" PRIMARY KEY ("id_filme")
);

-- CreateTable
CREATE TABLE "Venda" (
    "id_venda" SERIAL NOT NULL,
    "id_user" INTEGER NOT NULL,
    "id_sessao" INTEGER NOT NULL,
    "potrona" INTEGER[],

    CONSTRAINT "Venda_pkey" PRIMARY KEY ("id_venda")
);

-- AddForeignKey
ALTER TABLE "sessao" ADD CONSTRAINT "sessao_id_filme_fkey" FOREIGN KEY ("id_filme") REFERENCES "filme"("id_filme") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venda" ADD CONSTRAINT "Venda_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "usuarios"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venda" ADD CONSTRAINT "Venda_id_sessao_fkey" FOREIGN KEY ("id_sessao") REFERENCES "sessao"("id_sessao") ON DELETE RESTRICT ON UPDATE CASCADE;
