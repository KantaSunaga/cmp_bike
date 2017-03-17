require 'rails_helper'

RSpec.describe Maker, type: :model do
  describe 'self.cretae_maker_return_maker_id' do
    Maker.delete_all
   it 'makerがTrek,yearが2017だったら1を返すこと' do
     maker_name = "Trek"
     year = 2017
     Maker.cretae_maker_return_maker_id(maker_name, year)
    #  Maker.find_by(maker_name:"Trek")
    #  m.count
     expect(Maker.all.count).to eq 1
     binding.pry
   end
  end

end
