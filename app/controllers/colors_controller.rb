class ColorsController < ApplicationController
  before_action :set_color, only: [:show, :edit, :update, :destroy]
  before_action :checked_user?

  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.all
  end

  # GET /colors/1
  # GET /colors/1.json
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
    @roadbikes = Roadbike.all
  end

  # GET /colors/1/edit
  def edit
    @roadbikes = Roadbike.all
  end

  # POST /colors
  # POST /colors.json
  def create
    @color = Color.new(color_params)
    if @color.save
      redirect_to @color, notice: 'Color was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /colors/1
  # PATCH/PUT /colors/1.json
  def update
    if @color.update(color_params)
      redirect_to @color, notice: 'Color was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  def destroy
    @color.destroy
    redirect_to colors_url, notice: 'Color was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def checked_user?
      redirect_to admin_login_path if session[:id].blank?
    end

    def set_color
      @color = Color.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:color, :roadbike_id, :picture,:sub_color,:sub_color2,:official_color)
    end
end
