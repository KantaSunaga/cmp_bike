class InquiryMailer < ActionMailer::Base
  default from: "sunagakannta6@gmail.com"   # 送信元アドレス
  default to: "sunagakannta6@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました',
          bcc: "sunagakannta6@gmail.com",
          to: @inquiry.email)
  end

end
