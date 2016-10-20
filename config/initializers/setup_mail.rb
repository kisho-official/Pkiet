  ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "kisho.official@gmail.com",
  :password             => "mywifesumi",
  :authentication       => :plain,
  :enable_starttls_auto => true
}