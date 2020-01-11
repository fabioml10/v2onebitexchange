require 'rails_helper'

RSpec.describe "Exchange_Btc Currency Process", :type => :system, js: true do
  it "exchange_btc value" do
    visit '/exchanges_btc/index'
    within("#exchange_form") do
      select('BTC', from: 'source_currency')
      select('BRL', from: 'target_currency')
      fill_in 'amount', with: rand(1..9999)
    end
    click_button 'CONVERTER'

    # save_and_open_page
    expect(page).to have_content("value")
  end
end