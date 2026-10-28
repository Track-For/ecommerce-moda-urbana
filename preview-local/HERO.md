# Banners da campanha — 28/10/2026

## Revisão: Moda Urbana Oficial

As dez artes foram editadas com imagegen (ferramenta integrada) para substituir “MODA URBANA OUTLET” por “MODA URBANA OFICIAL”. Prompt: correção textual de todas as ocorrências, preservando composição, fotos e demais textos. Arquivos finais em `static/images/hero/`; fontes geradas registradas em `artifacts/hero-official-sources.json`. A importação apenas converte para JPEG e normaliza as dimensões.

A hero usa 90% da largura no desktop e 92% no celular, com limite proporcional à altura da tela, centralizada e sem recorte. Os controles ocupam uma linha própria de pelo menos 68px. A validação inclui visibilidade dos controles em 1366×768, 390×667 e 1920×1080.

### Histórico da primeira publicação

Os cinco pares enviados pela cliente estão em `static/images/hero/`, preservados sem edição. `snipplets/home/home-slider.tpl` renderiza um único carrossel responsivo com `<picture>`: imagens de 820 × 1000 abaixo de 768px e imagens de 1580 × 600 nas demais larguras.

As artes já incluem textos e CTA. Não há sobreposição de títulos ou botões do painel. Cada banner leva a `store.products_url` (catálogo). O CSS em `style-editorial-critical.tpl` preserva a proporção inteira, sem recorte.

Esta campanha está definida no tema, substituindo as imagens anteriormente lidas das galerias do painel. Para trocar estas artes, alterar os arquivos e a lista `campaigns` no template. O carrossel continua usando o Swiper nativo da loja.

Validação: `npm run build` em `preview-local`; da raiz, `node preview-local/check-hero.mjs` para a prévia e `node preview-local/check-hero.mjs --live` para a loja. O teste percorre os cinco banners em 390, 820 e 1440px, verifica a versão carregada, proporção, navegação e ausência de overflow horizontal.

Publicação: `node preview-local/publish-hero.mjs --publish`. O script confere a versão remota, salva backup em `preview-local/artifacts/hero-deploy-*`, envia imagens antes do template e verifica cada arquivo por download. Em caso de falha durante a publicação, restaura os arquivos já enviados.
