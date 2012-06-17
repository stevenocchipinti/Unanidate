$ ->
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
      collapsible: true
    })
  setup()

  $('.add-option-btn').click( ->
    setup()
  )

  # Unset the other checkboxes
  $('input[name="event[selected_option_id]"]').click(
    (event) ->
      shouldBeChecked = event.target.checked
      $('input[name="event[selected_option_id]"]').prop("checked", false)
      $(event.target).prop("checked", shouldBeChecked)
  )
