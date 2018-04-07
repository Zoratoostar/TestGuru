class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <testguru@blabla.com>}
  layout 'mailer'
end
