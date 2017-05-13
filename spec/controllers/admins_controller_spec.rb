require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  let(:user) { create(:user) }
  describe "index" do
    expect(response).to render_template :index
  end
end
