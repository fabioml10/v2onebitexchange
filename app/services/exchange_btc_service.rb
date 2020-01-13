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
      # header = x-ba-key
      key = "NDc1MmE3NTIxNjczNGM0NTg0YTA5N2ZjYmJiYTFiZmQ"
      url = "https://apiv2.bitcoinaverage.com/convert/global?from=#{@source_currency}&to=#{@target_currency}&amount=#{@amount}"
      res = RestClient.get(url, :'x-ba-key' => key)
      value = JSON.parse(res.body)['price'].to_f
      
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
