require 'rails_helper'

RSpec.describe "colors/index", type: :view do
  before(:each) do
    assign(:colors, [
      Color.create!(
        :color => "Color",
        :roadebike_id => "",
        :picture => "Picture"
      ),
      Color.create!(
        :color => "Color",
        :roadebike_id => "",
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of colors" do
    render
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
