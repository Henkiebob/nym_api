require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  tests UserMailer

  test "test_mail" do

    expected = new_mail
    expected.from    = 'info@studentschema.nl'
    expected.to      = 'tjerk.dijkstra@gmail.com'
    expected.subject = "test"
    expected.date    = Time.now

   end


  def new_mail( charset="UTF-8" )
    mail = Mail.new
    mail.mime_version = "1.0"
    if charset
      mail.content_type ["text", "plain", { "charset" => charset }]
    end
    mail
  end

end
