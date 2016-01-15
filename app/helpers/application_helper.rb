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

  def link_for_object(object)
    klass = object.class.to_s
    if klass == "BodyPart"
      link_to object.name, object
    elsif klass == "Injury"
      link_to object.name, [object.body_part, object]
    elsif klass == "Activity"
      object.name
    elsif klass == "Post"
      link_to object.name, profile_link_path(object)
    end
  end

  def user_vote?(post)
    vote = current_user.votes.where(post: post) ? vote : current_user.votes.new(post: post)
  end

  def disable?(post, value)
    if current_user && post.votes.pluck(:user_id, :value).include?([current_user.id, value])
      'disabled'
    end
  end
end
