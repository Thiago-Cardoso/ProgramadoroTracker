require 'rails_helper'

RSpec.describe ConfigurationTaskController, type: :controller do
  include Devise::Test::ControllerHelpers #include test for devise with helper of devise
before(:each) do
  #request.env["HTTP_ACCEPT"] = 'application/json'
  #Design patterns
  @request.env["devise.mapping"] = Devise.mappings[:user] #mapping devise
  @current_user = FactoryBot.create(:user)
  @configuration_tasks = FactoryBot.create(:configuration_task)
  sign_in @current_user   
  end
  # is permited access devise index authenticated
    describe "as a Guest" do
    context "#index" do
        it "responds successfully" do
        @current_user   
        get :index
        expect(response).to be_success
        end
    end 

    it "responds a 200 response" do
        @current_user   
        get :index
        expect(response).to have_http_status(200)
      end
   end

   describe "as Logged user" do
        it "#show" do 
          #it is necessary authenticated in devise
          @current_user   
          get :show, params: {id: @configuration_tasks.id}
          expect(response).to render_template(:show)
        end
        it 'Route' do
          is_expected.to route(:get, '/configuration_task').to(action: :index)
         end
    end

    
    describe "PUT #update" do
      before(:each) do
        @new_configuration_task_attributes = attributes_for(:configuration_task)
        request.env["HTTP_ACCEPT"] = 'application/json'
      end
  
      context "updates the requested categories" do
        before(:each) do
          configuration_task = create(:configuration_task, user: @current_user)
          put :update, params: {id: configuration_task.id, configuration_task: @new_configuration_task_attributes}
          expect(response).to have_http_status(:success) #redirect
        end
      end      
    end

end
    
