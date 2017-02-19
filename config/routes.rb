Rails.application.routes.draw do
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  devise_scope :student do
    get "/login" => "devise/sessions#new"
  end
  root to: 'students#index'
  get '/students' => 'students#index'
  get 'students/:id' => 'students#show'

end
