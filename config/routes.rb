Rails.application.routes.draw do
  root 'sessions#new'
  resources :signups, only: [:new,:create]

  resources :shows, only: [] do
      resources :bookings
  end
  get 'home/index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

end
