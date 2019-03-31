require 'rails_helper'

RSpec.describe Category, type: :model do
    it 'is valid with description' do
      category = create(:category)
      expect(category).to be_valid
    end

    context 'Validates' do 
      #equals method up https://github.com/thoughtbot/shoulda-matchers
      it { is_expected.to validate_presence_of(:description) }
    end
end
