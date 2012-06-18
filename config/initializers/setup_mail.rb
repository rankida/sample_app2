ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => ENV['GMAIL_SMTP_USER'],
  :password             => ENV['GMAIL_SMTP_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000" if !Rails.env.production?
ActionMailer::Base.default_url_options[:host] = "rankida-rails-app.herokuapp.com" if Rails.env.production?

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?