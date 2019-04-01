require 'rails_helper'

RSpec.feature "Categories", type: :feature, js: true do
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

  # it '#update' do
  #   visit(new_category_path)
  #   fill_in('category[description]', with: Faker::Name.name)
  #   click_button("Enviar")


  #   visit(edit_category_path)
  #   fill_in('category[description]', with: Faker::Name.name)
  #   click_button("Enviar")
  #   expect(page).to have_content("Categoria cadastrada com sucesso!.")
  # end

  # it 'click button delete' do
  #   visit(categories_path)
  #   # find('.deletar').click_link('Deletar')
  #   expect(page).to have_css('.deletar')
  #   # expect(find("#my-div").find("h1")).to have_content("Yes!")
  #   # expect(page).to have_content("Você tem Certeza?")
  # end

end