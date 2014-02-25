require 'spec_helper'

describe 'Auhentication' do

  context 'new user signup' do
    it 'will create new user' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Email', with: 'newuser@example.com'
      fill_in 'user_password', with: 'password123'
      fill_in 'user_password_confirmation', with: 'password123'
      click_button 'Sign up'
      expect(page).to have_text 'You have signed up successfully.'
      expect(User.where(email: 'newuser@example.com').size).to eq 1
    end
  end

  context 'signin' do
    it 'successfully with right password' do
      visit root_path
      create :user, user_credentials
      fill_in 'Email', with: user_credentials[:email]
      fill_in 'Password', with: user_credentials[:password]
      click_button 'Sign in'
      expect(page).to have_text 'Signed in successfully.'
    end
  end

  context 'signout' do
    it 'successfully after sign out click' do
      me = create :me
      visit login_path(me.id)
      click_link 'Sign out'
      expect(page).to have_text 'You need to sign in or sign up before continuing.'
    end
  end
end
