Rails.application.routes.draw do
  root 'home#homepage'
  resources :movies, only: [:new, :create, :edit,:update] do
    member do
      get :bookings
    end
  end
  resources :admin,only: [:index]
  resources :signups, only: [:new,:create,:edit,:update]

  resources :shows, only: [:new,:create,:edit,:update,:show] do
      resources :bookings
  end

  get 'home/index'
  resources :ticket_history, only: [:index]
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

end
