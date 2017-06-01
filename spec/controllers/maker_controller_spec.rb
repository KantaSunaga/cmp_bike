require 'rails_helper'

RSpec.describe MakersController, type: :controller do
  describe "mkaer" do
    let(:year){create :year}
    let(:maker){create :maker,{year_id: year.id}}
    let(:user){create :mangement}
    describe "index" do
      it "indexへ遷移すること" do
        get :index,session:{id: user.id}
        expect(response).to  render_template "index"
      end
      it "@makersが存在していること" do
        get :index,session:{id: user.id}
        expect(assigns(:makers).count).to eq Maker.all.count
      end
      it "sessionがないと入れないこと" do
        get :index
        expect(response).to redirect_to admin_login_path
      end
    end
    describe "show" do
      it "showへ遷移すること" do
        year
        maker
        user
        get :show,params:{id:maker.id},session:{id:user.id}
        expect(response).to render_template "show"
        expect(assigns(:maker).maker_name).to eq Maker.find(maker.id).maker_name
      end
      it "sessionがないと追い出されること" do
        year
        maker
        user
        get :show,params:{id:maker.id}
        expect(response).to redirect_to admin_login_path
      end
    end
    describe "new" do
      it "newに遷移すること" do
        user
        get :new,session:{id:user.id}
        expect(response).to render_template "new"
      end
      it "newのインスタンスが正しいこと" do
        user
        get :new,session:{id:user.id}
        expect(assigns(:maker).maker_name).to eq nil
        expect(assigns(:year).count).to eq Year.all.count
      end
      it "sessionがないと追い出されること" do
        get :new
        expect(response).to redirect_to admin_login_path
      end
    end
    describe "edit" do
      it "editへ遷移すること" do
        year
        maker
        user
        get :edit,params:{id:maker.id},session:{id:user.id}
        expect(response).to render_template "edit"
      end
      it "インスタンスが正しいこと" do
        year
        maker
        user
        get :edit,params:{id:maker.id},session:{id:user.id}
          expect(assigns(:maker).maker_name).to eq Maker.find(maker.id).maker_name
      end
      it "sessionがないと弾かれること" do
        year
        maker
        user
        get :edit,params:{id:maker.id}
        expect(response).to redirect_to admin_login_path
      end
    end
    describe "create" do
      it "作られること" do
        year
        user
        need_params = attributes_for(:maker,{year_id:year.id})
        number = Maker.all.count
        post :create,params:{maker:need_params},session:{id:user.id}
        expect(Maker.all.count).to eq number + 1
      end
    end
    describe "update" do
      it "更新されること" do
        year
        maker
        user
        post :update,params:{id:maker.id,maker:attributes_for(:maker,{year_id:year.id,maker_name: "谷田"})},session:{id:user.id}
        expect(Maker.find(maker.id).maker_name).to eq "谷田"
      end
    end
    describe "destroy" do
      it "消えること" do
        year
        maker
        user
        delete :destroy, params:{id:maker.id},session:{id: user.id}
        expect(Maker.find_by(id:maker.id)).to eq nil
      end
      it "sessionがないと消せないこと" do
        year
        maker
        user
        delete :destroy, params:{id:maker.id}
        expect(response).to redirect_to admin_login_path
      end
    end
  end
end
