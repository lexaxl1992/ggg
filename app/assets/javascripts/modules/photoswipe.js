function def_photoswipe() {

    var options = {
        "history": false
    };

    var windowID, pswpElement = document.querySelectorAll('.pswp')[0], gallery_items;
    var slideDownloadButton = new Vue({
        el: '#download-slide',
        data: {
            slideURL: 'none'
        }
    });

    document.addEventListener('click', function (event) {
        if (event.target.classList.contains('open--gallery')) {
            var itemID = event.target.dataset.itemId;
            windowID = 'show_item_' + itemID;
            gallery_items = JSON.parse(document.getElementById('gallery_' + itemID).dataset.json);
            options.index = parseInt(event.target.dataset.imageId, 10);
            var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, gallery_items, options);
            document.getElementById(windowID).close();
            gallery.init();
            slideDownloadButton.slideURL = gallery.currItem.src;

            gallery.listen('close', function () {
                if (document.documentElement.clientWidth > 1024) {
                    document.getElementById(windowID).showModal();
                } else {
                    document.getElementById(windowID).show();
                }
            });

            gallery.listen('afterChange', function () {
                slideDownloadButton.slideURL = gallery.currItem.src;
            });
        }
    });
}
