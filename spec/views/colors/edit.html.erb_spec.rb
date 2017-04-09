require 'rails_helper'

RSpec.describe "colors/edit", type: :view do
  before(:each) do
    @color = assign(:color, Color.create!(
      :color => "MyString",
      :roadebike_id => "",
      :picture => "MyString"
    ))
  end

  it "renders the edit color form" do
    render

    assert_select "form[action=?][method=?]", color_path(@color), "post" do

      assert_select "input#color_color[name=?]", "color[color]"

      assert_select "input#color_roadebike_id[name=?]", "color[roadebike_id]"

      assert_select "input#color_picture[name=?]", "color[picture]"
    end
  end
end
