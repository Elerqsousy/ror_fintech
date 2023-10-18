class User < ApplicationRecord
  # Associations
  has_many :groups, foreign_key: :user_id, dependent: :destroy

  # Devise configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Attributes
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string

  # Validations
  validates :first_name, presence: true, length: { maximum: 250 }
  validates :last_name, length: { maximum: 250 }
  validates :email, presence: true, length: { maximum: 250 }
end
