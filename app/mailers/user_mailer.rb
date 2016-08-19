class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def account_delete_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You account has been deleted')
  end
end
