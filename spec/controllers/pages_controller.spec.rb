require 'rails_helper'

RSpec.describe PagesController, type: :controller do
    include Devise::Test::ControllerHelpers #include test for devise with helper of devise
  before(:each) do
  #request.env["HTTP_ACCEPT"] = 'application/json'
  #Design patterns
  @request.env["devise.mapping"] = Devise.mappings[:user] #mapping devise
  @user = FactoryBot.create(:user)
  sign_in @user
  end

  describe "GET #home" do
    subject { get :home }
    it "returns http success" do
      @user
      expect(subject).to have_http_status(:success)
    end
    it "render the index template" do
  	  expect(subject).to render_template(:home)
  	end
  end

end
