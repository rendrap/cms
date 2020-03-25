Rails.application.routes.draw do

  # get 'subjects/index'
  # get 'subjects/show'
  # get 'subjects/new'
  # get 'subjects/edit'
  # get 'subjects/delete'

  # simple routes
  # get 'demo/index'

  # default routes
  # get ':controller(/:action(/:id))'

  root 'demo#index'

  resources :subjects do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
