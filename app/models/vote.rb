class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :feed_items, as: :trackable, dependent: :destroy

  validates :value, presence: true, inclusion: {in: [-1,1], message: "%{value} is not a valid vote." }
end
