// Ref: http://stackoverflow.com/questions/2678009/how-to-add-and-remove-nested-model-fields-dynamically-using-haml-and-formtastic

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parent(".nested_fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
