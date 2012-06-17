$ ->
  # Setup up JQueryUI controls
  setup = ->
    $('button[type=submit]').button({
      icons: {primary: 'ui-icon-check'}
    })
    $('.new-btn').button({
      icons: {primary: 'ui-icon-plusthick'}
    })
    $('.edit-btn').button({
      icons: {primary: 'ui-icon-pencil'}
    })
    $('.remove-option-btn').button({
      icons: {primary: 'ui-icon-close', text: false}
    })
    $('.add-option-btn').button({
      icons: {primary: 'ui-icon-plus', text: false}
    })
    $('.remove-option-btn').click(
      (eventObject) -> remove_fields(eventObject.target)
    )
    $("#accordion").accordion({
      collapsible: true,
      active: false
    })

  # Setup up JQueryUI controls on page load
  setup()

  # When the page is changed, need to re-apply the JQuery controls
  $('.add-option-btn').click( ->
    setup()
  )

  # Unset the other checkboxes when one is clicked
  # This is to get uncheckable radio button group functionality
  $('input[name="event[selected_option_id]"]').click(
    (event) ->
      shouldBeChecked = event.target.checked
      $('input[name="event[selected_option_id]"]').prop("checked", false)
      $(event.target).prop("checked", shouldBeChecked)
  )
