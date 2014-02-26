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

    it 'new assets' do
      visit root_path
      click_link 'New asset'
      fill_in 'Name', with: 'Video'
      attach_file 'File', './spec/fixtures/file.text'
      click_button 'Create Asset'
      expect(page).to have_css('.asset', text: 'Video')
    end
  end
end
