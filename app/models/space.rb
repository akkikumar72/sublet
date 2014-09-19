class Space < ActiveRecord::Base

  has_many :images

  validates_numericality_of :size, :zipcode, :only_integer => true, :greater_than_or_equal_to => 1
  validates_presence_of :title, :price, :size, :zipcode, :email

end
