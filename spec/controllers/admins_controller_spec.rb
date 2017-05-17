require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  describe "index" do
    it "index遷移すること" do
      get "/admin/index"
      expect(response).to ridirect_to :index
    end
  end
end
