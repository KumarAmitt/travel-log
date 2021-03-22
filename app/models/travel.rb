class Travel < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :travel_groups, dependent: :destroy
  has_many :groups, through: :travel_groups
end
