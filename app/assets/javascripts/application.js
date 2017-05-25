/*
*= require jquery
*= require jquery_ujs
*= require rails-ujs
*= require turbolinks
*= require modernizr
*= require jquery.mCustomScrollbar
*= require mdlComponentHandler
*= require_tree ./mdl
*= require ./modules/jcarousel
*= require ./modules/carouselInit
*/

document.addEventListener('turbolinks:load', function() {
  componentHandler.upgradeDom();
});