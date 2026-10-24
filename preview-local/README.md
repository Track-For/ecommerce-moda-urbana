# Prévia local — Moda Urbana Outlet

Execute nesta pasta `npm install` e `npm run dev`. Acesse http://localhost:5173/.
O servidor escuta apenas localhost. Para parar, use Ctrl+C no terminal que o iniciou.
`npm run build` gera somente arquivos locais em `dist`; não publica nada.

## Origem e limites

`prepare.mjs` lê os Twig e os quatro arquivos de estilos originais, gera cópias adaptadas em `.templates` e compila CSS em `public/generated`. Não grava nos arquivos do Cali. Após editar o tema, reinicie `npm run dev` para regenerar a prévia.

O cabeçalho, navegação recursiva, ícones, molduras de modais, hero e primeira vitrine vêm dos componentes locais. Cores, fontes e opções partem de `config/defaults.txt`, não das configurações atuais da loja. Cada layout de teste compila seus estilos condicionais separadamente. O hero usa o Swiper já incluído no Cali, sem nova dependência.

O logo é um substituto textual, pois o arquivo real não está disponível. A fonte Manrope não é baixada; é usado o fallback sans-serif. Categorias e textos dos dois slides são fixtures identificadas como simuladas. Banner e vitrine usam SVGs neutros identificados como placeholders; não reproduzem o conteúdo comercial publicado. O componente hospedado de imagem do produto é substituído localmente. Os valores monetários são substituídos pelo texto “Preço indisponível na prévia”. Nenhum preço, desconto ou avaliação foi inventado. O rodapé continua demonstrativo e não faz parte desta etapa.

`main.js` é um adaptador de interações locais, não o JavaScript de negócios da Nuvemshop. Não carrega LS, tracking, integrações ou checkout. Componentes hospedados na plataforma são omitidos ou substituídos explicitamente. Busca, conta e carrinho não operam sobre dados reais.

“Ver antes” desativa as classes de escopo das alterações novas, mantendo a mesma fixture. É uma comparação dos refinamentos CSS, não um retrato histórico da loja.

## Ferramentas

- Vite: servidor e build local.
- Twig.js: renderização aproximada dos templates, com adaptadores para recursos da plataforma.
- Sass: compilação dos estilos existentes.
- Playwright: verificação em Chrome instalado, via `node check.mjs`.

As dependências são exclusivas desta pasta. Não há comandos FTP, publicação ou credenciais. Esta prévia não substitui testes reais de layout e compra na Nuvemshop.
