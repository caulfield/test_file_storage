require 'spec_helper'

describe 'Assets' do
  context 'reading' do
    it 'requires authentication' do
      visit assets_path
      expect(page).to have_text 'Sign in'
      expect(page).to_not have_css '.assets'
    end

    it 'show all assets' do
      auth_me!
      2.times { create :asset }
      visit assets_path
      expect(page).to have_css('.asset', count: 2)
    end
  end

  context 'managing' do
    before { auth_me! }

    def create_new_asset
      visit root_path
      click_link 'New asset'
      fill_in 'Name', with: 'Video'
      attach_file 'File', './spec/fixtures/file.txt'
      click_button 'Create Asset'
    end

    it 'new assets' do
      create_new_asset
      expect(page).to have_css('.asset', text: 'Video')
    end

    it 'downloading new asset' do
      create_new_asset
      click_link 'Save'
      expect(page.body).to eq "1\n"
    end
  end
end
