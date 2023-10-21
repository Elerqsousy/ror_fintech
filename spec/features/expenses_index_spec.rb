require 'rails_helper'
icon = 'https://cdn.wikimg.net/en/zeldawiki/images/c/ca/TLoZ_Link_Blocking_Artwork_2.png'

RSpec.feature 'expenses index', type: :feature do
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
      visit group_expenses_path(@category1)
    end

    scenario 'display total amount of transactions in category' do
      expect(page.html).to have_content('24')
    end
  end
end
