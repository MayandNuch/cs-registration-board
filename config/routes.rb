Rails.application.routes.draw do

  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :student do
    get "/login" => "devise/sessions#new"
  end

  resources :students
  resources :teachers

  root to: 'students#index'
  get '/students' => 'students#index'
  get 'students/:id' => 'students#show'
  # get 'teachers' => 'teachers#index'
  # get 'teachers/:id' => 'teachers#show'

end
