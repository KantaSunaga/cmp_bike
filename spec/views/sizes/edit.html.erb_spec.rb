require 'rails_helper'

RSpec.describe "sizes/edit", type: :view do
  before(:each) do
    @size = assign(:size, Size.create!(
      :size => 1,
      :min_height => 1,
      :max_height => 1,
      :weight => 1
    ))
  end

  it "renders the edit size form" do
    render

    assert_select "form[action=?][method=?]", size_path(@size), "post" do

      assert_select "input#size_size[name=?]", "size[size]"

      assert_select "input#size_min_height[name=?]", "size[min_height]"

      assert_select "input#size_max_height[name=?]", "size[max_height]"

      assert_select "input#size_weight[name=?]", "size[weight]"
    end
  end
end
