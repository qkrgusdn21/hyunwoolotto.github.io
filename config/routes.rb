Rails.application.routes.draw do
  
  root 'lotto#index'

  get 'lotto/show' => 'lotto#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
