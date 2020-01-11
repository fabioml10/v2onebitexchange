require 'spec_helper'
require 'json'
require './app/services/exchange_btc_service'

describe 'Currency_btc' do
  it 'exchange_btc' do
    amount = rand(1..9999)
    res = ExchangeBtcService.new("BTC", "BRL", amount).perform
    expect(res.is_a? Numeric).to eql(true)
    expect(res != 0 || amount == 0).to eql(true)
  end
end