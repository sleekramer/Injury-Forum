class Symptom < ActiveRecord::Base
  has_many :injury_symptoms
  has_many :injuries, through: :injury_symptoms
end
