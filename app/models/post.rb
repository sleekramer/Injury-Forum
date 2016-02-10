class Post < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :body]
  belongs_to :topic
  belongs_to :user
  has_many :favorites, as: :favoriteable, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :feed_items, as: :trackable, dependent: :destroy


  alias_attribute :name, :title
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 5}

  def update_score
    new_score = votes.inject(0){|sum, vote| sum += vote.value} + (1 - (1.0 / votes.count))
    update_attribute(:score, new_score)
  end

end
