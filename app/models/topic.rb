class Topic < ActiveRecord::Base
  belongs_to :injury
  has_many :posts, dependent: :destroy
  validates :name, presence: true
end
