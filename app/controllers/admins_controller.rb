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
    Roadbike.create_bike_from_csv(params[:csv_file])
  end
  private
  def check_file_params
    params.permit(:csv_file)
  end
end
