class ConfigurationTask < ApplicationRecord
  belongs_to :user
  validates :user_id, :duration, :duration_break, :duration_break_long, :long_pause_delay, presence: true
end
