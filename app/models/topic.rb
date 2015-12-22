class Topic < ActiveRecord::Base
  belongs_to :injury
  has_many :posts
  validates :name, presence: true
end
