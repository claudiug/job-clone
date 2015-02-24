require 'rails_helper'

describe UsersController, type: :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'render the proper view' do
     get :new
      expect(respond_to).to render_template 'new'
    end
  end

  describe "POST #create" do
    it 'creates a new user with proper data' do
      expect{
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end
  end
end