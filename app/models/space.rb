class Space < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, dependent: :destroy
  has_many :tenant_responses, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_numericality_of :size, :zipcode, :only_integer => true, :greater_than_or_equal_to => 1, :unless => lambda{ |a| a.email.blank? }
  validates_presence_of :title, :price, :size, :zipcode, :email
  validates :email, :email_format => true, :unless => lambda{ |a| a.email.blank? }

  default_scope -> { where(active: true).order("created_at DESC") }

  before_create :assign_removal_url
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

  def assign_removal_url
    generate_removal_url
    until Space.where(removal_token: self.removal_token).blank?
      generate_removal_url
    end
  end

  private

  def notify_user_with_email
    UserMailer.delay.upload_success(self)
  end

  def generate_removal_url
    self.removal_token = SecureRandom.urlsafe_base64(8).gsub('-','').gsub('_','')
  end


end

# == Schema Information
#
# Table name: spaces
#
#  id            :uuid             not null, primary key
#  title         :string(255)
#  price         :integer
#  size          :integer
#  description   :text
#  address       :string(255)
#  zipcode       :integer
#  email         :string(255)
#  active        :boolean          default(TRUE)
#  created_at    :datetime
#  updated_at    :datetime
#  slug          :string(255)
#  images_count  :integer          default(0)
#  removal_token :string(255)
#
