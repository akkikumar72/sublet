class Space < ActiveRecord::Base

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_numericality_of :size, :zipcode, :only_integer => true, :greater_than_or_equal_to => 1
  validates_presence_of :title, :price, :size, :zipcode, :email

end
