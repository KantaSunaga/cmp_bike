class AdminsController <ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :checked_user?, only: [:index, :logout, :csv,]

  def login
    @mangement = Mangement.new
  end

  def check
    user = Mangement.user?(check_login_params)
    if user == false
      redirect_to admin_login_path
    elsif user.temporary_flag == true
      session[:id] = user.id
      flash[:result] = "仮パスワードを変更してください"
      redirect_to "/mangements/#{user.id}/edit"
    else
       session[:id] = user.id
       redirect_to admin_index_path
    end
  end

  def index
    @user = Mangement.find_by(id: session[:id])
  end

  def forget_password_form
    @mangement = Mangement.new
  end

  def make_tmp_password
    if @user = Mangement.find_by(email: check_remake_password_param[:email])
      tmp_password = rand(1000000000..9999999999)
      @user.update(password: tmp_password,temporary_flag: true)
      @user.save
      ApplicationMailer.tmp_password(@user).deliver_now
    end
    flash[:result] = "登録されたアドレスへメールが送信されました。"
    redirect_to "/admin/login"
  end

  def logout
    session[:id] = nil
    redirect_to this_is_for_beginner_home_path
  end

  def csv
  end

  def import_csv
    result = Roadbike.create_bike_from_csv(params[:csv_file])
    if result.class == "String".class
      flash[:failed] = "#{result}"
      render :csv
    else
      flash[:bike] = "自転車が#{result[:bike]}件追加されました"
      flash[:color] = "カラーが#{result[:color]}件追加されました"
      flash[:wehight] = "サイズが#{result[:wehight]}件追加されました"
    end
  end
  private
    def checked_user?
      redirect_to admin_login_path if session[:id].blank?
    end

  def check_login_params
    params.require(:mangement).permit(:email, :password)
  end

  def check_remake_password_param
      params.require(:mangement).permit(:email)
  end
end
