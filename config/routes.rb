Rails.application.routes.draw do
  resources :categories

  resources :companies do
    resources :contacts
    resources :jobs do
      resources :comments
    end
  end

  get 'jobs' => 'jobs#sort', as: :jobsort
  get 'dashboard' => 'jobs#dashboard', as: :jobdashboard
end
