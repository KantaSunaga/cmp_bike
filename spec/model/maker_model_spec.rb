require 'rails_helper'

RSpec.describe Maker, type: :model do
  describe "create_maker_return_maker_id" do
    it 'makerがtrekでyearが２０１７だった場合id 1が戻ってくる' do
      maker = 'Trek'
      year = 2017
      expect(Maker.create_maker_return_maker_id(maker, year)).to eq 1
    end
  end
end
