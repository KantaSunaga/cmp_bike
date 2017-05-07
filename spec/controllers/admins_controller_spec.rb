require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all admins as @admins" do
      admin = Admin.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:admins)).to eq([admin])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin as @admin" do
      admin = Admin.create! valid_attributes
      get :show, params: {id: admin.to_param}, session: valid_session
      expect(assigns(:admin)).to eq(admin)
    end
  end

  describe "GET #new" do
    it "assigns a new admin as @admin" do
      get :new, params: {}, session: valid_session
      expect(assigns(:admin)).to be_a_new(Admin)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin as @admin" do
      admin = Admin.create! valid_attributes
      get :edit, params: {id: admin.to_param}, session: valid_session
      expect(assigns(:admin)).to eq(admin)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin" do
        expect {
          post :create, params: {admin: valid_attributes}, session: valid_session
        }.to change(Admin, :count).by(1)
      end

      it "assigns a newly created admin as @admin" do
        post :create, params: {admin: valid_attributes}, session: valid_session
        expect(assigns(:admin)).to be_a(Admin)
        expect(assigns(:admin)).to be_persisted
      end

      it "redirects to the created admin" do
        post :create, params: {admin: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Admin.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin as @admin" do
        post :create, params: {admin: invalid_attributes}, session: valid_session
        expect(assigns(:admin)).to be_a_new(Admin)
      end

      it "re-renders the 'new' template" do
        post :create, params: {admin: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin" do
        admin = Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin: new_attributes}, session: valid_session
        admin.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin as @admin" do
        admin = Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin: valid_attributes}, session: valid_session
        expect(assigns(:admin)).to eq(admin)
      end

      it "redirects to the admin" do
        admin = Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin: valid_attributes}, session: valid_session
        expect(response).to redirect_to(admin)
      end
    end

    context "with invalid params" do
      it "assigns the admin as @admin" do
        admin = Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin: invalid_attributes}, session: valid_session
        expect(assigns(:admin)).to eq(admin)
      end

      it "re-renders the 'edit' template" do
        admin = Admin.create! valid_attributes
        put :update, params: {id: admin.to_param, admin: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin" do
      admin = Admin.create! valid_attributes
      expect {
        delete :destroy, params: {id: admin.to_param}, session: valid_session
      }.to change(Admin, :count).by(-1)
    end

    it "redirects to the admins list" do
      admin = Admin.create! valid_attributes
      delete :destroy, params: {id: admin.to_param}, session: valid_session
      expect(response).to redirect_to(admins_url)
    end
  end

end
