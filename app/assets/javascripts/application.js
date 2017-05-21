/*
*= require jquery
*= require jquery_ujs
*= require rails-ujs
*= require turbolinks
*= require modernizr
*= require jquery.mCustomScrollbar
*= require mdlComponentHandler
*= require_tree ./mdl
*= require_tree ./modules
*/

document.addEventListener('turbolinks:load', function() {
  componentHandler.upgradeDom();
});