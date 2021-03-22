class Group < ApplicationRecord

  belongs_to :user

  has_many :travel_groups, dependent: :destroy
  has_many :travels, through: :travel_groups
end
