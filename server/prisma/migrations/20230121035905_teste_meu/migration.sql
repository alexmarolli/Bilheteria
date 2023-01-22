-- AddForeignKey
ALTER TABLE "sessao" ADD CONSTRAINT "sessao_id_sala_fkey" FOREIGN KEY ("id_sala") REFERENCES "sala"("id_sala") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "usuarios"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_id_sessao_fkey" FOREIGN KEY ("id_sessao") REFERENCES "sessao"("id_sessao") ON DELETE RESTRICT ON UPDATE CASCADE;
