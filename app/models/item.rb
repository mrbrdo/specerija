class Item < ActiveRecord::Base
  attr_accessible :price, :title, :photo, :remote_photo_url, :photo_cache

  mount_uploader :photo, PhotoUploader
  has_many :fridge_items, :dependent => :destroy
  has_many :fridges, :through => :fridge_items

  validates :title, :presence => true, :uniqueness => true
  validates :price, :presence => true
end
