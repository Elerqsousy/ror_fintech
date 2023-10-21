class Group < ApplicationRecord
  include ImageUploader::Attachment(:image)

  # Associations
  belongs_to :user
  has_many :expenses, foreign_key: :group_id, dependent: :destroy

  # Attributes
  attribute :name, :string
  attribute :image_data, :text
  attribute :icon, :text

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
