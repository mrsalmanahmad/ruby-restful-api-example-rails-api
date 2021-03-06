require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
  describe 'GET #show' do
    let(:developer) { build :developer }
    let(:id) { Faker::Number.digit }
    let(:params) { {id: id} }

    before do
      allow(Developer).to receive(:find).with(id).and_return(developer)

      get :show, params: params
    end

    after do
      get :show, params: params
    end

    it 'finds the developer by its :id' do
      expect_any_instance_of(DevelopersController).to receive(:set_developer)
    end

    it 'assigns the requested developer as @developer' do
      expect(assigns(:developer)).to eq(developer)
    end

    it 'renders the developer as :json' do
      expect_any_instance_of(DevelopersController).to receive(:render).with(json: developer)
    end
  end
end
