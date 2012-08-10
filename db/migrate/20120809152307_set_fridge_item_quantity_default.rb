class SetFridgeItemQuantityDefault < ActiveRecord::Migration
  def up
  	change_column :fridge_items, :quantity, :integer, default: 1
  end

  def down
  	change_column :fridge_items, :quantity, :integer, default: nil
  end
end
