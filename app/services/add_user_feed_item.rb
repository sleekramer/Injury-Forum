class AddUserFeedItem
  def self.call(user, action, trackable)
    FeedItem.create!(user: user, action: action.sub(/e?$/, "ed"), trackable: trackable)
  end
end
