Rails.application.routes.draw do
  resources :categories 

  resources :companies do
    resources :jobs
  end

end
