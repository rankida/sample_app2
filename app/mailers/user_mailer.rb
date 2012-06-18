class UserMailer < ActionMailer::Base
  default from: "David Rankin<Rankida@gmail.com>"

  def registration_confirmation(user)
    @user = user
    to = "#{user.name} <#{user.email}>"
    mail(to: to, subject: "Thanks for registering")
  end
end
