require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "upload_success" do
    mail = UserMailer.upload_success
    assert_equal "Upload success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
