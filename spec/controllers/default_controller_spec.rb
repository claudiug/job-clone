require 'rails_helper'

describe DefaultController, type: :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'render the proper view' do
      get :index
      expect(respond_to).to render_template 'index'
    end
  end
end
