Rehttp::Application.routes.draw do
  get  'r/', :to => 'requests#index'
  get  'r/:rid', :to => 'requests#show', :as => 'show_request'

  get  'requests/recent', :to => 'requests#get_recent', :as => 'recent_requests'
  get  'requests/new', :to => 'requests#new', :as => 'new_request'
  post 'requests/create', :to => 'requests#create', :as => 'create_request'
  post 'requests/send_request', :to => 'requests#send_request', :as => 'send_request'

  root :to => 'requests#new'
end
