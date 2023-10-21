require 'rails_helper'
icon = 'https://cdn.wikimg.net/en/zeldawiki/images/c/ca/TLoZ_Link_Blocking_Artwork_2.png'
RSpec.feature 'Groups index', type: :feature do
  describe 'Viewing Groups Page' do
    before(:each) do
      @user = User.create(full_name: 'admin', email: 'mcjthiongo@gmail.com', password: '123456')
      @user.save
      login_as(@user, scope: :user)
      @category1 = Group.create!(name: 'Example Category 1',
                                 icon:, user: @user)
      @category2 = Group.create!(name: 'Example Category 2',
                                 icon:, user: @user)
      @transaction1 = Expense.create!(name: 'Example transaction 1', amount: 24, author: @user, group: @category1)
      @transaction2 = Expense.create!(name: 'Example transaction 2', amount: 50, author: @user, group: @category1)
      @transaction3 = Expense.create!(name: 'Example transaction 3', amount: 30, author: @user, group: @category2)
      visit root_path
    end

    scenario 'display category names' do
      expect(page).to have_content('Example Category 1')
      expect(page).to have_content('Example Category 2')
    end

    scenario 'display category  total amount and monthly budget' do
      expect(page.html).to have_content('24')
      expect(page.html).to have_content('30')
    end
  end
end
