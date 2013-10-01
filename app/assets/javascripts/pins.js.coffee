#Place all the behaviors and hooks 
#All this logic will automatically be available in application.js
#You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script
jQuery ->
    $('#pins').imagesLoaded ->
        $('#pins').masonry itemSelector: ".box"