class UserMailer < ActionMailer::Base
  default from: "kisho.official@gmail.com"
  def registration_confirmation(user)
    mail(:to=>user.email, :subject => "Regristration for placement is successfull")
  end
end
