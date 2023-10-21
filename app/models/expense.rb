class Expense < ApplicationRecord
  # Associations
  belongs_to :group
  belongs_to :author, class_name: 'User'

  # Attributes
  attribute :name, :string
  attribute :amount, :float

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }

  before_update :update_totals_on_decrement, if: :amount_changed?
  after_update :update_totals_on_increment, if: :amount_changed?
  after_create :update_totals_on_increment
  after_destroy :update_totals_on_decrement

  private

  def update_totals_on_increment
    author.increment!(:total, amount)
    group.increment!(:total, amount)
  end

  def update_totals_on_decrement
    author.decrement!(:total, amount)
    group.decrement!(:total, amount)
  end
end
