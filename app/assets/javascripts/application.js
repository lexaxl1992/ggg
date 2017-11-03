//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require turbolinks
//= require jquery.slick
//= require ./mdl/main
//= require ./materialize/jquery.easing.1.3
//= require ./materialize/collapsible
//= require photoswipe
//= require_tree ./partials

document.addEventListener('turbolinks:load', function () {
    componentHandler.upgradeDom(); def_sliders(); def_accordion();
    def_scroll(); def_photoswipe(); def_modal(); aload();
});