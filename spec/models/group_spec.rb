# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(full_name: 'admin', email: 'user@example.com', password: 'password') }
  after(:each) do
    user.destroy if user.persisted?
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      icon = 'https://cdn.wikimg.net/en/zeldawiki/images/c/ca/TLoZ_Link_Blocking_Artwork_2.png'
      category = Group.new(name: 'Example Category', icon:, user:)
      expect(category).to be_valid
      user.destroy if user.persisted?
    end

    it 'is not valid without a name' do
      category = Group.new(user:)
      expect(category).to_not be_valid
    end

    it 'is not valid without an icon' do
      category = Group.new(name: 'Example Category', user:)
      expect(category).to_not be_valid
    end
  end
end
