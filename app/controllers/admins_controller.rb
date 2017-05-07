class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index,:csv]
  # GET /admins
  # GET /admins.json
  def index
  end

  def csv
  end

  def import_csv
    p "________________________________________"
    pp check_file_params
    Roadbike.create_bike_from_csv(check_file_params)
  end
  private
  def check_file_params
    params.permit(:csv_file)
  end
end
