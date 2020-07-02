class User < ApplicationRecord
  has_many :task

  validates :name, presence: true,
                   length: { in: 1..10 }
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /\A\w((-\w)|(\.\w))*\@[A-Za-z0-9]((\.|-)[A-Za-z0-9])*\.[A-Za-z0-9]\z/ }
  validates :password, presence: true, 
                       length: { in: 6..20 },
                       confirmation: true
  # message: "Password must be at least 8 characters long, at least 1 English letter" }
end