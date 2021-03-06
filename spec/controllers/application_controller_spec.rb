require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  #わざと発生させるやり方がわからない
  xdescribe " _render_404" do
    let(:user){create :mangement}
    it "rooutingerrorが発生したら404へ飛ぶこと" do
      expect(Rails).to receive(:env).and_return('production'.inquiry)
      get roadbikes_path,params:{id:100000},session: {id:user.id}
      expect(response).to render_template "errors/404"
    end
  end
end
