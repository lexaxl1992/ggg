function show_error(code) {
    'use strict';

    var
        snackbar_container = document.getElementById('snackbar_container'),
        error_text;

    switch (code) {
    case 404:
        error_text = {message: 'Ошибка: страница не найдена.'};
        break;
    default:
        error_text = {message: 'Произошла непредвиденная ошибка.'};
        break;
    }

    snackbar_container.MaterialSnackbar.showSnackbar(error_text);
}

document.addEventListener('ajax:error', show_error);