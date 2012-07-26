class Fridge < ActiveRecord::Base
  attr_accessible :capacity, :location, :name

  has_many :items
end
