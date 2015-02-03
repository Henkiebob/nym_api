class UserMailer < ActionMailer::Base

  default from: "info@studentschema.nl"

  def welcome_email(user, house, creator)

    @user     = user
    @house    = house
    @creator  = creator
    @url      = 'www.studentschema.nl'
    mail(to: @user.email, subject: 'Je bent uitgenodigd voor Not Your Mom')
  end

  def test_mail
      mail(to: 'tjerk.dijkstra@gmail.com', subject:'test')
  end

end
