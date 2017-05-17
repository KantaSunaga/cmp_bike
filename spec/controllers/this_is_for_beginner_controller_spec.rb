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
      Roadbike.delete_all
      year_info = create :year
      maker_info = create :maker,{year_id: year_info.id}
      bike_info =create :roadbike,{maker_id: maker_info.id}
      create :size,{roadbike_id: bike_info.id}
      create :color,{roadbike_id: bike_info.id}
    end
    let(:bike_result){Roadbike.where(bike_name: "domane 1")}
    subject{get :result ,params: attributes_for(:this_is_for_beginer_controller)}
#---------------------------------------------------------
    it "＠bikeに検索結果が入っていること" do
      subject
      expect(assigns(:bike).length).to eq bike_result.length
    end
   it "@colorが正しいこと" do
     subject
     expect(assigns(:color)).to eq "red"
   end
  #------------------------------------------------------
 end

 describe "detail" do
   before do
     year_info = create :year
     maker_info = create :maker,{year_id: year_info.id}
     bike_info = create :roadbike,{maker_id: maker_info.id}
     create :size,{roadbike_id: bike_info.id}
     create :color, {roadbike_id: bike_info.id}
      #  urlを動的にするにはどうしたら良いか
   end
   it "@bikeが存在していること" do
     bike = Roadbike.last
      expect(get :detail ,id: bike.id )
     expect(assigns(:bike)).to eq bike
   end
   it "@sizeが存在していること" do
     bike = Roadbike.last
      expect(get :detail ,id: bike.id )
     expect(assigns(:size)).to eq bike.sizes
   end
   it "@colorが存在していること" do
     bike = Roadbike.last
      expect(get :detail ,id: bike.id )
     expect(assigns(:color)).to eq bike.colors
   end
   it "@official_colorが存在していること" do
     bike = Roadbike.last
      expect(get :detail ,id: bike.id )
      official = []
      Color.where(roadbike_id: bike.id).each do |color|
        official << color.official_color
      end
     expect(assigns(:official_color)).to eq official[0]
   end
 end
end
