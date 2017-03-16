class Maker < ApplicationRecord
  has_many :bikes, dependent: :destroy
end
