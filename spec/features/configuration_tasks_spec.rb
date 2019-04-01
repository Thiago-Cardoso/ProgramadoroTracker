require 'rails_helper'

RSpec.feature "Feature ConfigurationTasks", type: :feature, js: true do
  before do 
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  # it '#index' do
  #   visit(configuration_task_path)
  #   expect(page).to have_current_path(configuration_task_path)
  # end

  # it '#create' do
    # visit(new_configuration_task_path)
    # select('1', :from => 'template', :visible => 'false')
    # select '1', from: 'Template'
    # fill_in('configuration_task_duration', with: "25")
    # fill_in('configuration_task[duration_break]', with: "5")
    # fill_in('configuration_task[duration_break_long]', with: "15")
    # fill_in('configuration_task[long_pause_delay]', with: "4")
    # check('configuration_task[have_song]')
    # click_button("Cadastrar")
    # expect(page).to have_content("Configuração realizada com sucesso!.")
  # end


end
