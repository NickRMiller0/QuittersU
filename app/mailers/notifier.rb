class Notifier < ActionMailer::Base
  default from: "nick@QuittersU.com"

    default :from => 'nick@QuittersU.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    @url = 'http://www.QuittersU.com'
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

end
