require 'rails_helper'

RSpec.describe MakersHelper, type: :helper do
  describe "find_year" do
    it "見つかること" do 
      year = create :year
      expect(find_year(year.id)).to eq 2017

    end
  end
end
