class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Attributes
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string

  # Validations
  validates :first_name, presence: true, length: { maximum: 250 }
  validates :last_name, presence: true, length: { maximum: 250 }
end
