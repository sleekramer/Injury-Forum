class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.references :user, index: true, foreign_key: true
      t.string :action
      t.references :trackable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
