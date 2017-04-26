class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]
  # GET /admins
  # GET /admins.json
  def index

  end
end
