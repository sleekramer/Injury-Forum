class AddDescriptionToInjuries < ActiveRecord::Migration
  def change
    add_column :injuries, :description, :text
  end
end
