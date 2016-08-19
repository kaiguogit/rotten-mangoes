class UserMailer < ApplicationMailer
  # default from: 'git@kaiguo.cloud'
  default from: 'kaiguo1988@gmail.com'
  def account_delete_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You account has been deleted')
  end
end
