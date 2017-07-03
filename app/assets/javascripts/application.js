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

function some_elems_init(){
	componentHandler.upgradeDom()
	$('#slider').slick({ dots: true })
	$('#catalogue').collapsible()
	adapt_header()
	owl_bind()
	aload()
}

document.addEventListener('turbolinks:load', some_elems_init)
