class ApplicationMailer < ActionMailer::Base
  default from: 'musicappadmin@example.com'

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Music Apps! Please activate your account.")
  end
end
