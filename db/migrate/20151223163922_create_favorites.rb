class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :favoriteable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
