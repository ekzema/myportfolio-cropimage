# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {

  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "baci.lindsaar.net",
  :enable_starttls_auto => true,
  :authentication => :login,
  :user_name => "xxx.ukrain@gmail.com",
  :password => "15975321"
}