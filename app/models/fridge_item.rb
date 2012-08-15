class FridgeItem < ActiveRecord::Base
  attr_accessible :item_id, :quantity, :item_attributes

  belongs_to :fridge
  belongs_to :item

  # accepts_nested_attributes_for :item
  def item_attributes=(attrs)
    if attrs[:id].present?
      item.update_attributes(attrs) if attrs[:id].to_i == item.try(:id)
      self.item = Item.find(attrs[:id])
    else
      build_item(attrs)
    end
  end

  validates :quantity, :inclusion => { :in => (1..1000), :message => "Quantity must be between 1 and 1000." }
  validates :fridge_id, :presence => true # namesto tega lahko v DB :null => false
  validates :item_id, :uniqueness => { :scope => :fridge_id,
    :message => "Can only have one association between fridge and item." }
  
  # item must exist
  validate do |fridge_item|
    unless fridge_item.item.valid?
      errors.add(:base, "Item must be valid")
    end
  end
end
