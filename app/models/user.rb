class User < ApplicationRecord
  # Associations
  has_many :groups, foreign_key: :user_id, dependent: :destroy
  has_many :expenses, foreign_key: :author_id, dependent: :destroy

  # Devise configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Attributes
  attribute :full_name, :string
  attribute :email, :string

  # Validations
  validates :full_name, presence: true, length: { maximum: 250 }
  validates :email, presence: true, length: { maximum: 250 }
end
