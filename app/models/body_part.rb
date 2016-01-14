class BodyPart < ActiveRecord::Base
  has_many :injuries
  searchkick
  validates :name, presence: true, length: {minimum: 3}
end
