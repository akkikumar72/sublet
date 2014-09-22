class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.upload_success.subject
  #
  def upload_success(space)
    @space = @space
    mail to: space.email, subject: "Thank you for posting the space."
  end
end
