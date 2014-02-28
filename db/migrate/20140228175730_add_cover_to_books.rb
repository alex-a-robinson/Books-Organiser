class AddCoverToBooks < ActiveRecord::Migration
  def change
    add_column :books, :img_name, :string
    add_column :books, :img_data, :binary
    add_column :books, :img_filename, :string
    add_column :books, :img_mime_type, :string
  end
end
