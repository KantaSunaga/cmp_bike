require 'rails_helper'

RSpec.describe ThisIsForBeginnerController, type: :controller do

  describe "GET #home" do
    subject {get :home}
    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end

    it "GET #homeを叩いたら、画面遷移が実行されること" do
     subject
     expect(response).to render_template :home
    end

    #obj-idの違いみたいなものはどうやってテストするのか
    it "@bike_infoがRoadebikeクラスである事" do
      subject
      @bike_info = Roadbike.new
      hoge = assigns(:bike_info)
      expect(hoge.maker_id).to eq @bike_info.maker_url
    end

    it "@makerがすべてのメーカーを持っていること" do
      subject
      expect(assigns(:maker)).to eq Maker.all
    end
  end

  describe "GET #result" do
    before do
      subject{get :result ,params: attributes_for(:this_is_for_beginer_controller)}
    end
    it "returns http success" do
      subject
      expect(response).to have_http_status(:success)
    end
    it "200を返すこと" do
      subject
      expect(response.status).to eq(200)
    end

    xit "resultを呼び出せていること" do
      subject
      expect(response).to render_template :result
    end

    it "＠bikeに検索結果が入っていること" do
      subject
      expect(assigns(:bike)).to eq 'hoge'
    end

  end
end
