require 'rails_helper'

RSpec.describe MangementsController, type: :controller do
  describe "show" do
    it "showのテンプレートを呼ぶこと" do
      user = create :mangement
      session[:id] = user.id
      get :show,params:{id: user.id}
      expect(response).to render_template "show"
    end
  end

  describe "new" do
    it "newに遷移すること" do
      user = create :mangement
      session[:id] = user.id
      get :new
      expect(response).to render_template "new"
    end
    it "@mangementが存在していること" do
      user = create :mangement
      session[:id] = user.id
      mangement = Mangement.new
      get :new
      expect(assigns(:mangement).class).to eq mangement.class
    end
  end

  describe "create" do
    context "成功" do
      it "保存されること" do
        user = create :mangement
        number = Mangement.count
        post :create,params:{mangement: {user_name:"T中",email: "tata@tata.com",password:"12345678910"}},session:{id: user.id}
        expect(Mangement.all.count).to eq number + 1
      end
    end

    context "失敗" do
      it "editへ戻ること" do
        user = create :mangement
        post :create,params:{mangement:{user_name:"T中",email: "tata@tata.com",password:"1"}},session:{id:user.id}
        expect(response).to render_template "new"
      end
    end
  end
  describe "destoroy" do
    it "レコードが消えていること" do
      Mangement.delete_all
      user = create :mangement
      session[:id] = user.id
      user2 = create :mangement,{user_name: "user3",email: "tata@tata.com",password:"12345678910"}
      number = Mangement.all.count
      delete :destroy,params:{id: user2.id}
      expect(Mangement.all.count).to eq number - 1
    end
  end

  describe "update" do
    it "updateされること" do
      user = create :mangement
      put :update,params:{id: user.id ,mangement:{user_name: "ほげ山ほげたろう",email:"sunagakannta@gmail.com",password:"ldldldldldldld"}},session:{id: user.id}
      expect(Mangement.find(session[:id]).user_name).to eq "ほげ山ほげたろう"
    end
  end
end
