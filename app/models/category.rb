class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :description, presence: true

   # Kaminari Pagination
   paginates_per 5
end
