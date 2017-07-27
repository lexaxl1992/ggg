//= require rails-ujs
//= require_tree ./vue
//= require jquery
//= require jquery.turbolinks
//= require turbolinks
//= require_tree ./polyfills
//= require jquery.slick
//= require ./mdl/main
//= require ./materialize/jquery.easing.1.3
//= require ./materialize/collapsible
//= require_tree ./init

document.addEventListener('turbolinks:load', function() {
	componentHandler.upgradeDom()
	init_sliders()
	init_collapsible()
	init_modalPolyfills()
	bind_ajaxReport()
	//aload()
})
