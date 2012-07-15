module EventsHelper

  # Ref: http://stackoverflow.com/questions/2678009/how-to-add-and-remove-nested-model-fields-dynamically-using-haml-and-formtastic

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new

    fields = f.fields_for(
      association,
      new_object,
      child_index: "new_#{association}"
    ) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    button_tag(
      name,
      type: :button,
      class: "add-option-btn",
      onClick: "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"
    )
  end
end
