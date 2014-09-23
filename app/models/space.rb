# == Schema Information
#
# Table name: spaces
#
#  id          :uuid             not null, primary key
#  title       :string(255)
#  price       :integer
#  size        :integer
#  description :text
#  address     :string(255)
#  zipcode     :integer
#  email       :string(255)
#  active      :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  slug        :string(255)
#

class Space < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_numericality_of :size, :zipcode, :only_integer => true, :greater_than_or_equal_to => 1
  validates_presence_of :title, :price, :size, :zipcode, :email

  default_scope -> { where(active: true).order("created_at DESC") }
  after_commit :notify_user_with_email, on: :create




  def should_generate_new_friendly_id?
    new_record?
  end

  def mark_as_inactive
    self.active = false
    self.save
  end

  def self.find(id)
    friendly.find(id)
  end

  private

  def notify_user_with_email
    UserMailer.upload_success(self).deliver
  end

end
