/*
*= require jquery
*  require jquery.turbolinks
*= require rails-ujs
*  require turbolinks
*= require modernizr
*= require jquery.slick
*  require jquery.mousewheel
*= require ./mdl/main
*= require ./materialize/jquery.easing.1.3
*= require ./materialize/collapsible
*= require_tree ./snippets
*/

function someElemsInit(){
	componentHandler.upgradeDom()
	$('.collapsible').collapsible()
	$('#slider').slick({ dots: true, prevArrow: false, nextArrow: false })
	itemSliderInit()
}

$(document).ready(someElemsInit)
//document.addEventListener('turbolinks:load', someElemsInit)
//document.addEventListener('turbolinks:before-cache', someElemsInit)
//$.turbo.use('turbolinks:load', 'turbolinks:request-start');
