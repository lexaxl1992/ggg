//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require turbolinks
//= require jquery.slick
//= require ./mdl/main
//= require ./materialize/jquery.easing.1.3
//= require ./materialize/collapsible
//= require photoswipe
//= require_tree ./init

document.addEventListener('turbolinks:load', function () {
    componentHandler.upgradeDom(); init_sliders(); init_accordion();
    init_smoothScroll(); init_modalPolyfills(); bind_gallery(); bind_ajaxReports();
    bind_fadeIn(); aload();
});

function Get(url) {
    var Httpreq = new XMLHttpRequest();
    Httpreq.open("GET", url, false);
    Httpreq.send(null);
    return JSON.parse(Httpreq.responseText);
}