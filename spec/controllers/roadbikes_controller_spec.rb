require 'rails_helper'

RSpec.describe RoadbikesController, type: :controller do
  describe "index" do
    let(:user_info){create :mangement}
    subject{get :index,session: {id: user_info.id}}
    it "@bikeがあること" do
      subject
      expect(assigns(:bikes).count).to eq Roadbike.all.count
    end
    it "indexへ遷移すること" do
      subject
      expect(response).to render_template "index"
    end
    it "sessionnがなかったら弾かれること" do
      get :index
    end
  end
  describe "show" do
    let(:year){create :year}
    let(:maker){create :maker,{year_id: year.id}}
    let(:roadbike){create :roadbike,{maker_id: maker.id}}
    let(:user_info){create :mangement}
    subject{get :show,params:{id: roadbike.id},session:{id: user_info.id}}
    describe "set_bike" do
      it "@bikeがあること" do
        year
        maker
        roadbike

        subject
        expect(assigns(:bike).bike_name).to eq roadbike.bike_name
      end
      it "showへ遷移すること" do
        year
        maker
        roadbike
        user_info
        subject
        expect(response).to render_template "show"
      end
      it "sessionがないと入れないこと" do
        year
        maker
        roadbike
        get :show,params:{id: roadbike.id}
        expect(response).to redirect_to "/admin/login"
      end
    end
  end
    describe "new" do
      let(:user_info){create :mangement}
      subject{get :new,session: {id: user_info.id}}
      it "@bikeがあること" do
        subject
        expect(assigns(:bike).present?).to eq true
        expect(assigns(:component).present?).to eq true
        expect(assigns(:makers)).to eq Maker.all
      end
      it "newに遷移すること" do
        subject
        expect(response).to render_template "new"
      end
      it "セッションがないと弾かれること" do
        get :new
        expect(response).to redirect_to "/admin/login"
      end
    end
    describe "edit" do
      let(:year){create :year}
      let(:maker){create :maker,{year_id: year.id}}
      let(:roadbike){create :roadbike,{maker_id: maker.id}}
      let(:user_info){create :mangement}
      subject{get :edit,params:{id: roadbike.id},session:{id: user_info.id}}
      it "インスタンス変数が存在すること" do
        year
        maker
        user_info
        roadbike
        subject
        expect(assigns(:makers).count).to eq Maker.all.count
        expect(assigns(:roadbike).count).to eq Roadbike.all.count
        expect(assigns(:bike).present?).to eq true
        expect(assigns(:component).present?).to eq true
      end
      it "画面遷移すること" do
        year
        maker
        user_info
        roadbike
        subject
        expect(response).to render_template "edit"
      end
      it "sessionガナないと弾かれルコと" do
        year
        maker
        user_info
        roadbike
        get :edit,params:{id: roadbike.id}
      end
    end
    describe "create" do
      let(:year){create :year}
      let(:maker){create :maker,{year_id: year.id}}
      let(:create_param){attributes_for(:roadbike,{maker_id:maker.id})}
      let(:user_info){create :mangement}
      it "createされること" do
        year
        maker
        user_info
        number = Roadbike.all.count
        post :create,params: {roadbike: create_param},session: {id: user_info.id}
        expect( Roadbike.all.count).to eq number + 1
      end
    end
  describe "upadate" do
    let(:year){create :year}
    let(:maker){create :maker,{year_id: year.id}}
    let(:roadbike){create :roadbike,{maker_id: maker.id}}
    let(:user_info){create :mangement}
    let(:bike_param){attributes_for(:roadbike,{bike_name:"ヤマダ電機"})}
    it "失敗パターン" do
      year
      maker
      roadbike
      user_info
      put :update,params:{id: roadbike.id,roadbike: bike_param},session:{id:user_info.id}
      expect(response).to render_template "edit"
    end
    it "成功パターン" do
      year
      maker
      roadbike
      user_info
      put :update,params:{id:roadbike.id,roadbike:{bike_name:"ヤマダ電機"}},session:{id:user_info.id}
      expect(Roadbike.find(roadbike.id).bike_name).to eq "ヤマダ電機"
    end
  end

  describe "destroy" do
    let(:year){create :year}
    let(:maker){create :maker,{year_id: year.id}}
    let(:roadbike){create :roadbike,{maker_id: maker.id}}
    let(:user_info){create :mangement}
    it "成功したらindexに遷移することこと" do
      delete :destroy,params:{id: roadbike.id},session:{id: user_info.id}
      expect(response).to redirect_to roadbikes_path
    end
    it "消えること" do
      year
      maker
      roadbike
      user_info
      delete :destroy,params:{id: roadbike.id},session:{id: user_info.id}
      expect(Roadbike.find_by(id:roadbike.id)).to eq nil
    end
  end
end
