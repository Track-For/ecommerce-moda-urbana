(function () {
  function initShopping() {
    var product = document.querySelector('#single-product');
    // Preserve the actual filtered URL; never guess category/filter parameters.
    document.addEventListener('click', function (event) {
      var link = event.target.closest('.category-body .item-product a[href]');
      if (!link || !link.href || link.getAttribute('href').charAt(0) === '#') return;
      try { sessionStorage.setItem('tf-product-return', JSON.stringify({ url: location.href, time: Date.now() })); } catch (_) {}
    });
    if (!product) return;
    try {
      var saved = JSON.parse(sessionStorage.getItem('tf-product-return') || 'null');
      if (saved && Date.now() - saved.time < 3600000 && new URL(saved.url).origin === location.origin) {
        var back = document.createElement('a');
        back.className = 'tf-back-to-results'; back.href = saved.url; back.textContent = 'Voltar aos resultados';
        product.prepend(back);
      }
    } catch (_) {}
    var form = product.querySelector('#product_form');
    if (!form) return;
    var main = form.querySelector('[data-store="product-buy-button"]');
    var price = product.querySelector('#price_display');
    var groups = Array.from(form.querySelectorAll('.js-product-variants-group'));
    var variants = [];
    try { variants = JSON.parse(product.getAttribute('data-variants') || '[]'); } catch (_) {}
    var status = document.createElement('p');
    status.className = 'tf-variant-status'; status.setAttribute('aria-live', 'polite');
    if (groups.length) groups[groups.length - 1].after(status);
    function available(group, value) {
      if (!variants.length) return true;
      return variants.some(function (variant) {
        return variant.available && groups.every(function (other) {
          var select = other.querySelector('select');
          var chosen = other === group ? value : select && select.value;
          return !chosen || String(variant['option' + other.dataset.variationId]) === String(chosen);
        });
      });
    }
    groups.forEach(function (group) {
      var select = group.querySelector('select');
      if (!select) return;
      if (!group.querySelector('.js-insta-variant')) {
        var row = document.createElement('div'); row.className = 'tf-variant-options';
        Array.from(select.options).forEach(function (option) {
          if (!option.value) return;
          var button = document.createElement('button'); button.type = 'button'; button.className = 'tf-variant-option';
          button.dataset.option = option.value; button.textContent = option.textContent;
          button.addEventListener('click', function () {
            select.value = option.value;
            select.dispatchEvent(new Event('change', { bubbles: true }));
            sync();
          });
          row.append(button);
        });
        select.after(row);
        // Keep the native select available to platform scripts and assistive technology.
        select.classList.add('tf-native-variant-select');
      }
      group.querySelectorAll('.js-insta-variant').forEach(function (button) {
        button.setAttribute('role', 'button'); button.tabIndex = 0;
        button.setAttribute('aria-label', button.getAttribute('title') || button.textContent.trim());
        button.addEventListener('keydown', function (event) {
          if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); button.click(); }
        });
      });
    });
    var bar, buy, amount;
    if (main && (main.classList.contains('cart') || main.classList.contains('nostock'))) {
      bar = document.createElement('div'); bar.className = 'tf-sticky-buy'; bar.hidden = true;
      amount = document.createElement('span'); amount.className = 'tf-sticky-buy-price';
      buy = document.createElement('button'); buy.type = 'button'; buy.textContent = 'Adicionar à sacola';
      bar.append(amount, buy); document.body.append(bar);
      buy.addEventListener('click', function () {
        var missing = groups.find(function (group) { return !group.querySelector('select').value; });
        if (missing) {
          status.textContent = 'Escolha uma opção antes de adicionar à sacola.';
          form.scrollIntoView({ block: 'start' });
          missing.querySelector('button, [tabindex], select').focus({ preventScroll: true });
          return;
        }
        if (!main.disabled && main.classList.contains('cart')) main.click();
      });
    }
    function sync() {
      var selected = [];
      groups.forEach(function (group) {
        var select = group.querySelector('select'); if (!select) return;
        if (select.selectedOptions.length) selected.push(select.selectedOptions[0].textContent.trim());
        group.querySelectorAll('.tf-variant-option, .js-insta-variant').forEach(function (button) {
          var chosen = button.dataset.option === select.value;
          var inStock = available(group, button.dataset.option);
          button.setAttribute('aria-pressed', String(chosen));
          // Unavailable combinations remain selectable so shoppers can change other dimensions.
          button.setAttribute('data-unavailable', String(!inStock));
          button.title = (button.getAttribute('aria-label') || button.textContent.trim()) + (inStock ? '' : ' — indisponível nesta combinação');
        });
      });
      var message = selected.length ? 'Selecionado: ' + selected.join(' / ') : 'Escolha as opções da peça.';
      if (main && main.classList.contains('nostock')) message += ' Combinação indisponível.';
      if (status.textContent !== message) status.textContent = message;
      if (!bar) return;
      amount.textContent = price ? price.textContent.trim() : '';
      buy.disabled = main.disabled || !main.classList.contains('cart') || getComputedStyle(main).display === 'none';
      buy.textContent = main.classList.contains('nostock') ? 'Indisponível' : buy.disabled ? 'Aguarde…' : 'Adicionar à sacola';
      updateVisibility();
    }
    function updateVisibility() {
      if (!bar) return;
      var blocked = !!document.querySelector('.modal.modal-show, .modal.show, .modal.modal-visible');
      var overlay = document.querySelector('.js-overlay');
      if (overlay && getComputedStyle(overlay).display !== 'none' && getComputedStyle(overlay).visibility !== 'hidden') blocked = true;
      var cookies = document.querySelector('.js-notification-cookie-banner');
      if (cookies && getComputedStyle(cookies).display !== 'none') blocked = true;
      var visible = window.innerWidth < 768 && main.getBoundingClientRect().bottom < 0 && !blocked;
      bar.hidden = !visible;
      document.body.classList.toggle('tf-buy-visible', visible);
    }
    form.addEventListener('change', function () { requestAnimationFrame(sync); });
    if (main) new MutationObserver(sync).observe(main, { attributes: true, attributeFilter: ['class', 'disabled', 'value', 'style'] });
    if (price) new MutationObserver(sync).observe(price, { childList: true, subtree: true, characterData: true });
    var overlay = document.querySelector('.js-overlay');
    if (overlay) new MutationObserver(updateVisibility).observe(overlay, { attributes: true, attributeFilter: ['class', 'style'] });
    var cookies = document.querySelector('.js-notification-cookie-banner');
    if (cookies) new MutationObserver(updateVisibility).observe(cookies, { attributes: true, attributeFilter: ['class', 'style'] });
    window.addEventListener('scroll', updateVisibility, { passive: true });
    window.addEventListener('resize', updateVisibility);
    sync();
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initShopping);
  else initShopping();
})();
