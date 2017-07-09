//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require_tree ./polyfills
//= require jquery.slick
//  require jquery.mousewheel
//= require ./mdl/main
//= require ./materialize/jquery.easing.1.3
//= require ./materialize/collapsible
//= require_tree ./snippets
//= require turbolinks

document.addEventListener('turbolinks:load', function() {
	componentHandler.upgradeDom()
	$('#slider').slick({ dots: true })
	$('#catalogue').collapsible()
	bind_carousel()
	bind_adaptivity()
	bind_polyfills()
	bind_modal()
	aload()
})
