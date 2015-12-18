module ApplicationHelper
  def bootsrap_key(key)
    {alert: "warning", notice: "success", error: "danger"}[key.to_sym]
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag(:div, capture(&block), class: 'form-group has-error')
    else
      content_tag(:div, capture(&block), class: 'form-group')
    end
  end
end
