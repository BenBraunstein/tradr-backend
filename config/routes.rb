Rails.application.routes.draw do
  post '/login', to: "auth#login"
  get '/autologin', to: "auth#autologin"
  patch "/accept/:id", to: "trades#acceptOffer"
  patch "/decline/:id", to: "trades#declineOffer"
  patch "/nudge/:id", to: "trades#nudge"

  resources :trades
  resources :items
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
