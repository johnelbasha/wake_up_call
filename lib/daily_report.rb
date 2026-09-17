# This class is responsible for generating the html that will be given to the emailer as the message body
class DailyReport
  def initialize(gold_price:)
    @gold_price = gold_price
  end

  def render
    template = File.read(
      File.join(__dir__, "email_templates", "daily_report.html.erb")
    )

    ERB.new(template).result(binding)
  end
end