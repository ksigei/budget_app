# new user can sign up
require 'rails_helper'

feature 'new user' do
    scenario 'can sign up' do
        visit new_user_registration_path
        fill_in 'Email', with: 'kip@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'

        click_button 'Sign up'

        expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
end
