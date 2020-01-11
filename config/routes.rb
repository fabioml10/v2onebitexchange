Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
  get 'convert_btc', to: 'exchanges_btc#convert'
end
