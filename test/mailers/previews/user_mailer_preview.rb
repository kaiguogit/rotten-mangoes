# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def account_delete_email
    UserMailer.account_delete_email(User.first)
  end
end
