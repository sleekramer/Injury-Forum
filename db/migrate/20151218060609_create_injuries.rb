class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :body_part, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
