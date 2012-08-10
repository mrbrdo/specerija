class Fridge < ActiveRecord::Base
  attr_accessible :capacity, :location, :name

  has_many :fridge_items, :dependent => :destroy
  has_many :items, :through => :fridge_items

  validates :name, :presence => true
end
