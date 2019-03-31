require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  
  before :each do
    User.make(email: 'trovador182@gmail.com', password: '123456')
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with:  'trovador182@gmail.com'
      fill_in 'Password', with:  '123456'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end

  it 'Visit index page' do
      visit(categories_path)
      expect(page).to have_current_path(categories_path)
  end

end