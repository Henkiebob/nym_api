class UserMailer < ActionMailer::Base

  default from: "tjerkjippe@studentschema.nl"

  def welcome_email(user, house)
    @user   = user
    @house  = house
    @url    = 'localhost:3000'
    mail(to: @user.email, subject: 'Je bent uitgenodigd voor Not Your Mom')
  end

end
