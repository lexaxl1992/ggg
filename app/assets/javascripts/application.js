/*
*= require jquery
*= require jquery.turbolinks
*= require rails-ujs
*= require turbolinks
*= require modernizr
*= require jquery.slick
*  require jquery.mousewheel
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
	componentHandler.upgradeDom()
	$('.collapsible').collapsible()
	$('#slider').slick({ dots: true })
}

$(document).ready(someElemsInit)
document.addEventListener('turbolinks:load', someElemsInit)
document.addEventListener('turbolinks:before-cache', someElemsInit)
//$.turbo.use('turbolinks:load', 'turbolinks:request-start');
