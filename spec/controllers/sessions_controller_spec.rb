require 'rails_helper'

describe SessionsController, type: :controller do

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
end
