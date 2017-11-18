//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require turbolinks
//= require jquery.slick
//= require photoswipe
//= require ./mdl_handler
//= require_tree ./lib
//= require_tree ./modules

document.addEventListener('turbolinks:load', function () {
    componentHandler.upgradeDom(); def_sliders(); def_accordion();
    def_scroll(); def_photoswipe(); def_modal(); aload();
    tinymce.remove();
    tinymce.init(config);
});