class AddAttributesToImages < ActiveRecord::Migration
  def change
    add_column :images, :file_id, :string
    add_column :images, :file_filename, :string
    add_column :images, :file_size, :string
    add_column :images, :file_content_type, :string
  end
end
