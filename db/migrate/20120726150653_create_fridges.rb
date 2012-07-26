class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.string :name
      t.string :location
      t.integer :capacity

      t.timestamps
    end
    
    add_column :items, :fridge_id, :integer
  end
end
