// jshint esversion: 6

function bind_gallery() {
    let options = {
        "index": 0, // start at first slide
        "history": false
    };

    let windowID, pswpElement = document.querySelectorAll('.pswp')[0], gallery_items, slideURL;
    let slideDownloadButton = new Vue({
        el: '#download-slide',
        data: {
            slideURL: slideURL
        }
    });

    document.addEventListener('click', (event) => {
        if (event.target.classList.contains('open--gallery')) {
            let itemID = event.target.dataset.itemId;
            windowID = 'show_item_' + itemID;
            gallery_items = JSON.parse(document.getElementById('slider_' + itemID).dataset.json);
            let gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, gallery_items, options);
            document.getElementById(windowID).close();
            gallery.init();
            slideURL = gallery.currItem.src;

            gallery.listen('close', () => {
                if (document.documentElement.clientWidth > 1024) {
                    document.getElementById(windowID).showModal();
                } else {
                    document.getElementById(windowID).show();
                }
            });

            gallery.listen('afterChange', () => {
                slideDownloadButton.slideID = gallery.currItem.src;
            });
        }
    });

}
