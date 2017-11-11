function def_modal() {
    'use strict';

    var
        dialogs = document.getElementsByTagName('dialog'),
        info_window = document.getElementById('info_window'),
        info_wrapper = document.getElementById('info_wrapper'),
        edit_info_window = document.getElementById('edit_info_window'),
        item_window = document.getElementById('item_info_window');

    for (var i = 0; i < dialogs.length; i += 1) {
        dialogPolyfill.registerDialog(dialogs[i]);
    }


    document.addEventListener('click', function (event) {
        var
            target = event.target,
            classlist = target.classList,
            dataset = target.dataset;

        if (classlist.contains('open__window')) {
            var
                url = '/' + dataset.controller + '/' + dataset.id,
                data = get_data(url);

            if (data.ok === true) { fill_window(data, dataset.controller, dataset.id, dataset.action); }
            else { show_error(404); }
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
                edit_info_window.getElementsByTagName('h4')[0].innerText = 'Редактирование блока "' + data.header + '"';
                edit_info_window.getElementsByTagName('form')[0].action = '/' + controller + '/' + id;
                console.log('/' + controller + '/' + id);
                edit_info_window.getElementsByTagName('iframe')[0].contentDocument.body.innerHTML = data.html;
                edit_info_window.showModal();
            }
            break;
        default:
            show_error(404);
            break;
        }
    }
}