require "dotenv"
Dotenv.load

require_relative 'emailer'
require_relative 'gold_price_checker'
require_relative 'daily_report'

class Task
  def run
    if ENV.fetch("TURN_ON_METALS_PRICE") == "true"
      price_checker = GoldPriceChecker.new
      
      gold_price = price_checker.fetch_gold_price
    else
      gold_price = "3927.239"
    end

    subject = "Daily update"
    html = DailyReport.new(gold_price: gold_price).render

    if ENV.fetch("TURN_ON_EMAILING") == "true"
      Emailer.new.send_email(subject, html)
    else
      File.write("tmp/email_preview.html", html)
    end
    
  end
end