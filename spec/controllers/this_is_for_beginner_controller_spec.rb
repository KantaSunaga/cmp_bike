require 'rails_helper'

RSpec.describe ThisIsForBeginnerController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #result" do
    it "returns http success" do
      get :result
      expect(response).to have_http_status(:success)
    end
  end

end
