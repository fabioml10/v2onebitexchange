require 'rest-client'
require 'json'

class ExchangeBtcService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end
 
  def perform
    begin
      url = "https://apiv2.bitcoinaverage.com/convert/global?from=#{@source_currency}&to=#{@target_currency}&amount=#{@amount}"
      res = RestClient.get url
      value = JSON.parse(res.body)['price'].to_f
      
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end

# p exchange_api_url = 'https://currencydatafeed.com/api/data.php'
#       p exchange_api_key = 'a1kpdyj5warenkzatf6a'