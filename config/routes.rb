Rails.application.routes.draw do
  namespace :v1 do
    resources :families
  end
  namespace :v1, defaults: { format: :json } do
    resources :pokemons do
    end
    get 'pokemons/family/:id', to: 'pokemons#family'
  end
end
