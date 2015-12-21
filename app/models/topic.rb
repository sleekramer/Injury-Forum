class Topic < ActiveRecord::Base
  belongs_to :injury
  validates :name, presence: true
end
