require "resend"
require "dotenv"
Dotenv.load

class Emailer
  def send_email(subject, message)
    Resend.api_key = ENV.fetch("RESEND_API_KEY")
    to_address = ENV.fetch("TO_EMAIL_ADDRESS")
    from_address = ENV.fetch("FROM_EMAIL_ADDRESS")

    r = Resend::Emails.send({
      "from": from_address,
      "to": to_address,
      "subject": subject,
      "html": message
    })
  end
end