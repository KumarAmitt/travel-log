class Group < ApplicationRecord

  has_one_attached :icon

  belongs_to :user

  has_many :travel_groups, dependent: :destroy
  has_many :travels, through: :travel_groups
end
