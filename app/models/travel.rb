class Travel < ApplicationRecord

  belongs_to :user

  has_many :travel_groups, dependent: :destroy
  has_many :groups, through: :travel_groups

  validates :purpose, presence: true
end
