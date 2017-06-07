require 'rails_helper'

RSpec.describe Mangement, type: :model do
  describe "user?" do
    context "成功パターン" do
      it "存在したら、mangement_objを返すこと" do
        user_info = create :mangement
        user_param = {email: user_info.email, password: user_info.password}
        expect(Mangement.user?(user_param).user_name).to eq user_info.user_name
        expect(Mangement.user?(user_param).email).to eq user_info.email
        expect(Mangement.user?(user_param).password).to eq user_info.password
      end
    end
    context "失敗パターン" do
      it "存在しない場合" do
        user_param = {email: "hoge@hohehohe.com", password: "hogehohe"}
        expect(Mangement.user?(user_param)).to eq false
      end
    end
  end
end
