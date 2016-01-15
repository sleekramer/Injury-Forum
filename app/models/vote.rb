class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, presence: true, inclusion: {in: [-1,1], message: "%{value} is not a valid vote." }
end
