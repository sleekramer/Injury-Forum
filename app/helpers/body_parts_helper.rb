module BodyPartsHelper

  def should_be_selected(symptom, injury)
    injury.symptoms.include?(symptom) ? {selected: "selected"} : symptom.id
  end

end
