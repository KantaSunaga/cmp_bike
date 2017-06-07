require "rails_helper"

RSpec.describe InquiryMailer , :type => :mailer do
  describe "inquiry_mailer" do
    it "メールが送信されること" do
      inquiry = { email: "sunagakannta6@gmail.com",
                  name: "テスとたろう",
                  message: "テスト"}
      mail_count = ActionMailer::Base.deliveries.count
      InquiryMailer.received_email(inquiry).deliver_now
      expect(ActionMailer::Base.deliveries.count).to eq mail_count + 1
    end
  end
end
