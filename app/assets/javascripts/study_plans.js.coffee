# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  # enable chosen js
  $('.chosen-select-course').chosen
    allow_single_deselect: true
    no_results_text: 'Nessun risultato trovato'
    width: '100%'

  $('.chosen-select-degree').chosen
    allow_single_deselect: true
    no_results_text: 'Nessun risultato trovato'
    width: '100%'

  $('.chosen-select-year').chosen
    allow_single_deselect: true
    no_results_text: 'Nessun risultato trovato'
    width: '100%'
    disable_search: true

  $('.chosen-select-course').chosen().change ->
    $('#course_form').submit()

  $('#degree_id').chosen().change ->
    $('#course_form').submit()

  $('#year').chosen().change ->
    $('#course_form').submit()
