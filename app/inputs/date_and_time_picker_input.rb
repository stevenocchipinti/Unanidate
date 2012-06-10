class DateAndTimePickerInput < Formtastic::Inputs::DatetimePickerInput
  def to_html
    input_wrapping do
      label_html <<
      builder.text_field(method, input_html_options) <<
      builder.hidden_field(:_destroy) <<
      builder.button("Remove", :class => "remove-option-btn", :type => :button) <<
      selected_radio_button(builder)
    end
  end
  def input_html_options
    super.reject { |k, v| [:min, :max, :step].include?(k) }
  end
  def wrapper_html_options
    super.merge(:class => "#{super[:class]} special-class" )
  end
  def selected_radio_button(builder)
    element =
      "<input " <<
      "#{"checked='checked'" if builder.object.selected?}" <<
      "name='event[selected_option_id]' " <<
      "type='radio' " <<
      "value='#{builder.object.id}'/>"
    element.html_safe
  end
end
