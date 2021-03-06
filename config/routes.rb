Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config.merge(path: :profile)
  ActiveAdmin.routes(self)

  scope "/api/v1" do
    resources :exercises, module: "api"
    resources :users, module: "api" do
      resources :workouts do
        resources :single_sets
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
