# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Mail.defaults do
delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                         :port      => 587,
                         :domain    => "fenec.com.br",
                         :user_name => ENV["sendgrid_username"],
                         :password  => ENV["sendgrid_password"],
                         :authentication => 'plain',
                         :enable_starttls_auto => true }
end
