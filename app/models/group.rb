class Group < ApplicationRecord
  include ImageUploader::Attachment(:icon)

  # Associations
  belongs_to :user

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
