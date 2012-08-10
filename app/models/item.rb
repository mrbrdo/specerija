class Item < ActiveRecord::Base
  attr_accessible :price, :title

  has_many :fridge_items, :dependent => :destroy
  has_many :fridges, :through => :fridge_items

  validates :title, :presence => true
  validates :price, :presence => true
end
