/* Frontend acknowledgement only; consent retention belongs to the receiving service. */
(function () {
    function validatePrivacy(event, form) {
        if (!form) return;
        var checkbox = form.querySelector('.tf-privacy-input');
        if (checkbox && !checkbox.checked) {
            event.preventDefault();
            event.stopImmediatePropagation();
            checkbox.reportValidity();
        }
    }
    document.addEventListener('submit', function (event) {
        validatePrivacy(event, event.target);
    }, true);
    document.addEventListener('click', function (event) {
        var submit = event.target.closest('button[type="submit"], input[type="submit"]');
        if (submit) validatePrivacy(event, submit.form);
    }, true);
}());
