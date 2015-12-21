module BodyPartsHelper
  def injury_capitalized(injury)
    injury.name.split.map {|s| s.capitalize }.join(" ")
  end
  def should_be_selected(symptom, injury)
    injury.symptoms.include?(symptom) ? {selected: "selected"} : symptom.id
  end

end
