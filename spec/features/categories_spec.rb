require 'rails_helper'

RSpec.feature "Feature Categories", type: :feature, js: true do
  before do 
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  it '#index' do
    visit(categories_path)
    expect(page).to have_current_path(categories_path)
  end

  it '#create' do
    visit(new_category_path)
    fill_in('category[description]', with: Faker::Name.name)
    click_button("Enviar")
    expect(page).to have_content("Categoria cadastrada com sucesso!.")
  end

end