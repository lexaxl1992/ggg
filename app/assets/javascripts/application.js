//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require dialog-polyfill
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
	bind_owl()
	$('#catalogue').collapsible()
	adapt_header()
	aload()
})
