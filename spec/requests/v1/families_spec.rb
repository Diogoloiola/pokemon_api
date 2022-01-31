require 'rails_helper'

RSpec.describe '/v1/families', type: :request do
  let(:valid_attributes) do
    {
      cross_gen: true,
      generation: 110
    }
  end

  let(:invalid_attributes) do
    {
      cross_gen: false,
      generation: 110
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Family.create! valid_attributes
      get v1_families_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      family = Family.create! valid_attributes
      get v1_family_url(family), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Family' do
        expect do
          post v1_families_url,
               params: { family: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Family, :count).by(1)
      end

      it 'renders a JSON response with the new v1_family' do
        post v1_families_url,
             params: { family: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Family' do
        expect do
          post v1_families_url,
               params: { family: invalid_attributes }, as: :json
        end.to change(Family, :count).by(0)
      end

      it 'renders a JSON response with errors for the new v1_family' do
        post v1_families_url,
             params: { family: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          cross_gen: true,
          generation: 111
        }
      end

      it 'updates the requested v1_family' do
        family = Family.create! valid_attributes
        patch v1_family_url(family),
              params: { family: new_attributes }, headers: valid_headers, as: :json
        family.reload
        # expect(family.cross_gen).to eql?(false)
        # expect(family.generation).to eql(111)
      end

      it 'renders a JSON response with the v1_family' do
        family = Family.create! valid_attributes
        patch v1_family_url(family),
              params: { family: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the v1_family' do
        family = Family.create! valid_attributes
        patch v1_family_url(family),
              params: { family: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested v1_family' do
      family = Family.create! valid_attributes
      expect do
        delete v1_family_url(family), headers: valid_headers, as: :json
      end.to change(Family, :count).by(-1)
    end
  end
end
