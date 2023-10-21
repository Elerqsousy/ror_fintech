# spec/models/payment_spec.rb

require 'rails_helper'
icon = 'https://cdn.wikimg.net/en/zeldawiki/images/c/ca/TLoZ_Link_Blocking_Artwork_2.png'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(full_name: 'admin', email: 'user@example.com', password: 'password') }
  after(:each) do
    user.destroy if user.persisted?
  end
  it 'is valid with valid attributes' do
    category = Group.create(name: 'Example Category',icon:, user:)
    payment = Expense.new(name: 'Example Payment', amount: 100.00, author: user, group: category)

    expect(payment).to be_valid
  end

  it 'is not valid without a name' do
    category = Group.create(name: 'Example Category',icon:, user:)
    payment = Expense.new(amount: 100.00, author: user, group: category)
    expect(payment).not_to be_valid
    expect(payment.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without an amount' do
    category = Group.create(name: 'Example Category',icon:, user:)
    payment = Expense.new(name: 'Example Payment', author: user, group: category)

    expect(payment).not_to be_valid
    expect(payment.errors[:amount]).to include("can't be blank")
  end

  it 'is not valid without an author' do
    category = Group.create(name: 'Example Category',icon:, user:)
    payment = Expense.new(name: 'Example Payment', amount: 100.00, group: category)

    expect(payment).not_to be_valid
    expect(payment.errors[:author]).to include('must exist')
  end

  it 'is not valid without a category' do
    payment = Expense.new(name: 'Example Payment', amount: 100.00, author: user)

    expect(payment).not_to be_valid
    expect(payment.errors[:group]).to include('must exist')
  end
end
