$ ->
  setupButtons = ->
    $('button[type=submit]').button({
      icons: {primary: 'ui-icon-check'}
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
