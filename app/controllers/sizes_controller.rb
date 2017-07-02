class SizesController < ApplicationController
  before_action :set_size, only: [:show, :edit, :update, :destroy]
  before_action :checked_user?
  # GET /sizes
  # GET /sizes.json
  def index
    @sizes = Size.all
  end

  # GET /sizes/1
  # GET /sizes/1.json
  def show
  end

  # GET /sizes/new
  def new
    @size = Size.new
    @roadbikes = Roadbike.all
  end

  # GET /sizes/1/edit
  def edit
  end

  # POST /sizes
  # POST /sizes.json
  def create
    @size = Size.new(size_params)
    if @size.save
      redirect_to @size, notice: 'Size was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sizes/1
  # PATCH/PUT /sizes/1.json
  def update
    if @size.update(size_params)
       redirect_to @size, notice: 'Size was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /sizes/1
  # DELETE /sizes/1.json
  def destroy
    @size.destroy
    redirect_to sizes_url, notice: 'Size was successfully destroyed.'
  end

  private
  def checked_user?
    redirect_to admin_login_path if session[:id].blank?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      @size = Size.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params

      params.require(:size).permit(:size, :min_height, :max_height, :weight,:roadbike_id)
    end
end
