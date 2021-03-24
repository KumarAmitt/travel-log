class Travel < ApplicationRecord

  belongs_to :user

  has_many :travel_groups, dependent: :destroy
  has_many :groups, through: :travel_groups

  validates :purpose, presence: true
  validates :distance, presence: true

  scope :recent_first, -> { order('created_at DESC') }
end
