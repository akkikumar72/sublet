class UserMailer < ActionMailer::Base
  default from: "noreply@sublet.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.upload_success.subject
  #
  def upload_success(space)
    @space = space
    mail to: space.email, subject: "Thank you for posting the space."
  end

  def tenant_response_received(owner_email, tenant_response)
    @tenant_email = tenant_response.email
    @owner_email = owner_email
    @tenant_response = tenant_response
    mail to: owner_email, subject: "#{@tenant_email} is Interested in your space"
  end

end
