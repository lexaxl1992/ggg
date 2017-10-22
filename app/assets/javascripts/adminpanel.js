document.addEventListener('turbolinks:load', function () {
    document.addEventListener('click', function (event) {
        if (event.target.classList.contains('move__object')) {

            switch(event.target.text) {
                case 'arrow_back':
                case 'arrow_forward':
                    var movable = document.getElementById(event.target.dataset.for).parentNode.parentNode;
                    break;
                case 'arrow_upward':
                case 'arrow_downward':
                    var movable = document.getElementById(event.target.dataset.for);
                    break;
            }

            switch(event.target.text) {
                case 'arrow_back':
                case 'arrow_upward':
                movable.parentNode.insertBefore(movable, movable.previousElementSibling);                
                    break;
                case 'arrow_forward':
                case 'arrow_downward':
                movable.parentNode.insertBefore(movable, movable.nextElementSibling);                
                    break;
            }

            console.log(event.target.text)
            Rails.fire(document.getElementById('order_form'), 'submit');
        }
    });
});