<label class="tf-privacy-check">
    <input class="tf-privacy-input" type="checkbox" name="privacy_acknowledgement" value="accepted" required>
    <span>{% if privacy_marketing %}Quero receber novidades e ofertas e li a {% else %}Li a {% endif %}<a href="/politica-de-privacidade/" target="_blank" rel="noopener">Política de Privacidade</a>{% if privacy_marketing %}. Posso cancelar minha inscrição a qualquer momento{% endif %}.</span>
</label>
