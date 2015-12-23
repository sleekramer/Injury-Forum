class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.references :injury, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
