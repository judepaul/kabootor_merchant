Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'welcome/index'
  root 'welcome#index'
  
  get 'dashboard/index'
  match 'create/video', to: 'recording#start', via: :get

  match 'create/exploring/start',  to: "opentok#start", via: :post
  match '/stop/:archive_id',  to: "opentok#stop", via: :get
  match '/opentok/upload_response', to: "opentok#upload_response", via: :post
  # match '/check_upload_url_status/:archive_id',  to: "opentok#check_upload_url_status", via: :get
  match '/check_upload_url_status',  to: "opentok#check_upload_url_status", via: :post
  
  get 'video/index'
  match '/create/video/poster_image', to: "video#poster_image", via: :post
  match 'customers/visitor/create', to: "video#visitor_new_customer", as: "visitor_new_customer", via: :post
  
  match 'create/video/visitor/', to: "video#visitor_video_details", via: :post
  
  devise_for :users, controllers: { registrations: "registrations", confirmations: 'confirmations' }, path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unblock', sign_up: 'register', sign_out: 'signout'}
  
  
  resources :contacts
  resources :customers
  
end
