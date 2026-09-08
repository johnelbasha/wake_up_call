require_relative 'emailer'
require_relative 'gold_price_checker'

class Task
  def run
    welcome_message = "Hello from your Hetzner VPS!, the time now is: #{Time.now}"
    puts welcome_message

    price_checker = GoldPriceChecker.new

    gold_price = price_checker.fetch_gold_price

    message = "#{welcome_message} The price of gold is: #{gold_price} USD"

    puts message
    puts '%%%%%'

    Emailer.new.send_email(message)
    # Emailer.new.send_email('test')
  end
end