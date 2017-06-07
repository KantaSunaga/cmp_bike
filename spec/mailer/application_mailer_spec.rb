require "rails_helper"
RSpec.describe ApplicationMailer , :type => :mailer do
  describe "update_user_info" do
    it "送信されること" do
      user = create :mangement
      mail_count = ActionMailer::Base.deliveries.count
      ApplicationMailer.update_user_info(user).deliver_now
      expect(ActionMailer::Base.deliveries.count).to eq mail_count + 1
    end
  end
  describe "tmp_password" do
    it "送信されること" do
      user = create :mangement,{temporary_flag: true}
      mail_count = ActionMailer::Base.deliveries.count
      ApplicationMailer.tmp_password(user).deliver_now
      expect(ActionMailer::Base.deliveries.count).to eq mail_count + 1
    end
  end
end
