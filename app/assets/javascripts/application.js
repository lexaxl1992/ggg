//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require jquery.slick
//  require jquery.mousewheel
//= require ./mdl/main
//= require ./materialize/jquery.easing.1.3
//= require ./materialize/collapsible
//= require_tree ./snippets
//= require turbolinks

function someElemsInit(){
	componentHandler.upgradeDom()
	//$('.collapsible').collapsible()
	$('#slider').slick({ dots: true, prevArrow: false, nextArrow: false })
}

document.addEventListener('turbolinks:load', someElemsInit)
