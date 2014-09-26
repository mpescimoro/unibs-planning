# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'Nessun risultato trovato'
    width: '350px'

  $('#course_id').chosen().change ->
    $('#course_form').submit()
    $('#course_id').prop('selectedIndex', 0)
    $('#course_id').trigger('chosen:updated')
