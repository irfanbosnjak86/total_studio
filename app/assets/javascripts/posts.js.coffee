# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$("#upload-image").fileupload
  add: (e, data) ->
    data.context = $("#submit-data")
    data.submit()
