class NotificationMailer < ActionMailer::Base
  default from: "backend@x-team.com"

  
  def send_signup_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Thank you for signing up for Shopping List")
  end

  def new_item(item)
    recipients = User.admins.collect(&:email).join(',')
    @item = item
    mail( subject: "New item added to list!", to: recipients)
  end
end
