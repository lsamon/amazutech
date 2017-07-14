class ApplicationMailer < ActionMailer::Base
  default from: 'webmaster@amazutech.net', to: 'info@amazutech.net'
  layout 'mailer'
end
