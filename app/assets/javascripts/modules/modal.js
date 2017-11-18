function def_modal() {
    'use strict';

    var
        dialogs = document.getElementsByTagName('dialog'),
        info_window = document.getElementById('info_window'),
        info_wrapper = document.getElementById('info_wrapper'),
        infoblock_editor = document.getElementById('infoblock__editor'),
        item_window = document.getElementById('item_info_window'),
        slider_editor = document.getElementById('main_slider__editor');

    for (var i = 0; i < dialogs.length; i += 1) {
        dialogPolyfill.registerDialog(dialogs[i]);
    }

    document.addEventListener('click', function (event) {
        var
            target = event.target,
            classlist = target.classList,
            dataset = target.dataset;

        if (classlist.contains('open__window')) {
            if (classlist.contains('crutch')) {
                fill_window(null, dataset.controller, null, dataset.action);
            } else {
                var
                    url = '/' + dataset.controller + '/' + dataset.id,
                    data = get_data(url);

                if (data.ok === true) {
                    fill_window(data, dataset.controller, dataset.id, dataset.action);
                } else { show_alert(404); }
            }
        } else if (classlist.contains('remove__slide')) {
            // nothing
        }

        // close window on backdrop click
        if (classlist.contains('mdl-dialog')) {
            target.close();
        }
        // close window on button click
        if (classlist.contains('close__window')) {
            target.parentNode.parentNode.parentNode.close();
        }
    });


    function fill_window(data, controller, id, action) {
        switch(controller) {

        case 'infoblocks':
            if (action == 'show') {
                info_wrapper.innerHTML = data.html;
                info_window.getElementsByTagName('h4')[0].innerText = data.header;
                info_window.showModal();
            } else if (action == 'edit') {
                infoblock_editor.getElementsByTagName('h4')[0].innerText = 'Редактирование блока "' + data.header + '"';
                infoblock_editor.getElementsByTagName('form')[0].action = '/' + controller + '/' + id;
                infoblock_editor.getElementsByTagName('iframe')[0].contentDocument.body.innerHTML = data.html;
                infoblock_editor.show();
            }
            break;

        case 'images':
            if (action == 'new') {
                slider_editor.getElementsByTagName('h4')[0].innerText = 'Добавление слайда';
                slider_editor.getElementsByTagName('form')[0].action = '/' + controller;
            } else if (action == 'edit') {
                slider_editor.getElementsByTagName('h4')[0].innerText = 'Замена слайда';
                var slide_id = document.getElementsByClassName('slick-current')[0].getElementsByTagName('img')[0].dataset.id;
                slider_editor.getElementsByTagName('form')[0].action = '/' + controller + '/' + slide_id;
            }
            slider_editor.showModal();
            break;

        default:
            show_alert(404);
            break;
        }
    }
}