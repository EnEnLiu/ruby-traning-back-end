class User < ApplicationRecord
  has_many :task

  validates :name, presence: true
  validates :email, presence: true, 
                    uniqueness: true
  validates :password, presence: true, 
                       length: { in: 6..20 },
                       confirmation: true
  # message: "Password must be at least 8 characters long, at least 1 English letter" }
end
