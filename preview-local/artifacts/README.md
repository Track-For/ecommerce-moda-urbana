# Pacote local de alterações do Cali

`cali-redesign-patch.zip` é um pacote incremental com dezoito arquivos, para aplicação sobre a mesma versão do Cali presente em `01-original`. Não é um tema completo nem um importador do painel. A revisão atual do footer e dos depoimentos ainda não foi enviada.

O ZIP preserva os caminhos do tema e inclui explicitamente os dois novos arquivos editoriais. `cali-redesign-patch.manifest.json` registra o SHA-256 de cada arquivo. Após qualquer alteração nas fontes, o pacote e o manifesto precisam ser recriados.

## Conteúdo

- snipplets/header/header-modals.tpl
- snipplets/header/header.tpl
- snipplets/home/home-featured-grid.tpl
- snipplets/home/home-slider.tpl
- snipplets/home/home-modules.tpl
- snipplets/home/home-editorial-pair.tpl (novo)
- snipplets/home/home-editorial-campaign.tpl (novo)
- config/settings.txt
- snipplets/home/home-editorial-tiles.tpl (novo)
- snipplets/footer/footer.tpl
- snipplets/newsletter.tpl
- snipplets/home/home-testimonials.tpl
- snipplets/home/home-section-switch.tpl
- static/css/style-async.scss.tpl
- static/css/style-critical.tpl
- static/js/store.js.tpl
- static/css/style-editorial-critical.tpl (novo)
- static/css/style-editorial-async.tpl (novo)

Não enviar `preview-local`, suas dependências, testes ou artefatos junto ao tema.

## Correção

O CSS editorial não remove mais as transições de todos os descendentes da vitrine. Apenas os efeitos decorativos recebem a regra de movimento reduzido. O Swiper 6.3.2 nativo recebe `speed: 0` na vitrine principal quando essa preferência está ativa no carregamento. Assim, conclui a transição de forma síncrona e libera `animating`, mantendo o loop original. No modo normal, a duração continua em 300 ms.

As inclusões usam caminhos relativos à raiz do tema, via Twig, antes da compilação SCSS. Os arquivos editoriais não incluem outros arquivos. Referências oficiais: https://nuvemshop.dev/themes/classic-themes/getting-started e https://docs.nuvemshop.com.br/help/layouts . A compilação no servidor da Nuvemshop ainda requer homologação.

## Verificação reproduzível

Na raiz de `03-desenvolvimento`: `node preview-local/check-publication.mjs`.

O teste usa Chrome headless e o Swiper distribuído com o tema. Renderiza o trecho real de configuração da vitrine com Twig.js e testa controles anterior/próxima, repetição e loop em 375, 768 e 1440 px, com três e seis itens, formatos normal e assimétrico, e movimento normal/reduzido. Os itens são fixtures; serviços LS, carrinho, checkout e busca não são executados.

Twig.js exige adaptação da diretiva `snipplet`; Dart Sass valida o SCSS assíncrono completo e o CSS crítico editorial. O CSS crítico legado é inline, não é tratado como uma folha Sass completa neste teste.

Ainda é necessário validar na Nuvemshop os banners e configurações reais, menus, busca, carrinho e checkout. A preferência de movimento é consultada ao carregar a página; ao alterá-la no sistema, recarregue a página.

## Atualiza??o editorial local

O m?dulo de imagem e texto agora usa o primeiro banner como destaque e os demais em grade responsiva. Esta revis?o do m?dulo ainda n?o foi enviada para a loja.

O bloco complementar de campanha e dois produtos foi acrescentado localmente ? vitrine. O novo snippet home-editorial-pair.tpl precisa acompanhar home-featured-grid.tpl. Esta adi??o ainda n?o foi publicada.

## Envio do banner de largura total

Os cinco arquivos desta atualizacao foram enviados e conferidos por hash. Consulte campaign-deploy-state.json para backup e registro. A verificacao publica imediata ainda nao mostrou o novo banner. No painel, Banner editorial de largura total permite definir a campanha; sem configuracao, utiliza o segundo modulo existente.

## Banners finais e rodape

Nova galeria tf_editorial_tiles no painel, com fallback para o segundo e terceiro modulos. A secao aparece no final da home, antes do rodape nativo, preservando as demais secoes configuradas. O rodape mantem seus formularios, menus, selos e integracoes. Backup e verificacao do envio em footer-deploy-state.json.
