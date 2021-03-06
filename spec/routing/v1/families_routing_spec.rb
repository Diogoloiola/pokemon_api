require 'rails_helper'

RSpec.describe V1::FamiliesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/families').to route_to('v1/families#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/v1/families/1').to route_to('v1/families#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/v1/families').to route_to('v1/families#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/families/1').to route_to('v1/families#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/families/1').to route_to('v1/families#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/families/1').to route_to('v1/families#destroy', id: '1', format: :json)
    end
  end
end
