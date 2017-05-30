/*
*= require jquery
*= require jquery.turbolinks
*= require jquery_ujs
*= require rails-ujs
*= require turbolinks
*= require modernizr
*= require jquery.mCustomScrollbar
*= require mdlComponentHandler
*= require_tree ./mdl
*= require ./modules/jcarousel
*= require ./modules/carouselInit
*= require_tree ./snippets
*/

//function afterDOMinit(ev) { function() }
document.addEventListener('turbolinks:load', function() { componentHandler.upgradeDom() })
$.turbo.use('turbolinks:load', 'turbolinks:request-start')
//document.addEventListener('DOMContentLoaded', afterDOMinit, false);