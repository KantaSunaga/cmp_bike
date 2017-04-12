require 'rails_helper'

RSpec.describe "colors/new", type: :view do
  before(:each) do
    assign(:color, Color.new(
      :color => "MyString",
      :roadebike_id => "",
      :picture => "MyString"
    ))
  end

  it "renders new color form" do
    render

    assert_select "form[action=?][method=?]", colors_path, "post" do

      assert_select "input#color_color[name=?]", "color[color]"

      assert_select "input#color_roadebike_id[name=?]", "color[roadebike_id]"

      assert_select "input#color_picture[name=?]", "color[picture]"
    end
  end
end
