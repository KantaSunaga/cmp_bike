class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def update_user_info(user)
    @user = user
    mail(:subject => 'ユーザー情報が更新されました',
          to: @user.email)
  end

  def tmp_password(user)
    @user = user
    mail(:subject => '仮パスワードを発行しました',
          to: @user.email)
  end
end
