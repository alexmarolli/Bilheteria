-- CreateTable
CREATE TABLE "usuarios" (
    "id_user" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "estudante" BOOLEAN NOT NULL,
    "atendente" BOOLEAN NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "sala" (
    "id_sala" SERIAL NOT NULL,
    "ptn_fila" INTEGER NOT NULL,
    "ptn_colunm" INTEGER NOT NULL,

    CONSTRAINT "sala_pkey" PRIMARY KEY ("id_sala")
);

-- CreateTable
CREATE TABLE "sessao" (
    "id_sessao" SERIAL NOT NULL,
    "id_sala" INTEGER NOT NULL,
    "filme" TEXT NOT NULL,
    "data_ini" TIMESTAMP(3) NOT NULL,
    "data_fim" TIMESTAMP(3) NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "sessao_pkey" PRIMARY KEY ("id_sessao")
);

-- CreateTable
CREATE TABLE "ticket" (
    "id_ticket" SERIAL NOT NULL,
    "id_user" INTEGER NOT NULL,
    "id_sessao" INTEGER NOT NULL,
    "valor" DOUBLE PRECISION NOT NULL,
    "valor_atual" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "ticket_pkey" PRIMARY KEY ("id_ticket")
);
