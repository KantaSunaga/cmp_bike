require 'rails_helper'

RSpec.describe "Mangements", type: :request do
  describe "GET /mangements" do
    it "works! (now write some real specs)" do
      get mangements_path
      expect(response).to have_http_status(200)
    end
  end
end
