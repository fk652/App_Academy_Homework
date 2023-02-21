class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.username, subject: 'Welcome to My Meowesome Site')
  end
end
