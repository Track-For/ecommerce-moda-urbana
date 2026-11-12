<style>
.mu-about-surface { background: #FFFFFF; }
.mu-about { max-width: 1240px; margin: 0 auto; padding: 44px 24px 64px; color: #752416; }
.mu-about-heading { margin-bottom: 32px; text-align: center; }
.mu-about-heading h1 { margin: 0 0 12px; font-size: clamp(32px, 4vw, 48px); }
.mu-about-heading p { margin: 0; font-size: 16px; line-height: 1.6; }
.mu-about-grid { display: grid; grid-template-columns: minmax(0, .85fr) minmax(0, 1.15fr); gap: 48px; align-items: start; }
.mu-about-photo { margin: 0; }
.mu-about-photo img { display: block; width: 100%; height: auto; border-radius: 8px; }
.mu-about-photo figcaption { margin-top: 12px; font-size: 14px; text-align: center; }
.mu-about-story { font-size: 16px; line-height: 1.85; }
.mu-about-story p { margin: 0 0 20px; }
.mu-about-story .mu-about-signature { margin-top: 28px; color: #9B1B00; }
@media (max-width: 767px) {
 .mu-about { padding: 28px 20px 40px; }
 .mu-about-grid { grid-template-columns: minmax(0, 1fr); gap: 28px; }
 .mu-about-photo { width: 100%; max-width: 430px; margin: 0 auto; }
 .mu-about-story { font-size: 16px; line-height: 1.8; }
}
</style>
<div class="mu-about-surface">
<article class="mu-about" aria-labelledby="mu-about-title">
    <header class="mu-about-heading">
        <h1 id="mu-about-title">Quem somos</h1>
        <p>Fernando e Dani, por trás da Moda Urbana Oficial.</p>
    </header>
    <div class="mu-about-grid">
        <figure class="mu-about-photo">
            <img src="{{ 'images/fernando-e-dani.png' | static_url }}" alt="Fernando e Dani, da Moda Urbana Oficial" width="598" height="1128">
            <figcaption>Fernando e Dani · Moda Urbana Oficial</figcaption>
        </figure>
        <div class="mu-about-story">
            <p>Por trás de cada peça, de cada escolha e de cada pedido, existe um sonho: construir uma loja que vá muito além de vender roupas. Queremos criar uma relação de confiança, carinho e respeito com cada pessoa que escolhe fazer parte da nossa história. 🛍️</p>
            <p>Somos Fernando e Dani, e colocamos um pouquinho de nós em tudo o que fazemos. Acreditamos que comprar uma roupa não é apenas adquirir uma peça, mas também viver uma experiência, sentir-se bem, valorizar a própria personalidade e ter a certeza de que foi tratado com respeito.</p>
            <p>Por isso, aqui na Moda Urbana Oficial, cada detalhe importa! Escolhemos nossas peças com cuidado e preparamos cada pedido com o mesmo carinho que gostaríamos de receber. Afinal, por trás de cada compra existe alguém que confiou em nós, e essa confiança é algo que valorizamos de coração.</p>
            <p>Não queremos ser apenas mais uma loja no seu Instagram. Queremos ser aquela loja em que você compra com tranquilidade, indica para quem ama e volta porque sabe que é bem-vindo!</p>
            <p>Estamos construindo nossa história com honestidade, dedicação e muito amor pelo que fazemos.</p>
            <p>Seja muito bem-vindo à nossa família Moda Urbana Oficial. Que essa seja apenas a primeira de muitas experiências lindas que vamos compartilhar juntos! ❤️</p>
            <p class="mu-about-signature">Com carinho,<br><strong>Fernando e Dani🤎</strong></p>
        </div>
    </div>
</article>
</div>
