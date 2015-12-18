class Injury < ActiveRecord::Base
  belongs_to :user
  belongs_to :body_part

  validates :name, presence: true, length: {minimum: 10}, uniqueness: true
  validates :description, presence: true, length: {minimum: 30}
end
