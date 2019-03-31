require 'rails_helper'

RSpec.describe ConfigurationTask, type: :model do

  it 'is valid with duration, duration_break, duration_break_long, long_pause_delay, have_song' do
    configuration_task = create(:configuration_task)
    expect(configuration_task).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:duration_break) }
    it { is_expected.to validate_presence_of(:duration_break_long) }
    it { is_expected.to validate_presence_of(:long_pause_delay) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  #test association between user and configuration
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

end
