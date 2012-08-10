class FridgeItem < ActiveRecord::Base
  attr_accessible :item_id, :quantity

  belongs_to :fridge
  belongs_to :item

  validates :quantity, :inclusion => { :in => (1..1000), :message => "Quantity must be between 1 and 1000." }
  validates :item_id, :presence => true # namesto tega lahko v DB :null => false
  validates :fridge_id, :presence => true
  validates :item_id, :uniqueness => { :scope => :fridge_id,
    :message => "Can only have one association between fridge and item." }
end
