class RenameColumnItemNameToName < ActiveRecord::Migration
  def change
    rename_column :items, :item_name, :name
  end
end
