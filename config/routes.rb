Rails.application.routes.draw do
  resources :posts do
    resources :comments, controller: "posts/comments"
  end

  root "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
