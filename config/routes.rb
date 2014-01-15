Rehttp::Application.routes.draw do
  get 'requests/index'
  get 'requests/:request_id', :to => 'requests#show'
end
