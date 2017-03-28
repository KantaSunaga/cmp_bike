require 'rails_helper'

RSpec.describe "sizes/new", type: :view do
  before(:each) do
    assign(:size, Size.new(
      :size => 1,
      :min_height => 1,
      :max_height => 1,
      :weight => 1
    ))
  end

  it "renders new size form" do
    render

    assert_select "form[action=?][method=?]", sizes_path, "post" do

      assert_select "input#size_size[name=?]", "size[size]"

      assert_select "input#size_min_height[name=?]", "size[min_height]"

      assert_select "input#size_max_height[name=?]", "size[max_height]"

      assert_select "input#size_weight[name=?]", "size[weight]"
    end
  end
end
