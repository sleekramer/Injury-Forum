class CreateInjurySymptoms < ActiveRecord::Migration
  def change
    create_table :injury_symptoms do |t|
      t.references :injury, index: true, foreign_key: true
      t.references :symptom, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
