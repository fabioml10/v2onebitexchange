Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'

  get 'exchanges_btc/index', to: 'exchanges_btc#index'
  get 'convert_btc', to: 'exchanges_btc#convert'
end
