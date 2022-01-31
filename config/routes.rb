Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :pokemons
    resources :families
    resources :atributes_for_battles
    get 'pokemons/family/:id', to: 'pokemons#family'
  end
end
