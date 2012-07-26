class Item < ActiveRecord::Base
  attr_accessible :price, :title

  belongs_to :fridge
end
