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
    "/body_parts/#{post.topic.injury.body_part.id}/injuries/#{post.topic.injury.id}##{id_friendly(post.topic.name)}"
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

  def display_feed_item(feed_item)
    klass = feed_item.trackable.class.to_s
    if klass == "Post"
      (" created a new Post titled '" + (link_to( feed_item.trackable.title ,profile_link_path(feed_item.trackable))).html_safe + "' in the #{feed_item.trackable.topic.injury.name} #{feed_item.trackable.topic.name.downcase} thread").html_safe
    elsif klass == "Injury"
      (" created the #{link_to feed_item.trackable.name, body_part_injury_path(feed_item.trackable.body_part, feed_item.trackable)} discussion").html_safe
    elsif klass == "Vote"
      (" voted the post '" + link_to(feed_item.trackable.post.title, profile_link_path(feed_item.trackable.post)) + "' #{feed_item.trackable.value == 1 ? "helpful" : "unhelpful"}").html_safe
    end
  end

  def feed_item_glyphicon(item)
    klass = item.class.name
    if klass == "Vote"
      item.value == 1 ? klass = "helpful" : klass = "unhelpful"
    end
    {"Post" => "glyphicon-comment", "Injury" => "glyphicon-list-alt", "helpful" => "glyphicon-chevron-up", "unhelpful" => "glyphicon-chevron-down" }[klass]
  end
  def a_or_an(string)
      %(a e i o u).include?(string[0].downcase) ? "an " + string : "a " + string
  end
end
