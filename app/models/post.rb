class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 5}
end
