# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send

# Don't care if the mailer can't send
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_url_options = { :host =>"192.168.1.41:3000" }
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address        => "smtp.gmail.com",
    :port           => 587,
    :domain         => "gmail.com",
    :user_name      => "sobin050291@gmail.com",
    :password       => "sunny050291",
    :authentication => :plain
}