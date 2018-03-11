module ApplicantsHelper
  def inline_errors(errors, field_name)
    content_tag(:span, 
      field_name.to_s.humanize + " " + errors[field_name].join(", ") + ".", 
      class: 'error-field') if errors[field_name].present?
  end
end
