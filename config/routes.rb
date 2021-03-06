Rails.application.routes.draw do

  devise_for :admins
  devise_for :teachers, :controllers => {:registrations => "teachers/registrations"}
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # namespace :students do
  #   resources :course, only: [:index]
  # end
  #
  # namespace :admin do
  #   resources :course, only: [:index,:edit,:update]
  # end

  devise_scope :student do
    get "/login" => "devise/sessions#new"
  end

  resources :students
  resources :teachers
  resources :courses,          only: [:create, :destroy]
  resources :comment,          only: [:destroy]

  resources :courses do
    member do
      put :add_student
      put :delete_student
      put :update_course
    end
  end

  resources :comment do
    member do
      post :create
    end
  end

  resources :teachers do
    member do
      put :update_teacher
    end
  end

  root to: 'courses#index'
  get 'students/:id' => 'students#show'
  get 'teachers/:id' => 'teachers#show'
  get 'courses' => 'courses#index'
  get 'courses/:id' => 'courses#show'
  get 'admins' => 'admins#index'
  get 'admins/manage_courses' => 'admins#manage_courses'
  get 'admins/manage_instructors' => 'admins#manage_instructors'
  get 'admins/manage_courses/edit_course/' => 'admins#edit_course'
  get 'admins/manage_courses/edit_instructor/' => 'admins#edit_instructor'



  resources :admins do
    member do
      get :edit_instructor
      get :edit_course
    end
  end
end
