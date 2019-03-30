class Category < ApplicationRecord
  belongs_to :user
  #has_many :tasks
  validates :description, presence: true
end
