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
      year = create :year
      maker=create :maker,{year_id: year.id}
      roadbike = create :roadbike,{maker_id: maker.id}
      size = create :size,{roadbike_id: roadbike.id}
      user = create :mangement
      session[:id] = user.id
      get :show,params:{id: size.id},session:{id: user.id}
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
      year = create :year
      maker=create :maker,{year_id: year.id}
      roadbike = create :roadbike,{maker_id: maker.id}
      size = create :size,{roadbike_id: roadbike.id}
      user = create :mangement
      session[:id] = user.id
      user = create :mangement
      session[:id] = user.id
      get :edit,params:{id: size.id}
      expect(response).to render_template "edit"
    end
  end
  describe "create" do
    it "失敗したらnewにrendeerされること" do
      user = create :mangement
      year = create :year
      maker = create :maker,{year_id: year.id}
      roadbike = create :roadbike,{maker_id: maker.id}
      post :create,params:{size: attributes_for(:size)},session:{id: user.id}
      expect(response).to render_template "new"
    end
    it "成功したら作成されること" do
      user = create :mangement
      year = create :year
      maker = create :maker,{year_id: year.id}
      roadbike = create :roadbike,{maker_id: maker.id}
      number = Size.all.count
      post :create,params:{size:{roadbike_id:roadbike.id}},session:{id:user.id}
      expect(Size.all.count).to eq number + 1
    end
  end
  describe "destroy" do
    it "消されること" do
      user = create :mangement
      year = create :year
      maker = create :maker,{year_id: year.id}
      bike = create :roadbike,{maker_id: maker.id}
      size = create :size,{roadbike_id: bike.id}
      delete :destroy,params:{id: size.id},session:{id: user.id}
      expect(Size.find_by(id: size.id)).to eq nil
    end
      it "indexへ遷移すること" do
      user = create :mangement
      year = create :year
      maker = create :maker,{year_id: year.id}
      bike = create :roadbike,{maker_id: maker.id}
      size = create :size,{roadbike_id: bike.id}
      delete :destroy,params:{id: size.id},session:{id: user.id}
      expect(response).to redirect_to  sizes_path
    end
  end

  describe "update" do
    it "updateできること" do
      year = create :year
      user = create :mangement
      maker = create :maker,{year_id: year.id}
      bike = create :roadbike,{maker_id: maker.id}
      size = create :size,{roadbike_id: bike.id}
      need_param = attributes_for(:size,{min_height:120,roadbike_id:bike.id})
      session[:id] = user.id
      put :update,params:{id:size.id,size: need_param},session:{id:user.id}
      expect(Size.find(size.id).min_height).to eq 120
    end
  end
end
