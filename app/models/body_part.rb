class BodyPart < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name]
  has_many :injuries

  validates :name, presence: true, length: {minimum: 3}
end
