Rails.application.routes.draw do

  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :student do
    get "/login" => "devise/sessions#new"
  end

  resources :students
  resources :teachers
  resources :courses,          only: [:create, :destroy]

  resources :courses do
    member do
      put :add_student
      put :delete_student
    end
  end

  root to: 'courses#index'
  get '/students' => 'students#index'
  get 'students/:id' => 'students#show'
  get 'teachers' => 'teachers#index'
  get 'teachers/:id' => 'teachers#show'
  get 'courses' => 'courses#index'
  get 'courses/:id' => 'courses#show'
  get 'admin' => 'admin#index'
  get 'admin/manage_courses' => 'admin#manage_courses'
  get 'admin/manage_instructors' => 'admin#manage_instructors'
end
