class InquiryMailer < ActionMailer::Base
  default from: "sunagakannta6@gmail.com"   # 送信元アドレス
  default to: "sunagakannta6@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    if inquiry.class.to_s == "Hash"
      @inquiry = {email: inquiry[:email],
                  name: inquiry[:name],
                  message: inquiry[:message]}
    else
      @inquiry = {email: inquiry.email,
                  name: inquiry.name,
                  message: inquiry.message}
    end
    mail(:subject => 'お問い合わせを承りました',
          bcc: "sunagakannta6@gmail.com",
          to: @inquiry[:email])
  end
end
