include GlobalVariables

body_parts = ["Foot & Heel", "Ankle", "Lower Leg", "Knee", "Thigh", "Hip & Groin", "Abdomen", "Lower Back", "Upper Back", "Chest", "Shoulder", "Arm", "Elbow", "Wrist", "Hand", "Neck", "Head & Face", "General Conditions" ]

18.times do |i|
  unless BodyPart.where(name: body_parts[i]) != []
    BodyPart.create!(name: body_parts[i])
  end
end

GlobalVariables::SYMPTOMS.each do |symptom|
  unless Symptom.where(name: symptom).count > 0
    Symptom.create!(name: symptom)
  end
end

puts "Finished."
puts "#{BodyPart.count} body parts in database"
puts "#{Symptom.count} symptoms in database"
