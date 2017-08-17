Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'welcome/index'
  root 'welcome#index'
  
  match 'create/video', to: 'dashboard#start_exploring', via: :get
  match 'create/exploring/start',  to: "opentok#start", via: :post
  
  
  
  resources :contacts
  
end
