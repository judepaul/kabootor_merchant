Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'welcome/index'
  root 'welcome#index'
  
  match 'create/video', to: 'dashboard#start_exploring', via: :get

  match 'create/exploring/start',  to: "opentok#start", via: :post
  match '/stop/:archive_id',  to: "opentok#stop", via: :get
  match '/opentok/upload_response', to: "opentok#upload_response", via: :post
  match '/check_upload_url_status/:archive_id',  to: "opentok#check_upload_url_status", via: :get
  
  get 'video/index'
  match '/create/video/poster_image', to: "video#poster_image", via: :post
  
  resources :contacts
  
end
