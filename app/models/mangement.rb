class Mangement < ApplicationRecord
validates :password, length: { minimum: 10 }
validates :email, presence: true
  def self.user?(user_param)
    user = Mangement.find_by(email: user_param[:email], password: user_param[:password])
    return user if user
    return false
  end
end
