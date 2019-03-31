require 'rails_helper'

RSpec.describe Task, type: :model do

  it 'is valid with description, user_id, category_id' do
    task = create(:task)
    expect(task).to be_valid
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:category_id) }
  end

  #test association between user and configuration
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
  end

end
