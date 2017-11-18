function show_alert(code, custom_msg) {
    'use strict';

    var
        snackbar_container = document.getElementById('snackbar_container'),
        msg;

    switch (code) {
    case 404:
        msg = 'Ошибка: страница не найдена.';
        break;
    case 0:
        msg = custom_msg;
        break;
    default:
        msg = 'Произошла непредвиденная ошибка.';
        break;
    }

    snackbar_container.MaterialSnackbar.showSnackbar({message: msg});
}

document.addEventListener('ajax:error', show_alert);