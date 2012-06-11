$ ->
  setupButtons = ->
    $('button[type=submit]').button({
      icons: {primary: 'ui-icon-check'}
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
  setupButtons()

  $('.add-option-btn').click( ->
    setupButtons()
  )

  # Unset the other checkboxes
  $('input[name="event[selected_option_id]"]').click(
    (event) ->
      shouldBeChecked = event.target.checked
      $('input[name="event[selected_option_id]"]').prop("checked", false)
      $(event.target).prop("checked", shouldBeChecked)
  )