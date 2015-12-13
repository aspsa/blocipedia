if Rails.env.development?
   ActionMailer::Base.delivery_method = :smtp
   ActionMailer::Base.smtp_settings = {
       address:                 'smtp.mailgun.org',
       port:                    '587',
       authentication:          :plain,
       user_name:               ENV['MAILGUN_SMTP_LOGIN'],
       password:                ENV['MAILGUN_SMTP_PASSWORD'],
       domain:                  'App6fa4702ee5374b8ba49f8cb2b514d95a.Mailgun.Org',
       enable_starttle_auto:    true
   }
end