class Maker < ApplicationRecord
  has_many :bikes, dependent: :destroy
  def self.cretae_maker_return_maker_id(maker_name,year)
    maker_info = Maker.create(year: year, maker_name: maker_name)
    return maker_info.id
  end 
end
