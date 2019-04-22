require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include Devise::Test::ControllerHelpers #include test for devise with helper of devise
  before(:each) do
    #request.env["HTTP_ACCEPT"] = 'application/json'
    #Design patterns
    @request.env["devise.mapping"] = Devise.mappings[:user] #mapping devise
    @current_user = FactoryBot.create(:user)
    @tasks = FactoryBot.create(:task)
    sign_in @current_user
  end
  # is permited access devise index authenticated
  describe "as a Guest" do
    subject { get :index }
    context "#index" do
        it "responds successfully" do
          @current_user
          expect(subject).to be_success
        end
        it "responds a 200 response" do
          @current_user
          expect(subject).to have_http_status(200)
        end
    end
  end

  describe "as Logged user" do
      it "#show" do
        #it is necessary authenticated in devise
        @current_user
        get :show, params: {id: @tasks.id}
        expect(response).to render_template(:show)
      end
      it 'Route' do
        is_expected.to route(:get, '/tasks').to(action: :index)
       end
  end

  describe "POST #create" do
    before(:each) do
      @tasks = attributes_for(:task, user: @current_user )
      post :create, params: {task: @tasks}
      expect(response).to redirect_to(Task.last)
    end
  end


  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json' #set all with json
    end

    context "user is of the task" do
      it "returns http success" do
        task = create(:task, user: @current_user) #create task
        delete :destroy, params: {id: task.id} #delete task
        expect(response).to have_http_status(:success) #redirect
      end
    end
  end


  describe "PUT #update" do
    before(:each) do
      @new_task_attributes = attributes_for(:task)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "updates the requested categories" do
      before(:each) do
        task = create(:task, user: @current_user)
        put :update, params: {id: task.id, task: @new_task_attributes}
        expect(response).to have_http_status(:success) #redirect
      end
    end
  end
end
