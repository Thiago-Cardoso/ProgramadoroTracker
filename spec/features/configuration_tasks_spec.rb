require 'rails_helper'

RSpec.feature "ConfigurationTasks", type: :feature, js: true do
  before do 
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  # it '#index' do
  #   visit(configuration_task_path)
  #   expect(page).to have_current_path(configuration_task_path)
  # end

  it '#create' do
    visit(new_configuration_task_path)
    # fill_in('template', with: "1")
    # select('template', from: 'default 25 5 15 4')

    # find('.template').all(:css, 'option').find { |o| o.value == '1' }.select_option
    # page.select("1", from: 'template')

    # page.select 'default 25 5 15 4', from: 'template'

    # select('default 25 5 15 4', :from => 'template', visible: false)


    fill_in('configuration_task[duration]', with: "25")
    fill_in('configuration_task[duration_break]', with: "5")
    fill_in('configuration_task[duration_break_long]', with: "15")
    fill_in('configuration_task[long_pause_delay]', with: "4")
    check('configuration_task[have_song]')
    click_button("Cadastrar")
    expect(page).to have_content("Configuração realizada com sucesso!.")
  end


end
