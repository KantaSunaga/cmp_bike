require 'rails_helper'



RSpec.describe SizesController, type: :controller do
  describe "index" do
    it "@sizeがあること" do
      user = create :mangement
      session[:id] = user.id
      get :index
      expect(assigns(:sizes).length).to eq Size.all.count
    end
  end
  describe "show" do
    it "showに遷移すること" do
      user = create :mangement
      session[:id] = user.id
      get :show,{id: user.id}
      expect(response).to render_template "show"
    end
  end

  describe "new" do
    it "@sizeが存在していること" do
      user = create :mangement
      session[:id] = user.id
      get :new
      expect(assigns(:sizes)).to eq  nil
    end
    it "newに遷移すること" do
      user = create :mangement
      session[:id] = user.id
      get :new
      expect(response).to render_template "new"
    end
  end
  describe "edit" do
    it "editに遷移すること" do
      user = create :mangement
      session[:id] = user.id
      get :edit,{id: user.id}
      expect(response).to render_template "edit"
    end
  end
  xdescribe "create" do
    it "保存されていること" do
      user = create :mangement
      session[:id] = user.id
      year = create :year
      maker = create :maker,{year_id: year.id}
      create :roadbike,{maker_id: maker.id}
      number = Size.all.count
      post :create,size: attributes_for(:size),session:{id: user.id}
      expect(Size.all.count).to eq number + 1
    end
  end
  xdescribe "destroy" do
    it "消されること" do
      user = create :mangement
      year = create :year
      maker = create :maker,{year_id: year.id}
      bike = create :roadbike,{maker_id: maker.id}
      size = create :size,{roadbike_id: bike.id}
      number = Size.all.count
      delete :destroy,{id: size.id},session:{id: user.id}
      expect(Size.all.count).to eq number - 1
    end
  end

  xdescribe "update" do
    it "updateできること" do
      year = create :year
      user = create :mangement
      maker = create :maker,{year_id: year.id}
      bike = create :roadbike,{maker_id: maker.id}
      size = create :size,{roadbike_id: bike.id}
      session[:id] = user.id
      put :edit,params:{id:size.id,size: 50,min_height: 120,max_height: 150, weight: 10.8},session:{id:user.id}
      expect(Size.find(size.id).min_height).to eq 120
    end
  end
end
