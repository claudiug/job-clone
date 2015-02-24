require 'rails_helper'

describe ProfilesController, type: :controller do

  describe "GET show" do
    it "returns http success" do
      u = create(:user)
      get :show, id: u.id
      expect(response).to have_http_status(:success)
    end

    it 'render the proper view' do
      u = create(:user)
      get :show, id: u.id
      expect(respond_to).to render_template 'show'
    end
  end
end