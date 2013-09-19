# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.chosen-select').chosen
    width: '200px'
    create_option: true,
    # // persistent_create_option decides if you can add any term, even if part
    # // of the term is also found, or only unique, not overlapping terms
    persistent_create_option: true,
    # // with the skip_no_results option you can disable the 'No results match..'
    # // message, which is somewhat redundant when option adding is enabled
    skip_no_results: true