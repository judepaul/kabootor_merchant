require 'net/smtp'

if $mailcatcher_enabled
  begin
    smtp = Net::SMTP.start "localhost", 1025
    if smtp.started?
      smtp.quit
      puts ">> WARNING: Found an SMTP server on port 1025"
      puts "            Assuming that it is MockSMTP or MailCatcher..."
      puts ">> Emails WILL be sent to the SMTP server on port 1025"

      # config.action_mailer.delivery_method = :smtp
      ActionMailer::Base.smtp_settings = {
        :address => "localhost",
        :port => 1025
      }
    end
  rescue Errno::ECONNREFUSED
    puts ">> No SMTP server found on port 1025"
    puts ">> Emails will be sent to STDOUT"
  end
end