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

  def user_can_edit?(object)
    object.user == current_user
  end

  def id_friendly(s)
    s.gsub(/[\W]/, "-")
  end

  def profile_link_path(post)
    "/body_parts/#{post.topic.injury.body_part.id}/injuries/#{post.topic.injury.id}##{post.topic.name}"
  end

end
