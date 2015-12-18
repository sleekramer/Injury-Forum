class InjurySymptom < ActiveRecord::Base
  belongs_to :injury
  belongs_to :symptom
end
