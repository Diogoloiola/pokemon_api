require 'rails_helper'

RSpec.describe V1::PokemonsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/pokemons').to route_to('v1/pokemons#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/v1/pokemons/1').to route_to('v1/pokemons#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/v1/pokemons').to route_to('v1/pokemons#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/pokemons/1').to route_to('v1/pokemons#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/pokemons/1').to route_to('v1/pokemons#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/pokemons/1').to route_to('v1/pokemons#destroy', id: '1', format: :json)
    end
  end
end
