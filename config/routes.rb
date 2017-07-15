Rails.application.routes.draw do
  resources :categories

  resources :companies do
    resources :jobs do
      resources :comments
    end
  end

end
