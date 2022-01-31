require 'rails_helper'

RSpec.describe V1::AtributesForBattlesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/atributes_for_battles').to route_to('v1/atributes_for_battles#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/v1/atributes_for_battles/1').to route_to('v1/atributes_for_battles#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/v1/atributes_for_battles').to route_to('v1/atributes_for_battles#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/atributes_for_battles/1').to route_to('v1/atributes_for_battles#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/atributes_for_battles/1').to route_to('v1/atributes_for_battles#update', id: '1',
                                                                                                  format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/atributes_for_battles/1').to route_to('v1/atributes_for_battles#destroy', id: '1',
                                                                                                    format: :json)
    end
  end
end
