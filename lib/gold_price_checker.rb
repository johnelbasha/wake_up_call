# require "net/http"
require 'faraday'
require "json"
# require "uri"

class GoldPriceChecker
  def fetch_metal_rates
    api_key = ENV.fetch("METALS_DEV_API_KEY")
    url = "https://api.metals.dev/v1/metal/spot"
    
    response = Faraday.get(
      url,
      {
        api_key: api_key,
        metal: "gold",
        currency: "USD"
      }
    )

    puts response.status
    puts response.body

    JSON.parse(response.body)
  end

  def fetch_gold_price
    data = fetch_metal_rates
    data["rate"]["price"]
  end
end