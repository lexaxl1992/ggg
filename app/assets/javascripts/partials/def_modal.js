function def_modal() {
    'use strict';

    var
        dialogs = document.getElementsByTagName('dialog'),
        info_window = document.getElementById('info_window'),
        info_wrapper = document.getElementById('info_wrapper'),
        item_window = document.getElementById('item_info_window');

    for (var i = 0; i < dialogs.length; i += 1) {
        dialogPolyfill.registerDialog(dialogs[i]);
    }


    document.addEventListener('click', function (event) {
        var
            target = event.target,
            classlist = event.target.classList;

        if (classlist.contains('open__window')) {
            var
                url = '/' + target.dataset.controller + '/' + target.dataset.id,
                data = get_data(url);

            if (data.ok === true) { fill_window(data, target.dataset.controller); }
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


    function fill_window(data, controller) {
        switch(controller) {
        case 'infoblocks':
            info_wrapper.innerHTML = data.html;
            info_window.getElementsByTagName('h4')[0].innerText = data.header;
            info_window.showModal();
            break;
        default:
            show_error();
            break;
        }
    }
}