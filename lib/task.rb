require_relative 'emailer'

class Task
  def run
    message = "Hello!, the time now is: #{Time.now}"

    Emailer.new.send_email(message)
  end
end