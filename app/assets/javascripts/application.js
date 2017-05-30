/*
*= require jquery
*= require jquery.turbolinks
*= require rails-ujs
*= require turbolinks
*= require modernizr
*= require ./mdl/main
*= require ./materialize/global
*= require ./materialize/carousel
*= require ./materialize/dropdown
*= require_tree ./snippets
*/

//function afterDOMinit(ev) { function() }
document.addEventListener('turbolinks:load', function() { componentHandler.upgradeDom() });
$.turbo.use('turbolinks:load', 'turbolinks:request-start');
//document.addEventListener('DOMContentLoaded', afterDOMinit, false);