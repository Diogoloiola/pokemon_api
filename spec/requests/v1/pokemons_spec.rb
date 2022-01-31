require 'rails_helper'

RSpec.describe '/v1/pokemons', type: :request do
  let(:family) { create(:family) }
  let(:atribute_for_battle) { create(:atribute_for_battle) }

  let(:valid_attributes) do
    {
      name: 'Bulbasaur',
      evolved: 0,
      url_image: 1,
      evolution_stage: 1,
      legendary: 0,
      aquireable: 1,
      spawns: 1,
      regional: 0,
      raidable: 0,
      hatchable: 5,
      shiny: 0,
      nest: 1,
      is_new: 0,
      not_gettable: 0,
      future_evolve: 0,
      type_one: 'grass',
      type_two: 'poison',
      atribute_for_battle_id: atribute_for_battle.id,
      family_id: family.id
    }
  end

  let(:invalid_attributes) do
    {
      name: 'Bulbasaur',
      evolved: 0,
      url_image: 1,
      evolution_stage: 1,
      legendary: 0,
      aquireable: 1,
      spawns: 1,
      regional: 0,
      raidable: 0,
      hatchable: 5,
      shiny: 0,
      nest: 1,
      is_new: 0,
      not_gettable: 0,
      future_evolve: 0,
      type_one: 'grass',
      type_two: 'poison',
      atribute_for_battle_id: atribute_for_battle.id,
      family_id: nil
    }
  end
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Pokemon.create! valid_attributes
      get v1_pokemons_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pokemon = Pokemon.create! valid_attributes
      get v1_pokemon_url(pokemon), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Pokemon' do
        expect do
          post v1_pokemons_url,
               params: { pokemon: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Pokemon, :count).by(1)
      end

      it 'renders a JSON response with the new v1_pokemon' do
        post v1_pokemons_url,
             params: { pokemon: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Pokemon' do
        expect do
          post v1_pokemons_url,
               params: { pokemon: invalid_attributes }, as: :json
        end.to change(Pokemon, :count).by(0)
      end

      it 'renders a JSON response with errors for the new v1_pokemon' do
        post v1_pokemons_url,
             params: { pokemon: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Bulbasaur',
          evolved: 1,
          url_image: 1,
          evolution_stage: 1,
          legendary: 0,
          aquireable: 1,
          spawns: 1,
          regional: 0,
          raidable: 0,
          hatchable: 5,
          shiny: 0,
          nest: 1,
          is_new: 0,
          not_gettable: 0,
          future_evolve: 0,
          type_one: 'grass',
          type_two: 'poison',
          atribute_for_battle_id: atribute_for_battle.id,
          family_id: family.id
        }
      end

      it 'updates the requested v1_pokemon' do
        pokemon = Pokemon.create! valid_attributes
        patch v1_pokemon_url(pokemon),
              params: { pokemon: new_attributes }, headers: valid_headers, as: :json
        pokemon.reload
        expect(pokemon.evolved).to eql(1)
      end

      it 'renders a JSON response with the v1_pokemon' do
        pokemon = Pokemon.create! valid_attributes
        patch v1_pokemon_url(pokemon),
              params: { pokemon: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json; charset=utf-8'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the v1_pokemon' do
        pokemon = Pokemon.create! valid_attributes
        patch v1_pokemon_url(pokemon),
              params: { pokemon: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested v1_pokemon' do
      pokemon = Pokemon.create! valid_attributes
      expect do
        delete v1_pokemon_url(pokemon), headers: valid_headers, as: :json
      end.to change(Pokemon, :count).by(-1)
    end
  end
end
