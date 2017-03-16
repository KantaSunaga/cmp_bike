require 'rails_helper'

RSpec.describe Series, type: :model do
  describe "create_series_return_serise_id" do
    it 'maker_id=1でseries_nameがRideだったら 1が戻ってくる' do
      maker_id = 1
      series_name = "Ride"
      expect(Series.create_series_return_series_id(maker_id, series_name)).to eq 1
    end
  end
end
