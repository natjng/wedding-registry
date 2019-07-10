class Items < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :category_id
      t.integer :user_id
    end
  end
end
