class RemoveImgNameFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :img_name, :string
  end
end
