class User < ApplicationRecord
  include Omniauthenticable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github]



  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, length: { maximum: 100, too_long: "-> %{count} characters is the maximum allowed", minimum: 2, too_short: "-> %{count} characters is the minimum allowed" }
  validates :email, length: { maximum: 100, too_long: "-> %{count} characters is the maximum a" }

  has_many :tasks
  has_many :categories
  has_one :configuration_task
end
