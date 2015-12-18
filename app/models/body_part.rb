class BodyPart < ActiveRecord::Base
  has_many :injuries
  validates :name, presence: true, length: {minimum: 3}
end
