document.addEventListener('turbolinks:load', function () {
    document.addEventListener('click', function (event) {
        if (event.target.classList.contains('move__object')) {
            var movable;

            switch (event.target.text) {
            case 'arrow_back':
            case 'arrow_forward':
                movable = document.getElementById(event.target.dataset.for).parentNode.parentNode;
                break;
            case 'arrow_upward':
            case 'arrow_downward':
                movable = document.getElementById(event.target.dataset.for);
                break;
            }

            switch (event.target.text) {
            case 'arrow_back':
            case 'arrow_upward':
                movable.parentNode.insertBefore(movable, movable.previousElementSibling);
                break;
            case 'arrow_forward':
            case 'arrow_downward':
                movable.parentNode.insertBefore(movable, movable.nextElementSibling.nextElementSibling);
                break;
            }

            Rails.fire(document.getElementById('order_form'), 'submit');
        }
    });
    tinymce.remove();
    tinymce.init();
});

function change_id() {
    event.target.href = '/images/' + document.getElementsByClassName('slick-current')[0].getElementsByTagName('img')[0].dataset.id;
}