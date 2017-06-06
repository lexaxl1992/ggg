/*
*= require jquery
*= require jquery.turbolinks
*= require rails-ujs
*= require turbolinks
*= require modernizr
*= require ./mdl/main
*  require ./materialize/animation
*  require ./materialize/global
*  require ./materialize/carousel
*  require ./materialize/collapsible
*  require ./materialize/dropdown
*= require ./materialize.min
*  require_tree ./snippets
*/

function someElemsInit(){
	$('.carousel.carousel-slider').carousel({fullWidth: true})
	$('.collapsible').collapsible()
}

$(document).ready(someElemsInit)
document.addEventListener('turbolinks:load', function(){ componentHandler.upgradeDom(); someElemsInit() });
$.turbo.use('turbolinks:load', 'turbolinks:request-start');
