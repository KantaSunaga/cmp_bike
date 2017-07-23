require 'rails_helper'

RSpec.describe InquiryController, type: :controller do
  describe "index" do
    subject {get "index"}
    #newするだけのメソッドはどうしたらいいの？
    it "@inquiryが作られていること" do
      subject
      expect(assigns(:inquiry).class).to eq Inquiry.new.class
    end
  end

  describe "index" do
    inquiry_params = {"email" => "sunagakannta6@gmail.com",
                      "name" => "テスとたろう",
                      "message" => "テスト"}
    subject{post :confirm, params:{inquiry: inquiry_params}}
    it "@inquiryが作られていること"do
      subject
      expect(assigns(:inquiry).email).to eq inquiry_params["email"]

    end
    it "inquiryが存在していたら、confirmにrenderすること" do
      subject
      expect(response).to render_template "confirm"
    end
    it "inquiry.emailが存在しなかったら、indexにrenderすること" do
      inquiry_params = {"email" => "a",
                        "name" => nil,
                        "message" => "a"}
      post :confirm, params:{inquiry: inquiry_params}
      expect(response).to render_template "index"
    end
    it "inquiry.nameが存在しなかったら、indexにrenderすること" do
      inquiry_params = {"email" => "a",
                        "name" => nil,
                        "message" => "a"}
      post :confirm, params:{inquiry: inquiry_params}
      expect(response).to render_template "index"
    end
  end

  describe "thanks" do
    inquiry_params = {"email" => "sunagakannta6@gmail.com",
                      "name" => "テスとたろう",
                      "message" => "テスト"}
    it "@inquiryが作られていること" do
      post :thanks,params:{inquiry: inquiry_params}
      mail_tmp = assigns(:inquiry)
      expect(mail_tmp.name).to eq inquiry_params["name"]
    end
    it "メールが送信されていること" do
      mail = ActionMailer::Base.deliveries.count
      post :thanks,params:{inquiry: inquiry_params}
      expect(ActionMailer::Base.deliveries.count).to eq mail + 1
    end
  end
end
