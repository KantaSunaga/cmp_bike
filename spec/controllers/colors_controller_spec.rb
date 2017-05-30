require 'rails_helper'

RSpec.describe ColorsController, type: :controller do
  describe "ColorsController" do
    let(:user){create :mangement}
    let(:year){create :year}
    let(:maker){create :maker,{year_id: year.id}}
    let(:bike){create :roadbike,{maker_id: maker.id}}
    let(:color){create :color,{roadbike_id: bike.id}}
    describe "index" do
      it "@colorが存在していること" do
        user
        count = Color.all.count
        get :index,session:{id: user.id}
        expect(assigns(:colors).count).to eq count
      end
      it "indexへ遷移すること" do
        user
        get :index,session:{id: user.id}
        expect(response).to render_template "index"
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
        bike
        color
        get :show,params:{id:color.id},session:{id: user.id}
        expect(response).to render_template "show"
      end
      it "@colorがあること" do
        year
        maker
        bike
        color
        get :show,params:{id:color.id},session:{id: user.id}
        expect(assigns(:color).color).to eq color.color
      end
      it "sessionがないと入れないこと" do
        year
        maker
        bike
        color
        get :show,params:{id:color.id}
        expect(response).to redirect_to admin_login_path
      end
    end

    describe "new" do
      it "@colorがあること" do
        user
        get :new,session:{id: user.id}
          expect(assigns(:color).color).to eq nil
          expect(assigns(:color).sub_color).to eq nil
          expect(assigns(:color).sub_color2).to eq nil
      end
      it "newへ遷移すること" do
        user
        get :new,session:{id: user.id}
        expect(response).to render_template "new"
      end
    end

    describe "edit" do
      it "@colorが存在していること" do
        year
        maker
        bike
        color
        get :edit,params:{id:color.id},session:{id: user.id}
        expect(assigns(:color).color).to eq color.color
      end
      it "editへ遷移すること" do
        year
        maker
        bike
        color
        get :edit,params:{id:color.id},session:{id: user.id}
        expect(response).to render_template "edit"
      end
    end
    xdescribe "create" do
      let(:need_params){attributes_for(:color,{roadebike_id: bike.id})}
        it "作られること" do
          user
          year
          maker
          bike
          number = Color.all.count
          post :create,params: need_params,session:{id: user.id}
          expect(Color.all.count).to eq number + 1
        end
      end
      xdescribe "update" do
        it "更新されること" do
          user
          year
          maker
          bike
          color
          put :update,params: attributes_for(:color,{color: "虹色"}),session:{id: user.id}
          expect(User.find(user.id).color).to eq "虹色"
        end
      end
      describe "destroy" do
        it "消されること" do
          user
          year
          maker
          bike
          color
          delete :destroy,params:{id: color.id},session:{id: user.id}
          expect(Color.find_by(id: color.id)).to eq nil
        end
      end
  end
end
