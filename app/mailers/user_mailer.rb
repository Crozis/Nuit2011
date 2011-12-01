class UserMailer < ActionMailer::Base
  default :from => "nuit2011.ogc@gmail.com"
 
  def send_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site") do |format|
      format.html { render 'send_mail' }
      format.text { render :text => 'Render text' }
    end
  end
 
end