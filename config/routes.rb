Rails.application.routes.draw do
  get 'exchanges_btc/index'
  get 'exchanges_btc/convert'
  get 'exchanges/index'
  get 'exchanges/convert'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
