require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers #include test for devise with helper of devise
before(:each) do
  #request.env["HTTP_ACCEPT"] = 'application/json'
  #Design patterns
  @request.env["devise.mapping"] = Devise.mappings[:user] #mapping devise
  @current_user = FactoryBot.create(:user)
  @categories = FactoryBot.create(:category)
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
          get :show, params: {id: @categories.id}
          expect(response).to render_template(:show)
        end
        it 'Route' do
          is_expected.to route(:get, '/categories').to(action: :index)
         end
      end


      describe "POST #create" do
        before(:each) do
          @categories = attributes_for(:category, user: @current_user )
          post :create, params: {category: @categories}
        end
    
        it "Redirect to new categories" do
          expect(response).to have_http_status(302)
          expect(response).to redirect_to("/categories/#{Category.last.id}")
        end
      end


      describe "DELETE #destroy" do
        before(:each) do
          request.env["HTTP_ACCEPT"] = 'application/json' #set all with json
        end
   
        context "User is of the category" do
          it "returns http success" do
            category = create(:category, user: @current_user) #create category
            delete :destroy, params: {id: category.id} #delete category
            expect(response).to have_http_status(:success) #redirect
          end
        end
      end

      describe "PUT #update" do
        before(:each) do
          @new_category_attributes = attributes_for(:category)
          request.env["HTTP_ACCEPT"] = 'application/json'
        end
    
        context "updates the requested categories" do
          before(:each) do
            category = create(:category, user: @current_user)
            put :update, params: {id: category.id, category: @new_category_attributes}
            expect(response).to have_http_status(:success) #redirect
          end
        end      
      end

end
    
