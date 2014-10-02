class UserMailer < ActionMailer::Base
  default from: "noreply@sublet.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.upload_success.subject
  #
  def upload_success(space)
    @space = space
    @email = space.email
    mail to: @email, subject: "Thank you for posting the space."
  end

  def tenant_response_received(owner_email, tenant_response, space)
    @tenant_email = tenant_response.email
    @owner_email = owner_email
    @tenant_response = tenant_response
    @space = space
    mail to: owner_email, subject: "#{@tenant_email} is Interested in your space", reply_to: @tenant_response
  end

  def send_email_new_space_request(space_request)
    @space_request = space_request
    @space_requester_email = space_request.email
    mail to: ENV["ADMIN_EMAIL"], subject: "Space request received from #{@space_requester_email} ", reply_to: @space_requester_email
  end

end
