require 'rails_helper'

RSpec.describe "sizes/index", type: :view do
  before(:each) do
    assign(:sizes, [
      Size.create!(
        :size => 2,
        :min_height => 3,
        :max_height => 4,
        :weight => 5
      ),
      Size.create!(
        :size => 2,
        :min_height => 3,
        :max_height => 4,
        :weight => 5
      )
    ])
  end

  it "renders a list of sizes" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
