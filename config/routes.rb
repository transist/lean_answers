Lsm::Application.routes.draw do

  devise_for :users
  devise_scope :user do
    get 'signin', to: 'devise/sessions#new'
  end

  get 'admin' => 'admin#index'
  match 'search' => 'home#search'
  match 'settings' => 'users#edit'

  resources :surveys do
    resources :questions do
      resources :choices do
        resources :answers
      end
      resources :answers
    end
  end
  resources :studies

  resources :users, only: [:update]
  resources :projects do
    resources :memberships do
      member do
        get 'edit' => 'memberships#edit', as: 'edit'
        get ':state' => 'memberships#edit', as: 'change'
      end
    end
    resources :assumptions do
      member do
        get 'edit' => 'assumptions#edit', as: 'edit'
        get ':state' => 'assumptions#edit', as: 'change'
      end
    end
    resources :scorecards do
      member do
        get 'edit' => 'scorecards#edit', as: 'edit'
        get ':state' => 'scorecards#edit', as: 'change'
      end
    end
    resources :experiments do
      member do
        get 'edit' => 'assumptions#edit', as: 'edit'
        get ':state' => 'assumptions#edit', as: 'change'
      end
    end
    resources :hypotheses do
      member do
        get 'edit' => 'hypotheses#edit', as: 'edit'
        get ':state' => 'hypotheses#edit', as: 'change'
      end
    end
    resources :studies
    resources :documents
    resources :tasks
    resources :customer_hypotheses
    resources :problem_hypotheses
    resources :solution_hypotheses
  end

  root to: 'home#index'
end
