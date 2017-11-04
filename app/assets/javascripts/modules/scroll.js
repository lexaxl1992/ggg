function def_scroll() {
    $('.scrollLink').on('click', function (event) {
        $.smoothScroll({
            scrollElement: $('main'),
            scrollTarget: $('#' + event.currentTarget.id.substring(3))
        });
        return false;
    });
}