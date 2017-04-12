class Year < ApplicationRecord
  has_many :makers, dependent: :destroy
end
