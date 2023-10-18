class Expense < ApplicationRecord
  # Associations
  belongs_to :group
  belongs_to :author, class_name: 'User'

  # Attributes
  attribute :last_name, :string
  attribute :amount, :float

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }
end
