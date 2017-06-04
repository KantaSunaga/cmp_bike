require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  describe "login" do
    it "@mangementが存在していること" do
      @result = Mangement.new
      get :login
      expect(assigns(:mangement).password).to eq @result.password
      expect(assigns(:mangement).email).to eq @result.email
    end
  end

  describe "check" do
    subject{post :check, mangement: attributes_for(:mangement)}
    context "登録されているユーザーの場合" do
      let(:corect_user){create :mangement,{user_name: "テストたろう",temporary_flag: false}}
      let(:tmp_user){create :mangement,{user_name: "テストたろう",temporary_flag: true}}
      it "tmpflagがfalseの場合" do
        corect_user
        subject
        expect(response).to redirect_to admin_index_path
      end
      it "仮パスワードフラグがたっっていた場合、パスワード変更画面へ遷移すること" do
        tmp_user
        subject
        expect(response).to redirect_to "/mangements/#{tmp_user.id}/edit"
      end
    end
    context "登録されていないユーザーの場合" do
      let(:user){create :mangement,{email: "sasakji@tatta.com"}}
      it "登録されていないユーザーがログインしようとした場合ログイン画面へ戻ること" do
        post :check,params:{mangement:{email:"aaaa@gmail.aldkh",password:"a;hrga;rsgu"}}
        expect(response).to redirect_to admin_login_path
      end
    end
  end
  describe "index" do
    it "@user が存在していること" do
      user = create :mangement
      session[:id] = user.id
      get :index
      expect(assigns(:user).email).to eq user.email
      expect(assigns(:user).password).to eq user.password
    end
    it "sessionがないと入れないこと" do
      get :index
      expect(response).to redirect_to admin_login_path
    end
  end

  describe "forget_password_form" do
    it "@mangementが存在していること" do
      user = create :mangement
      session[:id] = user.id
      @mangement = Mangement.new
      get :forget_password_form
      expect(assigns(:mangement).password).to eq @mangement.password
      expect(assigns(:mangement).email).to eq @mangement.email
    end
    it "セッッションの有無によって影響されないこと" do
      @mangement = Mangement.new
      get :forget_password_form
      expect(assigns(:mangement).password).to eq @mangement.password
      expect(assigns(:mangement).email).to eq @mangement.email
    end
  end

  describe "make_tmp_password" do
    context "失敗パターン" do
      it "存在しないメールアドレスが、再発行を求めた場合" do
        user = create :mangement,{email: "aaa@aaa.om"}
        session[:id] = user.id
        post :make_tmp_password,mangement: attributes_for(:mangement)
        expect(Mangement.last.email).to eq user.email
        expect(response).to redirect_to admin_login_path
      end
      it "セッションが影響しないこと" do
        user = create :mangement,{email: "aaa@aaa.om"}
        session[:id] = user.id
        post :make_tmp_password,mangement: attributes_for(:mangement)
        expect(Mangement.last.email).to eq user.email
        expect(response).to redirect_to admin_login_path
      end
    end
    context "成功パターン" do
      it "存在するメールアドレスが、再発行を求めた場合" do
        user = create :mangement
        session[:id] = user.id
        post :make_tmp_password,mangement: attributes_for(:mangement)
        expect(Mangement.find_by(email: user.email).password.length).to eq 10
        expect(response).to redirect_to admin_login_path
      end
      it "セッションがない場合" do
          user = create :mangement
          post :make_tmp_password,mangement: attributes_for(:mangement)
          expect(Mangement.find_by(email: user.email).password.length).to eq 10
          expect(response).to redirect_to admin_login_path
      end
    end

    describe "logout" do
      context "セッションがあった場合" do
        it "セッションがなくなって、ビギナー画面に飛ばされること" do
          user = create :mangement
          session[:id] = user.id
          get :logout
          expect(session[:id]).to eq nil
          expect(response).to redirect_to this_is_for_beginner_home_path
        end
      end
      context "セッションがない場合" do
        it "ログイン画面に飛ばされること" do
          get :logout
          expect(response).to redirect_to admin_login_path
        end
      end
    end
  end
  xdescribe "import_csv" do
    it "成功したら、import_csvに飛べていること" do
      user = create :mangement
      file = fixture_file_upload("spec/fixtures/test.csv")
      post :import_csv,params:{mangement:{csv_file:file}},session:{id:user.id}
      expect(response).to render_templat "import_csv"
    end
    it "失敗したら、editへ飛ぶこと" do
      user = create :mangement
      file = fixture_file_upload("spec/fixtures/test.csv")
      post :import_csv,params:{mangement:{csv_file:file}},session:{id:user.id}
      expect(response).to render_templat "csv"
    end
  end
end
