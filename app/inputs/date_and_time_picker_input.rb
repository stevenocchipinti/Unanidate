class DateAndTimePickerInput < Formtastic::Inputs::DatetimePickerInput

  def to_html
    input_wrapping do

      label_html <<
      builder.text_field(method, input_html_options) <<
      builder.hidden_field(:_destroy) <<
      builder.button(
        "Remove",
        :class => "remove-option-btn",
        :type => :button
      ) <<
      selected_radio_button(builder, "Selected")
    end
  end

  def input_html_options
    super.reject { |k, v| [:min, :max, :step].include?(k) }
  end

  def wrapper_html_options
    super.merge(:class => "#{super[:class]} special-class" )
  end

  def selected_radio_button(builder, label)
    button_inner_html =
      "<input " <<
      "#{"checked='checked'" if builder.object.selected?}" <<
      "name='event[selected_option_id]' " <<
      "type='checkbox' " <<
      "class='ui-button-icon-primary ui-icon ui-icon-close' " <<
      "id='radio_#{builder.object.id}' " <<
      "value='#{builder.object.id}'/>" <<
      "<span class='ui-button-text'>#{label}</span>"

    label_html =
      "<label " <<
        "for='radio_#{builder.object.id}' " <<
        "name='button' " <<
        "class='selected-btn ui-button ui-widget ui-state-default " <<
          "ui-corner-all ui-button-text-icon-primary' " <<
        "role='button' " <<
        "aria-disabled='false'>#{button_inner_html}</label>"

    label_html.html_safe
  end

end
