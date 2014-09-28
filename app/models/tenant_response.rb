class TenantResponse < ActiveRecord::Base

  belongs_to :space

  validates_presence_of :email, :description
  validates :email, :email_format => true

  after_commit :send_email_to_space_owner, on: :create

  #  ===================
  #  = Private Methods =
  #  ===================

  private

    def send_email_to_space_owner
      owner_email = self.space.email
      UserMailer.tenant_response_received(owner_email, self).deliver
    end
end

# == Schema Information
#
# Table name: tenant_responses
#
#  id          :integer          not null, primary key
#  space_id    :integer
#  email       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
