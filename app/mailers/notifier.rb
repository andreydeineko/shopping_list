class Notifier < ActionMailer::Base
  default from: "backend@x-team.com"

  def send_signup_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Thank you for signing up for Shopping List")
  end
end
