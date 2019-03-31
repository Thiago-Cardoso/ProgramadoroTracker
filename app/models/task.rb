class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :category_id, :user_id , :description, presence: true
end
