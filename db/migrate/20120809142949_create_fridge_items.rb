class CreateFridgeItems < ActiveRecord::Migration
  def change
    create_table :fridge_items do |t|
      t.integer :fridge_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end

    remove_column :items, :fridge_id
  end
end
