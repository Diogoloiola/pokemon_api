require 'rails_helper'

RSpec.describe '/v1/atributes_for_battles', type: :request do
  let(:valid_attributes) do
    {
      atack: 11,
      stamina: 1,
      defense: 1,
      total_stamina: 1,
      cp_max: 1,
      hp_max: 1
    }
  end

  let(:invalid_attributes) do
    {
      atack: '',
      stamina: 1,
      defense: 1,
      total_stamina: 1,
      cp_max: 1
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      AtributeForBattle.create! valid_attributes
      get v1_atributes_for_battles_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      atributes_for_battle = AtributeForBattle.create! valid_attributes
      get v1_atributes_for_battle_url(atributes_for_battle), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new AtributeForBattle' do
        expect do
          post v1_atributes_for_battles_url,
               params: { atributes_for_battle: valid_attributes }, headers: valid_headers, as: :json
        end.to change(AtributeForBattle, :count).by(1)
      end

      it 'renders a JSON response with the new v1_atributes_for_battle' do
        post v1_atributes_for_battles_url,
             params: { atributes_for_battle: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new AtributeForBattle' do
        expect do
          post v1_atributes_for_battles_url,
               params: { atributes_for_battle: invalid_attributes }, as: :json
        end.to change(AtributeForBattle, :count).by(0)
      end

      it 'renders a JSON response with errors for the new v1_atributes_for_battle' do
        post v1_atributes_for_battles_url,
             params: { atributes_for_battle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          atack: 1,
          stamina: 2,
          defense: 3,
          total_stamina: 4,
          cp_max: 5,
          hp_max: 6
        }
      end

      it 'updates the requested v1_atributes_for_battle' do
        atributes_for_battle = AtributeForBattle.create! valid_attributes
        patch v1_atributes_for_battle_url(atributes_for_battle),
              params: { atributes_for_battle: new_attributes }, headers: valid_headers, as: :json
        atributes_for_battle.reload

        expect(atributes_for_battle.atack).to eql(1)
        expect(atributes_for_battle.stamina).to eql(2)
        expect(atributes_for_battle.defense).to eql(3)
        expect(atributes_for_battle.total_stamina).to eql(4)
        expect(atributes_for_battle.cp_max).to eql(5)
        expect(atributes_for_battle.hp_max).to eql(6)
      end

      it 'renders a JSON response with the v1_atributes_for_battle' do
        atributes_for_battle = AtributeForBattle.create! valid_attributes
        patch v1_atributes_for_battle_url(atributes_for_battle),
              params: { atributes_for_battle: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the v1_atributes_for_battle' do
        atributes_for_battle = AtributeForBattle.create! valid_attributes
        patch v1_atributes_for_battle_url(atributes_for_battle),
              params: { atributes_for_battle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested v1_atributes_for_battle' do
      atributes_for_battle = AtributeForBattle.create! valid_attributes
      expect do
        delete v1_atributes_for_battle_url(atributes_for_battle), headers: valid_headers, as: :json
      end.to change(AtributeForBattle, :count).by(-1)
    end
  end
end
