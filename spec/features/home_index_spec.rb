require 'rails_helper'

RSpec.feature 'home index', type: :feature do
  before(:each) do
    visit '/'
  end

  scenario 'display login and sigup button and logo' do
    expect(page).to have_button('log in')
    expect(page).to have_button('Sign up')
  end

  scenario 'login button takes to login page' do
    click_button('log in')
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'signup button takes to registor page' do
    click_button('Sign up')
    expect(page).to have_current_path(new_user_registration_path)
  end
end
