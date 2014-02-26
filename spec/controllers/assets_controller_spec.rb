require 'spec_helper'

describe AssetsController do
  let(:me) { create :me }

  before { sign_in me }

  context "GET index" do
    it 'assign all assets' do
      assets = [build_stubbed(:asset)]
      Asset.should_receive(:all).and_return(assets)
      get :index
      expect(assigns(:assets)).to eq(assets)
    end

    it 'response success' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET new' do
    it 'assign new asset' do
      get :new
      asset = assigns(:asset)
      expect(asset).to_not be_persisted
    end

    it 'response success' do
      get :new
      expect(response).to be_success
    end
  end

  context 'POST create' do
    let(:success_params) { {asset: {name: "NAME", file: fixture_file_upload('./spec/fixtures/file.text')}} }

    let(:do_request) { post :create, success_params }

    it 'create new asset' do
      do_request
      expect(Asset.count).to eq 1
    end

    it 'redirect to home page' do
      do_request
      expect(response).to redirect_to("/")
    end
  end
end
