RSpec.configure do |config|
  config.before(:each) do   
    stub_request(:get, /apiv2.bitcoinaverage.com/ )
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "success": true,
        "time": "14-04-2016 13:55:32",
        "price": 424.93
      }', headers: {})
  end
end