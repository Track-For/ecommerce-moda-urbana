# Acompanhamento de entregas Moda Urbana

Serviço de consulta por e-mail ou CPF, sem login. Exibe somente número, data da compra e status de envio dos pedidos dos últimos 180 dias. Não expõe endereço, itens, valores, URLs privadas de acompanhamento ou dados de pagamento.

O token Nuvemshop precisa apenas de `read_orders`. Configure as variáveis de `.env.example` como segredos no ambiente de produção, nunca no tema Nuvemshop ou no Git. A chave HMAC deve ter pelo menos 32 bytes aleatórios.

A API pública aceita POST JSON em `/api/track` com `{ "identifier": "..." }`. Não coloque identificadores em URLs. Identificadores são normalizados e comparados exatamente; CPF é validado pelos dígitos verificadores. O cache de 60 segundos guarda apenas índices HMAC e o resumo público. Há limite de 12 tentativas por IP por minuto, aplicado por instância e com cache compartilhado da borda; não é um limitador global transacional. Não registrar corpos de requisição.

A atualização reflete o status de envio registrado na Nuvemshop, não uma consulta independente à transportadora. Um CPF/e-mail não comprova identidade; por isso o retorno é limitado ao resumo da entrega.

Executar `node --test tests/tracking.test.mjs`, `bash scripts/build.sh` e `node scripts/validate-artifact.mjs` antes de publicar.

## Ativação pendente

O serviço ainda não está publicado nem conectado aos pedidos reais. É necessária a autorização do lojista para criar a integração com `read_orders`, configurar os segredos no servidor e validar a consulta antes de substituir o atalho do tema. O tema mantém a orientação já publicada para acessar o link recebido por e-mail.
