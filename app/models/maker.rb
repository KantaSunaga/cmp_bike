class Maker < ApplicationRecord
  belongs_to :year
  has_many :roadbikes, dependent: :destroy
end
